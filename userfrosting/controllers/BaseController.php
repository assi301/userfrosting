<?php

namespace UserFrosting;

/**
 * BaseController Class
 *
 * The base controller class, from which all other controller classes should derive.  Implements some common sitewide routes.
 *
 * All controller classes require the main application to be injected in via the controller.
 * @package UserFrosting
 * @author Alex Weissman
 * @link http://www.userfrosting.com/navigating/#structure
 */
class BaseController {

    /**
     * @var UserFrosting The UserFrosting framework application to inject into this controller.
     */
    protected $_app =         null; 

    /**
     * Create a new BaseController object.
     *
     * @param UserFrosting $app The main UserFrosting app.
     */
    public function __construct($app){
        $this->_app = $app;
    }
    
    /**
     * Renders the 404 error page.
     *
     * This page shows the 404 "page not found" page.
     * Request type: GET
     */
    public function page404(){
        $this->_app->render('errors/404.twig');
    }

    /**
     * Renders the database error page.
     *
     * This page shows up when there has been an error connecting to the database.
     * UserFrosting needs to connect to the database for just about every request.
     * Request type: GET
     */    
    public function pageDatabaseError(){
        $this->_app->render('errors/database.twig');
    }
    
    /**
     * Render a JS file containing client-side configuration data (paths, etc)
     *
     * Many client-sided Javascript functions need some basic information about how the site is configured.
     * Rather than hard-code it in Javascript, this automatically generates a JS array, called "site",
     * which contains this configuration information.
     * Request type: GET
     */        
    public function configJS(){
        $this->_app->response->headers->set("Content-Type", "application/javascript");
        $this->_app->response->setBody("var site = " . json_encode(
            [
                "uri" => [
                    "public" => $this->_app->site->uri['public']
                ],
                "debug" => $this->_app->config('debug')
            ]
        ));
    }
    
    /**
     * Selects and renders the CSS for the current user's theme.
     *
     * Since user themes are configured dynamically, this provides a way for UF to automatically load the appropriate
     * CSS file for the current user's theme.
     * Request type: GET
     * @todo Support for minification
     */      
    public function themeCSS(){
        $this->_app->response->headers->set("Content-Type", "text/css");
        $css_include = $this->_app->config('themes.path') . "/" . $this->_app->user->getTheme() . "/css/theme.css";
        $this->_app->response->setBody(file_get_contents($css_include));
    }    
    
    /**
     * Render the alert stream as a JSON object.
     *
     * The alert stream contains messages which have been generated by calls to `MessageStream::addMessage` and `MessageStream::addMessageTranslated`.
     * Request type: GET
     * @see \Fortress\MessageStream
     */    
    public function alerts(){
        if ($this->_app->alerts){
            echo json_encode($this->_app->alerts->getAndClearMessages());
        }
    }
    
    /**
     * Generates a new captcha for the user registration form.
     *
     * This generates a captcha as a base 64 string, to be placed inside the src attribute of an html image tag.
     * @author r3wt
     * @return string The captcha, encoded as a base 64 string.
     * @todo Move this to the data model!
     */    
    public function generateCaptcha(){
    
        $md5_hash = md5(rand(0,99999));
        $security_code = substr($md5_hash, 25, 5);
        $enc = md5($security_code);
        // Store the generated captcha to the session
        $_SESSION['userfrosting']['captcha'] = $enc;
    
        $width = 150;
        $height = 30;
    
        $image = imagecreatetruecolor(150, 30);
    
        //color pallette
        $white = imagecolorallocate($image, 255, 255, 255);
        $black = imagecolorallocate($image, 0, 0, 0);
        $red = imagecolorallocate($image,255,0,0);
        $yellow = imagecolorallocate($image, 255, 255, 0);
        $dark_grey = imagecolorallocate($image, 64,64,64);
        $blue = imagecolorallocate($image, 0,0,255);
    
        //create white rectangle
        imagefilledrectangle($image,0,0,150,30,$white);
    
        //add some lines
        for($i=0;$i<2;$i++) {
            imageline($image,0,rand()%10,10,rand()%30,$dark_grey);
            imageline($image,0,rand()%30,150,rand()%30,$red);
            imageline($image,0,rand()%30,150,rand()%30,$yellow);
        }

        // RandTab color pallette
        $randc[0] = imagecolorallocate($image, 0, 0, 0);
        $randc[1] = imagecolorallocate($image,255,0,0);
        $randc[2] = imagecolorallocate($image, 255, 255, 0);
        $randc[3] = imagecolorallocate($image, 64,64,64);
        $randc[4] = imagecolorallocate($image, 0,0,255);

        //add some dots
        for($i=0;$i<1000;$i++) {
            imagesetpixel($image,rand()%200,rand()%50,$randc[rand()%5]);
        }    
        
        //calculate center of text
        $x = ( 150 - 0 - imagefontwidth( 5 ) * strlen( $security_code ) ) / 2 + 0 + 5;
    
        //write string twice
        imagestring($image,5, $x, 7, $security_code, $black);
        imagestring($image,5, $x, 7, $security_code, $black);
        //start ob
        ob_start();
        imagepng($image);
    
        //get binary image data
        $data = ob_get_clean();
        //return base64
        return 'data:image/png;base64,'.chunk_split(base64_encode($data)); //return the base64 encoded image.
    }    
}
