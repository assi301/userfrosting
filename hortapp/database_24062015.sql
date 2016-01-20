-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Temps de generació: 24-06-2015 a les 08:08:57
-- Versió del servidor: 5.5.43
-- Versió de PHP: 5.4.41-0+deb7u1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de dades: `hortapp`
--
CREATE DATABASE `hortapp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hortapp`;

-- --------------------------------------------------------

--
-- Estructura de la taula `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='prototype users table' AUTO_INCREMENT=45 ;

--
-- Bolcant dades de la taula `user`
--

INSERT INTO `user` (`id`, `login`, `email`, `password`) VALUES
(41, 'login', 'example@example.com', '428821350e9691491f616b754cd8315fb86d797ab35d843479e732ef90665324'),
(42, 'login2', 'test@test.com', 'd7100492c03a237d810dfb65048c4a4311f879738aed63c72cc77b7b79d9ac0b'),
(43, 'login3', 'test3@test.com', '7ac377fd43f82caf7408a581acaf1f29a90e00a3f717876966a282d07101810e'),
(44, 'login4', 'test4@test.com', '7ac377fd43f82caf7408a581acaf1f29a90e00a3f717876966a282d07101810e');
--
-- Base de dades: `hortapp_template`
--
CREATE DATABASE `hortapp_template` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hortapp_template`;

-- --------------------------------------------------------

--
-- Estructura de la taula `afectada`
--

CREATE TABLE IF NOT EXISTS `afectada` (
  `id_planta` int(11) NOT NULL,
  `id_plaga` int(11) NOT NULL,
  `detalls` varchar(4000) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id_planta`,`id_plaga`),
  KEY `id_plaga` (`id_plaga`),
  KEY `id_planta` (`id_planta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcant dades de la taula `afectada`
--

INSERT INTO `afectada` (`id_planta`, `id_plaga`, `detalls`, `user`) VALUES
(1, 1, 'Problemàtic principalment en els brots, ja que s''alimenten de la sàvia de les fulles.', 0),
(1, 4, 'Sofre en pols o pulveritzat a baixes temperatures. Repetir aplicació als 10 dies', 0),
(2, 1, 'Després de dies d''humitat es probable que apareguen. Mantindre una població que no resulte danyina.', 0),
(4, 3, 'Amb llet desnatada al 5% es pot pulveritzar quan es donen les condicions per a evitar l''aparició.', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `bancal`
--

CREATE TABLE IF NOT EXISTS `bancal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL COMMENT 'Nom del bancal per a distingir-lo d''altres.',
  `superficie` int(11) NOT NULL COMMENT 'superf. en m2',
  `ubicacio` varchar(200) NOT NULL,
  `detalls` varchar(2000) DEFAULT NULL COMMENT 'detalls del camp, reg, estat anterior, etc.',
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='un BANCAL es composa de PARCELA' AUTO_INCREMENT=4 ;

--
-- Bolcant dades de la taula `bancal`
--

INSERT INTO `bancal` (`id`, `nom`, `superficie`, `ubicacio`, `detalls`, `user`) VALUES
(1, 'vera', 222, 'asdfasdf', 'Esuna parcela onflictiva\r\n', 0),
(2, 'massamagrell', 1500, 'Alboraia', 'Terra fèrtil i bla bla bla', 0),
(3, 'Huerta mayor', 1000, 'Vall de almonacid', 'Terreny de perals abandonat 20 anys enrere', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `cultiu`
--

CREATE TABLE IF NOT EXISTS `cultiu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planta` int(11) NOT NULL COMMENT 'id de la planta cultivada',
  `data_ini` date NOT NULL COMMENT '1/3/X o 1/9/X',
  `data_fi` date NOT NULL COMMENT '1/3/X o 1/9/X',
  `parcela` int(11) NOT NULL COMMENT 'id parcela',
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`),
  KEY `planta` (`planta`),
  KEY `parcela` (`parcela`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='mostra inici i fi de cultiu d''una planta en una parcela' AUTO_INCREMENT=4 ;

--
-- Bolcant dades de la taula `cultiu`
--

INSERT INTO `cultiu` (`id`, `planta`, `data_ini`, `data_fi`, `parcela`, `user`) VALUES
(1, 1, '2015-05-13', '2015-07-31', 1, 0),
(2, 3, '2015-01-01', '2015-01-21', 1, 0),
(3, 2, '2015-02-04', '2015-03-11', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parcela` int(11) NOT NULL COMMENT 'id de la parcela relativa a l''event',
  `title` varchar(400) NOT NULL,
  `start` date NOT NULL,
  `detalls` varchar(4000) DEFAULT NULL,
  `realitzada` tinyint(1) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`),
  KEY `parcela` (`parcela`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `events`
--

INSERT INTO `events` (`id`, `parcela`, `title`, `start`, `detalls`, `realitzada`, `user`) VALUES
(1, 1, 'crema de rastrojos', '2015-05-06', 'Vestibulum eget mattis sem! Integer eget nibh lobortis, convallis quam volutpat.\r\n', 1, 0),
(2, 1, 'rega + mula', '2015-05-07', 'Sed purus libero, accumsan id egestas in, placerat eget dui. Proin eget posuere.\r\n', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `familia`
--

CREATE TABLE IF NOT EXISTS `familia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL COMMENT 'Nom científic de la família',
  `noms_varios` varchar(400) DEFAULT NULL COMMENT 'Per si hi ha altres noms de la família',
  `detalls` varchar(4000) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Bolcant dades de la taula `familia`
--

INSERT INTO `familia` (`id`, `nom`, `noms_varios`, `detalls`, `user`) VALUES
(1, 'Solanaceae', NULL, 'Les plantes d''aquesta família requerixen una gran quantitat de sol per a tindre un bon desenvolupament.', 0),
(2, 'Leguminosae', NULL, 'Les leguminoses ajuden a recuperar la terra i a fixar nitrògen.', 0),
(3, 'Cucurbitaceae', NULL, 'Carabasses, melons...', 0),
(4, 'Asteraceae', 'Compostes', 'Lletugues, carxofes...', 0),
(5, 'Brassicaceae', 'Cruciferae, cruciferas', 'Cols de fulla, repollo', 0),
(6, 'Apiaceae', 'Umbeliferes', 'Api, julivert, carlota...', 0),
(7, 'Amaryllidaceae', NULL, 'Cebes, alls, bulbos', 0),
(8, 'Quenopodiaceae', NULL, 'Espinaques, remolatxa, ', 0),
(9, 'Amaranthaceae', NULL, 'Bledes', 0),
(13, 'prova', NULL, NULL, 0),
(14, 'prova', NULL, NULL, 0),
(15, 'prova', NULL, NULL, 0),
(16, 'prova', NULL, NULL, 0),
(17, 'prova', 'vario1, vario2, vario3', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `grup`
--

CREATE TABLE IF NOT EXISTS `grup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del grup, de l''1 al 4',
  `nom` varchar(30) NOT NULL,
  `noms_varios` varchar(400) DEFAULT NULL COMMENT 'Per si hi ha varios noms per a designar a cadascun dels grups de rotació',
  `detalls` varchar(2000) DEFAULT NULL COMMENT 'Detalls del grup, quines famílies hi pertanyen, etc.',
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT=' L''id de les files marca l''ordre de rotaci' AUTO_INCREMENT=5 ;

--
-- Bolcant dades de la taula `grup`
--

INSERT INTO `grup` (`id`, `nom`, `noms_varios`, `detalls`, `user`) VALUES
(1, 'Arrel', '', ' (Zanahorias, Remolachas, Rabanitos etc.). Consumidoras de Potasio en capas más profundas de la tierra.', 0),
(2, 'Fulla', '', '(Lechugas, Espinacas, Coles etc.). Consumidoras de Nitrógeno en capas superficiales de la tierra.', 0),
(3, 'Leguminosa', '', '(Judías, Habas, Guisantes etc.). Reponedoras de nutrientes.', 0),
(4, 'Fruit i flor', '', '(Tomates, Melones, Berenjenas etc.), (Coliflores, Alcachofas, etc.), Patatas y Maíz. Requieren muchos nutrientes y agotan mucho la tierra.', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `img_bancal`
--

CREATE TABLE IF NOT EXISTS `img_bancal` (
  `id_foto` int(11) NOT NULL AUTO_INCREMENT,
  `id_bancal` int(11) NOT NULL,
  `titol` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Titol de la foto',
  `detalls` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id_foto`),
  KEY `id_planta` (`id_bancal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='emmagatzema fotos de les plantes. un registre per foto. idPlanta_idFoto.jpg/...' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `img_plaga`
--

CREATE TABLE IF NOT EXISTS `img_plaga` (
  `id_foto` int(11) NOT NULL AUTO_INCREMENT,
  `id_plaga` int(11) NOT NULL,
  `titol` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Titol de la foto',
  `detalls` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id_foto`),
  KEY `id_planta` (`id_plaga`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='emmagatzema fotos de les plantes. un registre per foto. idPlanta_idFoto.jpg/...' AUTO_INCREMENT=6 ;

--
-- Bolcant dades de la taula `img_plaga`
--

INSERT INTO `img_plaga` (`id_foto`, `id_plaga`, `titol`, `detalls`, `user`) VALUES
(1, 1, 'Pulgó', 'Pot ser de distints colors, generalment negre, verd o blanc.', 0),
(2, 2, 'Mosca blanca', 'Posa els ous a l''envés de les fulles', 0),
(3, 3, 'Oidio', 'Fong blanquinós que apareix a la superfície de les fulles. La corriola és un bon indicador de la presència del fong.', 0),
(5, 5, 'Escarabat de ka creïlla', 'Amb calor i aliment suficient, son realment prolífics en la posta d''ous. Cal revisar quan hi haja risc per a prendre mesures a priori.', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `img_planta`
--

CREATE TABLE IF NOT EXISTS `img_planta` (
  `id_foto` int(11) NOT NULL AUTO_INCREMENT,
  `id_planta` int(11) NOT NULL,
  `titol` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Titol de la foto',
  `detalls` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id_foto`),
  KEY `id_planta` (`id_planta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='emmagatzema fotos de les plantes. un registre per foto. idPlanta_idFoto.jpg/...' AUTO_INCREMENT=8 ;

--
-- Bolcant dades de la taula `img_planta`
--

INSERT INTO `img_planta` (`id_foto`, `id_planta`, `titol`, `detalls`, `user`) VALUES
(1, 1, 'Tomaca valenciana', 'Es pot observar la poda a un únic ull', 0),
(2, 2, 'Favera en flor', 'Es poden veure les flors i les faves ja maures, apuntant encara cap a dalt.', 0),
(3, 3, 'Carxofera en estat vegetatiu', 'En aquesta mata s''han podat les fulles de baix per airejar i evitar plagues, fongs...', 0),
(4, 4, 'Carlotes collides', '5Les carlotes són de les verdures que més treball i habilitat necessiten per a obtindre una bona collita.', 0),
(5, 5, 'Creïllera i tubercles collits', 'Per a evitar la verdor de la creïlla, que resulta tòxica, cal cobrir-les bé amb els aporcaments necessaris.', 0),
(7, 7, 'All porro', 'Cal adaptar la sembra i el cultiu per a poder blanquejar una part suficient del porro.', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `mes`
--

CREATE TABLE IF NOT EXISTS `mes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='id també val com numero de mes' AUTO_INCREMENT=13 ;

--
-- Bolcant dades de la taula `mes`
--

INSERT INTO `mes` (`id`, `nom`, `user`) VALUES
(1, 'Gener', 0),
(2, 'Febrer', 0),
(3, 'Març', 0),
(4, 'Abril', 0),
(5, 'Maig', 0),
(6, 'Juny', 0),
(7, 'Juliol', 0),
(8, 'Agost', 0),
(9, 'Setembre', 0),
(10, 'Octubre', 0),
(11, 'Novembre', 0),
(12, 'Desembre', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `parcela`
--

CREATE TABLE IF NOT EXISTS `parcela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `ocupada` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'True si hi ha algo plantat, false si es pot plantar',
  `bancal` int(11) NOT NULL COMMENT 'BANCAL al que pertany la PARCELA',
  `superficie` int(20) NOT NULL DEFAULT '0' COMMENT 'superf. en m2',
  `detalls` varchar(400) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`),
  KEY `bancal` (`bancal`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `parcela`
--

INSERT INTO `parcela` (`id`, `nom`, `ocupada`, `bancal`, `superficie`, `detalls`, `user`) VALUES
(1, 'sombrejada', 1, 1, 100, 'Parcela amb ombra durant el matí.', 0),
(2, 'assoleiada', 0, 1, 50, 'Rep sol durant tot el dia', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `plaga`
--

CREATE TABLE IF NOT EXISTS `plaga` (
  `id` int(2) NOT NULL DEFAULT '0',
  `nom_comu` varchar(23) CHARACTER SET utf8 NOT NULL,
  `nom_cientific` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `descripcio` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `tractament` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Bolcant dades de la taula `plaga`
--

INSERT INTO `plaga` (`id`, `nom_comu`, `nom_cientific`, `descripcio`, `tractament`, `user`) VALUES
(1, 'Pulgon', 'Aphididae', 'Insecte de pocs mm de llarg. Generalment negre. Succiona la savia de la planta i deixa restes de melaza que impedixen la fotosintesi. En ocasions, les formigues son les grangeres de pulgons que els crien per a obtindre la melaza com aliment.', 'Les mariquites son el millor tractament, doncs s''alimenten de pulgó i altres insectes perjudicials. Com a preventiu, sabó potàsic quan la planta tinga certa envergadura i repetir cada 20-25 dies. Si apareix, pulveritzar bé la planta ja que actua per contacte.', 0),
(2, 'Mosca blanca', 'Aleyrodidae', 'Insecte d''entre 1 i 1''5mm de longitud. Tenen una boca puntiaguda per a punxar i obtindre la savia de les plantes.', 'Sabo potasic com al pulgo.', 0),
(3, 'Oidio', 'Oidium leucoconium', 'Fong les espores del qual viatgen per l''aire i arrelen a les fulles, principalment a les plantes dèbils i que estan a la sombra. Es fàcil de diagnosticar, es presenta com una pols o cendra sobre les fulles que va creixent i secant les fulles fins que finalment estes moren. És menys present en flors.', 'El sol pot ser suficient per acabar amb ell. Elimnar les parts infectades per a evitar contagis (ja no es recuperaran). La correhuela sol tindre oidio, pel que és bo mantindre-la a ratlla. Plantar massa dens o regar amb excessiva freqüència pot ser també causa d''oidio. Amb sofre es pot tractar, o utilitzant purín d''ortiga com a preventiu.', 0),
(4, 'Mildiu', 'Peronosporaceae', 'Fong que apareix en el haz de les fulles de color verd, després groc, i per últim marró. En el envés es veu un fieltro o pelusilla blanca. Períodes plujosos o humits seguits de dies càlids (15-30ºC) son els prefectes per a la proliferació.', 'Aplicacions amb cobre o caldo bordelés. Reduïr humitat ambiental, regar menys..', 0),
(5, 'Escarabat de la creïlla', 'Leptinotarsa decemlineata', 'Escarabat d''1cm de llarg en etapa adulta, a ratlles clares i obscures. Posen els ous de color taronja en l''envés de les fulles, en grups de 20 a 60. Tant larves com adults devoren gran quantitat de fulles així com flors, causant un gran mal a la planta si hi ha un excés. Hivernen en la terra i en primavera s''activen amb la calor', 'Bacilus thunergensis com tractament i preventiu. És bona idea revisar les fulles quan les plantes arriben als 40cm en busca d''adults, larves o ous, ja que pot ser una infecció molt lleu que passe a una plaga en uns dies. Poden volar, viatjant de plantes infectades a altres sanes. Ataca a la creïlla i en major mesura a l''albergina', 0),
(6, 'Cotxinilla o caparreta', 'Oniscidea', 'Viuen en llocs obscurs i humits. Alguns poden fer/se una bola per a protegir/se. Salimenten de materia vegetal, insectes morts... Poden ser un problema si hi ha molts. A les composteres fan un gran paper, podem traslladar/los all''i si els trobem a l-hort.', 'Augmentar la ventilació de la planta afectada i aplicar sabó potàsic.', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `planta`
--

CREATE TABLE IF NOT EXISTS `planta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_comu` varchar(30) NOT NULL,
  `nom_cientific` varchar(46) DEFAULT NULL,
  `grup` int(11) DEFAULT NULL,
  `familia` int(11) DEFAULT NULL,
  `sembra_ini` date DEFAULT NULL COMMENT 'Marca la data d''inici de sembra',
  `sembra_fi` date DEFAULT NULL COMMENT 'Marca la data de fi de sembra',
  `duracio` int(11) DEFAULT NULL COMMENT 'duracio en dies des de la sembra fins a l''arrancat',
  `marc_ample` int(11) DEFAULT NULL COMMENT 'Distància entre cavallons',
  `marc_llarg` int(11) DEFAULT NULL COMMENT 'Distància entre plantes dins del cavalló',
  `produccio` varchar(23) DEFAULT NULL,
  `sembra` varchar(2000) DEFAULT NULL COMMENT 'Detalls de la sembra, prepraració del planter, etc.',
  `cultiu` varchar(2000) DEFAULT NULL,
  `collita` varchar(2000) DEFAULT NULL COMMENT 'Detalls de la recol·lecció de la planta',
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`),
  KEY `grup` (`grup`),
  KEY `familia` (`familia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='llistat de plantes i dades com familia, plagues...' AUTO_INCREMENT=9 ;

--
-- Bolcant dades de la taula `planta`
--

INSERT INTO `planta` (`id`, `nom_comu`, `nom_cientific`, `grup`, `familia`, `sembra_ini`, `sembra_fi`, `duracio`, `marc_ample`, `marc_llarg`, `produccio`, `sembra`, `cultiu`, `collita`, `user`) VALUES
(1, 'Tomaquera', 'Solanum lycopersicum', 4, 1, '2014-03-15', '2014-06-30', 180, 50, 40, '1-3kg/mata', 'Uns 60 dies abans de posar al camp. Sembrar 2 o 3 llavors per alveol per a deixar la més forta quan alcancen els 10cm. Vigilar aparició de plagues, ja que els brots de tomaquera son aliments predilectes de més d''un insecte.\nUns 60 dies abans de posar al camp. Sembrar 2 o 3 llavors per alveol per a deixar la més forta quan alcancen els 10cm. Vigilar aparició de plagues, ja que els brots de tomaquera son aliments predilectes de més d''un insecte.\nUns 60 dies abans de posar al camp. Sembrar 2 o 3 llavors per alveol per a deixar la més forta quan alcancen els 10cm. Vigilar aparició de plagues, ja que els brots de tomaquera son aliments predilectes de més d''un insecte.Uns 60 dies abans de posar al camp. Sembrar 2 o 3 llavors per alveol per a deixar la més forta quan alcancen els 10cm. Vigilar aparició de plagues, ja que els brots de tomaquera son aliments predilectes de més d''un insecte.\nUns 60 dies abans de posar al camp. Sembrar 2 o 3 llavors per alveol per a deixar la més forta quan alcancen els 10cm. Vigilar aparició de plagues, ja que els brots de tomaquera son aliments predilectes de més d''un insecte.', 'Cal podarla al mes del trasplante definitiu i dixarli un ull únicament per a poder encanyar-la (varietat valenciana)\nCal podarla al mes del trasplante definitiu i dixarli un ull únicament per a poder encanyar-la (varietat valenciana)\nCal podarla al mes del trasplante definitiu i dixarli un ull únicament per a poder encanyar-la (varietat valenciana)\nCal podarla al mes del trasplante definitiu i dixarli un ull únicament per a poder encanyar-la (varietat valenciana)\nCal podarla al mes del trasplante definitiu i dixarli un ull únicament per a poder encanyar-la (varietat valenciana)\nCal podarla al mes del trasplante definitiu i dixarli un ull únicament per a poder encanyar-la (varietat valenciana)', 'Quan comencen a ''pintar'', és a dir, mostren el color roig, ja podem collir. Tindrem en compte els dies que transcorreran fins a consumir-la per agafar-la més verda o més madura.\nPer a conservar les llavors, deixar madurar en la planta fins que comence a secar-se. Quan passe, treure les llavors i deixar assecar per a conservar-les.\nQuan comencen a ''pintar'', és a dir, mostren el color roig, ja podem collir. Tindrem en compte els dies que transcorreran fins a consumir-la per agafar-la més verda o més madura.\nPer a conservar les llavors, deixar madurar en la planta fins que comence a secar-se. Quan passe, treure les llavors i deixar assecar per a conservar-les.\nQuan comencen a ''pintar'', és a dir, mostren el color roig, ja podem collir. Tindrem en compte els dies que transcorreran fins a consumir-la per agafar-la més verda o més madura.\nPer a conservar les llavors, deixar madurar en la planta fins que comence a secar-se. Quan passe, treure les llavors i deixar assecar per a conservar-les.\nQuan comencen a ''pintar'', és a dir, mostren el color roig, ja podem collir. Tindrem en compte els dies que transcorreran fins a consumir-la per agafar-la més verda o més madura.\nPer a conservar les llavors, deixar madurar en la planta fins que comence a secar-se. Quan passe, treure les llavors i deixar assecar per a conservar-les.\nQuan comencen a ''pintar'', és a dir, mostren el col', 0),
(2, 'Favera', 'Vicia faba', 3, 2, '2014-09-01', '2014-01-01', 180, 70, 70, '1kg/mata', 'Sembra directa, amb 1, 2 o 3 llavors. Reguem bé abans i després de posar-les. Després no caldrà tornar a regar fins que naixquen.', 'tapar amb palla per a evitar brosses. recomanable pulveritzar en potàsic, ja que es fàcil que li aparega pulgó', 'Uns 60 dies després de la plantació, fins a que moren als X mesos. Es cullen quan fan entre 15-20cm per a menjar tendres. Per a guardar llavor, deixar-les fer-se grans i assecar-les al sol dins de la vaina, fins que perguen humitat.', 0),
(3, 'Carxofera', 'Cynara scolymus', 4, 4, '2014-07-15', '2014-09-15', 1100, 120, 80, '1.5kg/mata', 'Pot realitzar-se per llavor o per estaca, que és la més utilitzada. Es sembren dos estaques per forat, per arrancar després la més dèbil, si les dues prosperen. Després del segon reg, podem aprofitar la saó per replantar les que hagen fallat', 'La carxofera té un cicle productiu de tres anys, encara que poden trobar-se cultius a un i dos anys. El primer any la producció no és elevada, ja que encara no s''ha desenvolupat el sistema d''arrels. El segon i tercer any són els més productius, mentre que a partir del quart la vellea de la planta fa recomanable eliminar-la, a més de que instal·lant el carxofar en altra parcela afavorim les rotacions al bancal. ', 'Segons el clima, la collita comença entre octubre i gener, allargant-se fins a juny en les zones més fredes. Cal collir-les abans de que maduren massa i es tornen dures i fibroses, és a dir, mentre les fulles estan apegades a la flor. Tallar uns 8-10cm de la tija junt amb la carxofa.', 0),
(4, 'Carlota', 'Daucus carota', 1, 6, '2014-09-01', '2014-05-01', 150, 30, 15, '600g/m2', 'Per a la sembra en cavallons, plantar en la cresta unes poques llavors cada 6-8cm, soterrades uns 2-4cm. Abans de sembrar cal regar els cavallons, si es rega després correm el risc d''arrastrar les llavors o destapar-les, dificultant així la germinació. Mantindre la terra humida. Una vegada broten, clarejar fins deixar 1 o 2, suficient per a que puguen creixer suficientment. Poden plantar-se en zig-zag per aprofitar més l''espai.', 'La carlota té un cicle de dos anys. Durant el primer s''aprofita l''arrel, el segon produix la flor i les llavors. Cal collir-les abans de que comence aquesta segona fase, ja que es tornen massa dures per al consum. Són especialment sensibles a la competència amb males herbes, pel que cal tindre perfectament net el camp abans i durant el cultiu. És dels cultius més difícils de dur endvant exitosament.', 'Segons varietat i altres factors, entre 3 i 7 mesos després de la sembra. Es pot regar uns dies abans de la collita per a facilitar l''arrancament.', 0),
(5, 'Creïlla', 'Solanum tuberosum ', 4, 1, '2014-01-01', '2014-01-31', 150, 70, 30, '2-3kg/m2', 'Encara que poden sembrar-se de llavor, només contemplarem la opció de plantar la creïlla. Poden deixar-se a obscures sobre estants de fusta per provocar l''aparició dels grills, les protuberàncies que es formen a la superfície de la creïlla quan no es consumix en un període de temps determinat. Aquestes brotacions es convertiran en la part aèria de la planta, pel que interessa que tinguen bon tamany quan es planta la creïlla en terra. Si hi ha més d''un brot en la creïlla, podem partir-la i aprofitar per sembrar diverses mates d''un sol tubercle. Soterrar-les a uns 5-10cm de profunditat.', 'Es tracta d''una planta de clima templat, la temperatura òptima oscila entre 13º i 18º. Cal assegurar-se de que no es produïran gelades despres de la brotació, ja que temperatures per baix de 0ºC maten la planta. Per a plantar, la terra ha d''estar a més de 7ºC. Conforme van creixent, cal anar aporcant per evitar l''exposició dels tubercles al sol, ja que verdegen per la producció de solanina, tòxica per al consum. Disposar els cavallons de tal forma que permeten l''aporcat posterior. Respecte a les necessitats d''aigua, una lleugera sequera abans de la formació dels tubercles afavorix un sistema radicular potent. En la resta del cultiu, tindre en compte que la creïlla és una gran consumidora d''aigua, però com la majoria de plantes, no els agrada l''excés.', 'Si es realitza la collita manual, anar amb molta cura de no fer malbé els tubercles. Es pot segar abans la part visible de la planta per a provocar l''engrossiment de la creïlla, a més de simplificar la tasca de la recol·lecció. Retirar-los tots, aprofitables per a menjar o no, o rebrotaran més endavant.', 0),
(7, 'Porro', 'Allium porrum', 2, 7, '2013-11-01', '2014-02-01', 180, 30, 20, 'ND', 'Pot fer-se sembra directa al lloc definitiu, o més recomanablement utilitzar planter. Amb açó aconseguim certa uniformitat en el desenvolupament. Calen uns 70-90 dies en el planter.', 'Cal preparar el cultiu per a poder aporcar-li terra periòdicament, i augmentar així la part comestible del porro.', 'És recomanable realitzar-la en saó, per a evitar trencament al treure els porros. Pot usar-se una ferramenta similar a una forca per a simplificar la feina.', 0),
(8, 'Meló d''alger', 'Citrullus lanatus', 4, 3, '2015-04-15', '2015-05-15', 130, 100, 200, NULL, 'Si ens decidim pel planter, quasi tots els que podem trobar estan empeltats amb arrel de carabasse, mes forta i resistent que la del meló. El planter ha de quedar cobert amb per la terra, pero la zona de l''empelt ha d''estar a l''aire per a evitar que broten arrels del meló, que podria derivar en un atac de fusarium i la mort de la mata.', 'Després de sembrar es realitza un reg en abundància per a banyar el terreny, i que les arrels puguen crèixer lliurement. Respecte a fertilització, el meló necessita un bon abonat de fons previ a la sembra, i una vegada comencen a mostrar-se els fruits, es recomanable aportar un poc més per a no tindre carències.', 'A partir dels 110 dies de la sembra, es poden començar a collir els fruits que estiguen madurs. Periòdicament (cada pocs dies, o cada setmana com a molt) es replegaran els que estiguen madurs.', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `remei`
--

CREATE TABLE IF NOT EXISTS `remei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcio` varchar(2000) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Descripció breu del remei. Inclou info general de aplicacio. La info concreta es crea a la taula tasca_plaga',
  `preparacio` varchar(2000) DEFAULT NULL COMMENT 'Procés de preparació del remei de principi a fi',
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='el REMEI es relaciona amb la PLAGA a través de TASCA_PLAGA' AUTO_INCREMENT=6 ;

--
-- Bolcant dades de la taula `remei`
--

INSERT INTO `remei` (`id`, `nom`, `descripcio`, `preparacio`, `user`) VALUES
(1, 'Sabo potasic', 'Sabó obtés d''extractes de plantes mitjançant processos naturals. Pot trobar-se a tendes especialitzades o supermercats. Actua sobre la majoria d''insectes per contacte. Pot usar-se com a preventiu cada 15 dies.', 'Mesclar 20g de sabó per cada litre d''aigua. Aprox, una cullera sopera per cada 5 litres. Pulveritzar sobre la planta afectada i les circumdants', 0),
(2, 'Purin de ortiga', 'Estimulant del creixement, propietats curatives front a mildiu o altres carències. Preveu l''atac d''àcars.', '''Ortiga virens'' o ''ortiga dioica'', riques en nitrògen i sals minerals.  2kg d''ortiga fresca o 400g de seca per 20l d''aigua. Es macera durant 5 dies, menejant la mescla cada dia. Després es cola i es diluix en 40l d''aigua (en total, 2kg per 60l. S''usa per a enfortir la planta, regant i pulveritzant.', 0),
(3, 'Sofre', 'Antioídio i acaricida preventiu i curatiu. Modifica el PH de la superfície foliar creant un clima hostil per al desenvolupament dels fongs. A més preveu l''aparició d''aranya roja.', 'S''afig sofre "micronizado" soluble en proporció de 8g per cada litre d''aigua, i es fumiga a poder ser per ambdues cares de les fulles. El sofre normal (groc) no es disol en aigua, pero es pot espolvorejar sobre la planta. S''usa amb temperatures entre 20 i 30ºC. 3 aplicacions cada 5 dies.', 0),
(4, 'Llet', 'La llet (animal) conté una sèrie de bactèries i elements que creen una pel·lícula protectora quan s''estenen sobre la superfície de les fulles, tornant-la un medi hostil per al desenvolupament dels fongs.', 'Diluir llet desnatada amb aigua al 5-10%, fer proves i augmentar o reduir la dosi segons necessitat. Netejar estris immediatament després, ja que la llet fa mala olor si es deixa.', 0),
(5, 'Infusio de brots de tomaquera', 'Pareix ser que els brots de tomaca macerats en aigua son un mitjà efectiu contra els pulgons.', 'Mesclar 1kg de brots tendres amb 10l d''aigua. Diluir aquesta mescla al 50% amb aigua i aplicar com a preventiu.', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `tasca_fixa`
--

CREATE TABLE IF NOT EXISTS `tasca_fixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mes` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `descripcio` varchar(4000) NOT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`),
  KEY `mes` (`mes`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='tasques fixes per mes de l''any' AUTO_INCREMENT=10 ;

--
-- Bolcant dades de la taula `tasca_fixa`
--

INSERT INTO `tasca_fixa` (`id`, `mes`, `nom`, `descripcio`, `user`) VALUES
(1, 1, 'Recollir canyes', 'Cal deixar-les secar unes setmanes per evitar que rebroten quan les usem. Tallar en diagonal a l''altura dels nucs per a facilitar la feina de clavar-les.', 0),
(2, 7, 'Solarització', 'Tapar el terreny amb algun material que aïlle la llum i mantinga el calor (generalment plàstic negre) per sofocar el terreny les setmanes de més calor, a més de mantindre''l sense regar mentre estiga tapat. Evitarem que broten males herbes, i al calfar la terra prolongadament també reduÏm la presència de patògens.', 0),
(3, 1, 'Abonat estiu', 'Si no ho hem fet ja, i anem a utilitzar algun adob que haja de descomposar-se (com excrements de cavall) es bona idea deixar-lo sobre la superfície on plantarem per a que vaja reduint-se i mesclant-se amb la terra.', 0),
(4, 1, 'Peparar semilleros estiu', 'Podem anar preparant ja tomaques, albergines, carabassetes... i altres cultius d''estiu.', 0),
(7, 1, 'asdf', 'asdfasdf asd', 0),
(8, 1, 'robe', 'asdfasdf asd', 0),
(9, 11, 'Collitaoliveres', 'Quan comencen a estar rogetes o negres', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `tasca_planta`
--

CREATE TABLE IF NOT EXISTS `tasca_planta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_planta` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL COMMENT '3 o 4 paraules q resumisquen la tasca',
  `dies` int(11) NOT NULL COMMENT 'Dies des de la sembra',
  `descripcio` varchar(4000) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`,`id_planta`),
  KEY `id_planta` (`id_planta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=161 ;

--
-- Bolcant dades de la taula `tasca_planta`
--

INSERT INTO `tasca_planta` (`id`, `id_planta`, `nom`, `dies`, `descripcio`, `user`) VALUES
(1, 1, 'Sembra', 0, 'sembra 1-3 llavors per alveolo. regar abans la terra fins que sobre, no tornar a regar fins que germinen.', 0),
(2, 1, 'repicat', 20, 'Quan tenen uns 10cm, deixem una única plàntula per alvèol per afavorir el creixement. Seguim regant per a mantindre humida la terra.', 0),
(3, 1, 'Transplantament i reg.', 50, 'trasplante al lloc definitiu. pot enterrar-se part de la tija ja que arrela molt fàcilment. regar després.', 0),
(5, 1, 'Sofre', 60, 'Per l''excés d''humitat després de regar, s''aplica sofre en pols per evitar l''aparició de fongs.', 0),
(6, 1, 'Desullat', 80, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 0),
(7, 1, 'Reg', 85, 'Si cal, tornem a regar a manta. D''ací en avant, en funció de la calor, humitat, etc. les tomaqueres es regaran cada 7-10 dies.', 0),
(8, 7, 'sembra', 0, 'sembrar en semilleros de tamany mig a raó de 2-3 llavors per forat. de febrer a agost.', 0),
(9, 7, 'transplant', 75, '\0', 0),
(10, 7, 'repicat', 35, 'eliminar les plantes més dèbils de cada forat, si ha crescut més d''una.', 0),
(11, 7, 'aporcat', 95, 'aporcar terra per cobrir 1/4 part del porro', 0),
(12, 7, 'aporcat', 110, 'aporcar terra per cobrir 1/4 part del porro', 0),
(13, 7, 'aporcat', 125, 'aporcar terra per cobrir 1/4 part del porro', 0),
(14, 7, 'aporcat', 140, 'aporcar terra per cobrir 1/4 part del porro', 0),
(15, 7, 'aporcat', 155, 'aporcar terra per cobrir 1/4 part del porro', 0),
(16, 7, 'aporcat', 170, 'aporcar terra per cobrir 1/4 part del porro', 0),
(17, 7, 'recolecció', 180, 'realitzar quan hi haja saó per no trencar els puerros', 0),
(20, 1, 'arrancar', 180, 'Per la quantitat de malalties que poden patir les tomaqueres durant el cultiu, es recomana cremar-les desprs darrencades, en compte dafegir-les al compost. Si no hi ha mostres de plagues ni malalties, podem afegir-la al compost.', 0),
(21, 2, 'Sembra', 1, 'Posar 2 o 3 faves a 5cm de profunditat. No xafar massa la terra superior', 0),
(26, 4, 'Sembra', 1, 'Reguem bé el cavalló abans i després de posar la llavor, tenint compte de no destapar-la ni afonar-la amb l''aigua.', 0),
(51, 1, 'Desullar', 95, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 0),
(52, 1, 'Desullar', 110, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 0),
(53, 1, 'Desullar', 125, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 0),
(54, 1, 'Desullar', 140, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 0),
(55, 1, 'Desullar', 155, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 0),
(56, 1, 'Desullar', 170, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 0),
(57, 2, 'Regar', 15, 'Després de començar a brotar les faves, realitzem un reg a manta.', 0),
(58, 2, 'Podar', 45, 'Les rames més lletges, fines i malaltisses, poden podar-se per a propiciar el creixement de la part sana de la planta. Revisar pulgó', 0),
(59, 2, 'Purín d''ortiga', 40, 'Pot aplicar-se purín d''ortiga per a afavorir el creixement i la vigorositat de la planta. La cua de cavall també és efectiva, a més de antifúngica.', 0),
(60, 2, 'Arrancar', 180, 'Encara que pot variar, uns sis mesos després de la sembra la mata deixa de ser productiva. Si disposem de rotovator, podem deixar secar les mates sobre la terra i triturar-les després per incorporar-les a la terra.', 0),
(61, 2, 'Collita', 90, 'Encara que depén de la varietat, uns tres mesos després de la sembra comencen a apareixer les primeres faves madures.', 0),
(62, 3, 'Plantació + reg', 1, 'A la distància del marc, sembrar dues estaques per mata, per a triar la millor quan arrelen. No enterrar molt profundament per a evitar la pudrició. Regar abundantment per a afavorir l''arrelament després de la sembra, evitant sempre que l''aigua arribe a la soca.', 0),
(63, 3, 'Replantació i repicat', 30, 'Si prosperen les dues mates, arranquem la més dèbil per a afavorir el creixement de la sana. També podem aprofitar i replantar on no hagen arrelat correctament.', 0),
(64, 3, 'Poda d''estiu', 270, 'Entre abril i juny, comença el període de descans de la carxofera. Es seguen a 5-10 cm de terra, amb tisores o falç, es deixen secar entre els cavallons, i es cremen quan s''han secat completament. Deixarem les mates sense regar fins a setembre-octubre, quan rebrotaràn després de les pluges de tardor o del reg que realitzem. Podem aprofitar el període estival per a netejar de males herbes.', 0),
(65, 3, 'Poda d''estiu', 635, 'Entre abril i juny, comença el període de descans de la carxofera. Es seguen a 5-10 cm de terra, amb tisores o falç, es deixen secar entre els cavallons, i es cremen quan s''han secat completament. Deixarem les mates sense regar fins a setembre-octubre, quan rebrotaràn després de les pluges de tardor o del reg que realitzem. Podem aprofitar el període estival per a netejar de males herbes.', 0),
(66, 3, 'Arrancar', 1000, 'Si volem reproduïr les carxoferes, al juny quan es seca, s''arrenquen les estaques per a trasplantar en agost-setembre a la nova ubicació. Deixar les estaques sense fulles i amb un poc d''arrel per a que agarren fàcilment. Pel consum de nutrients de la carxofera durant tres anys, es recomana plantar algun adob verd i/o deixar la terra en guaret abans de començar altre cultiu.', 0),
(67, 3, 'Reg de rebrot', 390, 'Quan arriba la tardor reguem per a afavorir el rebrot de la mata.', 0),
(68, 3, 'Reg de rebrot', 755, 'Quan arriba la tardor reguem per a afavorir el rebrot de la mata.', 0),
(69, 3, 'Crema', 450, 'Si no ho hem fet ja, cremar la poda de la carxofera en el regador entre cavallons. Amb la cendra aportem nutrients per al pròxim any.', 0),
(70, 3, 'Crema', 815, 'Si no ho hem fet ja, cremar la poda de la carxofera en el regador entre cavallons. Amb la cendra aportem nutrients per al pròxim any.', 0),
(71, 3, 'Poda', 90, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(72, 3, 'Poda', 120, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(73, 3, 'Poda', 150, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(74, 3, 'Poda', 180, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(75, 3, 'Poda', 210, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(76, 3, 'Poda', 240, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(77, 3, 'Poda', 480, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(78, 3, 'Poda', 510, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(79, 3, 'Poda', 540, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(80, 3, 'Poda', 570, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(81, 3, 'Poda', 600, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(82, 3, 'Poda', 845, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(83, 3, 'Poda', 875, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(84, 3, 'Poda', 905, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(85, 3, 'Poda', 935, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(86, 3, 'Poda', 965, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 0),
(87, 4, 'Repicat', 30, 'Eliminar les plàntules que estiguen massa prop, deixant entre 8 i 15 cm de distància entre plantes.', 0),
(88, 4, 'Repicat', 45, 'És recomanable repassar el cultiu i comprovar que no hi ha massa densitat de carlotes creixent juntes, ja que es quedarán raquítiques, a més d''augmenta la probabilitat d''agafar fongs.', 0),
(89, 4, 'Collita', 150, 'Es recomana realitzar la collita en saó per a evitar el trencament dels tubercles. Es recomana la collita escalonada ja que les carlotes fresques perden ràpidament la seua firmesa.', 0),
(94, 5, 'Sembra', 1, 'Realitzar en saó.', 0),
(95, 5, 'Aporcat', 60, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 0),
(96, 5, 'Aporcat', 90, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 0),
(97, 5, 'Aporcat', 120, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 0),
(99, 5, 'Aporcat', 150, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 0),
(100, 5, 'Arrancat de mates', 170, 'Uns dies abans de la recol·lecció, es poden arrancar les mates (amb una falç per exemple) per afavorir el engrossament dels tubercles ', 0),
(101, 5, 'Collita ', 180, 'Si es realitza manualment, cal anar amb compte de no danyar-les amb la ferramenta. ', 0),
(138, 2, 'Desbrossat', 30, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 0),
(139, 2, 'Desbrossat', 50, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 0),
(140, 2, 'Desbrossat', 70, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 0),
(141, 2, 'Desbrossat', 90, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 0),
(142, 2, 'Desbrossat', 110, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 0),
(143, 2, 'Desbrossat', 130, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 0),
(144, 2, 'Desbrossat', 150, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 0),
(145, 2, 'Desbrossat', 170, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 0),
(154, 4, 'Desbrossat', 20, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 0),
(155, 4, 'Desbrossat', 40, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 0),
(156, 4, 'Desbrossat', 60, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 0),
(157, 4, 'Desbrossat', 80, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 0),
(158, 4, 'Desbrossat', 100, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 0),
(159, 4, 'Desbrossat', 120, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 0),
(160, 4, 'Desbrossat', 140, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `tasca_remei`
--

CREATE TABLE IF NOT EXISTS `tasca_remei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_remei` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `dies` int(11) NOT NULL,
  `descripcio` varchar(4000) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`),
  KEY `id_remei` (`id_remei`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Bolcant dades de la taula `tasca_remei`
--

INSERT INTO `tasca_remei` (`id`, `id_remei`, `nom`, `dies`, `descripcio`, `user`) VALUES
(1, 1, 'Pulveritzar potàsic 1/3', 1, 'Primera aplicació de potàsic. Mullar bé tota la planta, ja que actua per contacte', 0),
(2, 1, 'Pulveritzar potàsic 2/3', 6, 'Segona aplicació de potàsic. Comprovar si disminueix la quantitat de pulgo.', 0),
(3, 1, 'Pulveritzar potàsic 3/3', 11, 'Tercera i última aplicació. Comprovar el nivell de població de pulgó. Continuar amb aplicacions preventives cada 15 dies després d''aquesta última aplicació', 0),
(4, 3, 'Sofre en pols 1/3', 1, 'Més preventiu que correctiu. Si plou, cal tornar a aplicar.', 0),
(5, 3, 'Sofre en pols 2/3', 6, 'Comprovar avanç de la patologia. Pot ser un bon moment per a podar les fulles més "lletges" de la planta.', 0),
(6, 3, 'Sofre en pols 3/3', 11, 'Si no conseguim detindre la infecció amb aquesta tercera aplicació, cal buscar altres mitjans per contolar-la.', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `tractada`
--

CREATE TABLE IF NOT EXISTS `tractada` (
  `id_plaga` int(11) NOT NULL,
  `id_remei` int(11) NOT NULL,
  `detalls` varchar(4000) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id_plaga`,`id_remei`),
  KEY `tractada_ibfk_4` (`id_remei`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Descriu quines plagues són tractades per quins remeis.';

--
-- Bolcant dades de la taula `tractada`
--

INSERT INTO `tractada` (`id_plaga`, `id_remei`, `detalls`, `user`) VALUES
(1, 1, 'Cal tindre molt de compte en els atacs als brots.', 0),
(1, 5, 'Eficàcia no comprovada.', 0),
(6, 1, 'Cal banyar completament la planta per a assegurar-se un tractament efectiu', 0);

--
-- Restriccions per taules bolcades
--

--
-- Restriccions per la taula `afectada`
--
ALTER TABLE `afectada`
  ADD CONSTRAINT `afectada_ibfk_3` FOREIGN KEY (`id_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `afectada_ibfk_4` FOREIGN KEY (`id_plaga`) REFERENCES `plaga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `cultiu`
--
ALTER TABLE `cultiu`
  ADD CONSTRAINT `cultiu_ibfk_4` FOREIGN KEY (`planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cultiu_ibfk_5` FOREIGN KEY (`parcela`) REFERENCES `parcela` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_6` FOREIGN KEY (`parcela`) REFERENCES `parcela` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_7` FOREIGN KEY (`parcela`) REFERENCES `parcela` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `img_bancal`
--
ALTER TABLE `img_bancal`
  ADD CONSTRAINT `img_bancal_ibfk_1` FOREIGN KEY (`id_bancal`) REFERENCES `bancal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `img_plaga`
--
ALTER TABLE `img_plaga`
  ADD CONSTRAINT `img_plaga_ibfk_1` FOREIGN KEY (`id_plaga`) REFERENCES `plaga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `img_planta`
--
ALTER TABLE `img_planta`
  ADD CONSTRAINT `img_planta_ibfk_1` FOREIGN KEY (`id_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `parcela`
--
ALTER TABLE `parcela`
  ADD CONSTRAINT `parcela_ibfk_1` FOREIGN KEY (`bancal`) REFERENCES `bancal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `planta`
--
ALTER TABLE `planta`
  ADD CONSTRAINT `planta_ibfk_1` FOREIGN KEY (`grup`) REFERENCES `grup` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `planta_ibfk_2` FOREIGN KEY (`familia`) REFERENCES `familia` (`id`) ON UPDATE CASCADE;

--
-- Restriccions per la taula `tasca_fixa`
--
ALTER TABLE `tasca_fixa`
  ADD CONSTRAINT `tasca_fixa_ibfk_1` FOREIGN KEY (`mes`) REFERENCES `mes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `tasca_planta`
--
ALTER TABLE `tasca_planta`
  ADD CONSTRAINT `tasca_planta_ibfk_1` FOREIGN KEY (`id_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `tasca_remei`
--
ALTER TABLE `tasca_remei`
  ADD CONSTRAINT `tasca_remei_ibfk_2` FOREIGN KEY (`id_remei`) REFERENCES `remei` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `tractada`
--
ALTER TABLE `tractada`
  ADD CONSTRAINT `tractada_ibfk_3` FOREIGN KEY (`id_plaga`) REFERENCES `plaga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tractada_ibfk_4` FOREIGN KEY (`id_remei`) REFERENCES `remei` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de dades: `hortapp_user`
--
CREATE DATABASE `hortapp_user` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hortapp_user`;

-- --------------------------------------------------------

--
-- Estructura de la taula `afectada`
--

CREATE TABLE IF NOT EXISTS `afectada` (
  `id_planta` int(11) NOT NULL,
  `id_plaga` int(11) NOT NULL,
  `detalls` varchar(4000) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id_planta`,`id_plaga`,`user`),
  KEY `id_plaga` (`id_plaga`),
  KEY `id_planta` (`id_planta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcant dades de la taula `afectada`
--

INSERT INTO `afectada` (`id_planta`, `id_plaga`, `detalls`, `user`) VALUES
(166, 159, 'Amb llet desnatada al 5% es pot pulveritzar quan es donen les condicions per a evitar l''aparició.', 41),
(169, 157, 'Problemàtic principalment en els brots, ja que s''alimenten de la sàvia de les fulles.', 41),
(169, 160, 'Sofre en pols o pulveritzat a baixes temperatures. Repetir aplicació als 10 dies', 41),
(172, 165, 'Amb llet desnatada al 5% es pot pulveritzar quan es donen les condicions per a evitar l''aparició.', 42),
(174, 163, 'Després de dies d''humitat es probable que apareguen. Mantindre una població que no resulte danyina.', 42),
(175, 163, 'Problemàtic principalment en els brots, ja que s''alimenten de la sàvia de les fulles.', 42),
(175, 166, 'Sofre en pols o pulveritzat a baixes temperatures. Repetir aplicació als 10 dies', 42),
(178, 171, 'Amb llet desnatada al 5% es pot pulveritzar quan es donen les condicions per a evitar l''aparició.', 43),
(180, 169, 'Després de dies d''humitat es probable que apareguen. Mantindre una població que no resulte danyina.', 43),
(181, 169, 'Problemàtic principalment en els brots, ja que s''alimenten de la sàvia de les fulles.', 43),
(181, 172, 'Sofre en pols o pulveritzat a baixes temperatures. Repetir aplicació als 10 dies', 43),
(184, 177, 'Amb llet desnatada al 5% es pot pulveritzar quan es donen les condicions per a evitar l''aparició.', 44),
(186, 175, 'Després de dies d''humitat es probable que apareguen. Mantindre una població que no resulte danyina.', 44),
(187, 175, 'Problemàtic principalment en els brots, ja que s''alimenten de la sàvia de les fulles.', 44),
(187, 178, 'Sofre en pols o pulveritzat a baixes temperatures. Repetir aplicació als 10 dies', 44);

-- --------------------------------------------------------

--
-- Estructura de la taula `bancal`
--

CREATE TABLE IF NOT EXISTS `bancal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL COMMENT 'Nom del bancal per a distingir-lo d''altres.',
  `superficie` int(11) NOT NULL COMMENT 'superf. en m2',
  `ubicacio` varchar(200) NOT NULL,
  `detalls` varchar(2000) DEFAULT NULL COMMENT 'detalls del camp, reg, estat anterior, etc.',
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`,`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='un BANCAL es composa de PARCELA' AUTO_INCREMENT=8 ;

--
-- Bolcant dades de la taula `bancal`
--

INSERT INTO `bancal` (`id`, `nom`, `superficie`, `ubicacio`, `detalls`, `user`) VALUES
(1, 'test', 200, 'ubica', 'asdfasdf asdfasdf asdf asdf detallóts de l''ubicació.', 41),
(2, 'prova', 50, 'asdf', NULL, 41),
(3, 'prova', 50, 'asdf', 'asdf', 42),
(4, 'prova', 50, 'sadfads', 'ñklasjdfñklsadf', 42),
(5, 'prova', 55, 'asdfasdf', 'fasdfklñjsdf', 43),
(6, 'prova', 33, 'asdf', 'fdsafdsfasdfñlkjasdfñklj', 44),
(7, 'prova àccentúaçió', 400, '', 'prova àccentúaçió', 41);

-- --------------------------------------------------------

--
-- Estructura de la taula `cultiu`
--

CREATE TABLE IF NOT EXISTS `cultiu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planta` int(11) NOT NULL COMMENT 'id de la planta cultivada',
  `data_ini` date NOT NULL COMMENT '1/3/X o 1/9/X',
  `data_fi` date NOT NULL COMMENT '1/3/X o 1/9/X',
  `parcela` int(11) NOT NULL COMMENT 'id parcela',
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`,`user`),
  KEY `planta` (`planta`),
  KEY `parcela` (`parcela`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='mostra inici i fi de cultiu d''una planta en una parcela' AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `cultiu`
--

INSERT INTO `cultiu` (`id`, `planta`, `data_ini`, `data_fi`, `parcela`, `user`) VALUES
(1, 169, '2015-01-06', '2015-05-06', 1, 41);

-- --------------------------------------------------------

--
-- Estructura de la taula `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parcela` int(11) NOT NULL COMMENT 'id de la parcela relativa a l''event',
  `titol` varchar(400) NOT NULL,
  `data` date NOT NULL,
  `detalls` varchar(4000) DEFAULT NULL,
  `realitzada` tinyint(1) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`,`user`),
  KEY `parcela` (`parcela`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `events`
--

INSERT INTO `events` (`id`, `parcela`, `titol`, `data`, `detalls`, `realitzada`, `user`) VALUES
(1, 1, 'Desbrosse', '2015-01-06', 'S''ha realitzat un desbroçat de la parcel·la de varios anys.', 0, 41);

-- --------------------------------------------------------

--
-- Estructura de la taula `familia`
--

CREATE TABLE IF NOT EXISTS `familia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL COMMENT 'Nom científic de la família',
  `noms_varios` varchar(400) DEFAULT NULL COMMENT 'Per si hi ha altres noms de la família',
  `detalls` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Bolcant dades de la taula `familia`
--

INSERT INTO `familia` (`id`, `nom`, `noms_varios`, `detalls`) VALUES
(1, 'Solanaceae', NULL, 'Les plantes d''aquesta família requerixen una gran quantitat de sol per a tindre un bon desenvolupament.'),
(2, 'Leguminosae', NULL, 'Les leguminoses ajuden a recuperar la terra i a fixar nitrògen.'),
(3, 'Cucurbitaceae', NULL, 'Carabasses, melons...'),
(4, 'Asteraceae', 'Compostes', 'Lletugues, carxofes...'),
(5, 'Brassicaceae', 'Cruciferae, cruciferas', 'Cols de fulla, repollo'),
(6, 'Apiaceae', 'Umbeliferes', 'Api, julivert, carlota...'),
(7, 'Amaryllidaceae', NULL, 'Cebes, alls, bulbos'),
(8, 'Quenopodiaceae', NULL, 'Espinaques, remolatxa, '),
(9, 'Amaranthaceae', NULL, 'Bledes'),
(13, 'prova', NULL, NULL),
(14, 'prova', NULL, NULL),
(15, 'prova', NULL, NULL),
(16, 'prova', NULL, NULL),
(17, 'prova', 'vario1, vario2, vario3', NULL);

-- --------------------------------------------------------

--
-- Estructura de la taula `grup`
--

CREATE TABLE IF NOT EXISTS `grup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del grup, de l''1 al 4',
  `nom` varchar(30) NOT NULL,
  `noms_varios` varchar(400) DEFAULT NULL COMMENT 'Per si hi ha varios noms per a designar a cadascun dels grups de rotació',
  `detalls` varchar(2000) DEFAULT NULL COMMENT 'Detalls del grup, quines famílies hi pertanyen, etc.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT=' L''id de les files marca l''ordre de rotaci' AUTO_INCREMENT=5 ;

--
-- Bolcant dades de la taula `grup`
--

INSERT INTO `grup` (`id`, `nom`, `noms_varios`, `detalls`) VALUES
(1, 'Arrel', '', ' (Zanahorias, Remolachas, Rabanitos etc.). Consumidoras de Potasio en capas más profundas de la tierra.'),
(2, 'Fulla', '', '(Lechugas, Espinacas, Coles etc.). Consumidoras de Nitrógeno en capas superficiales de la tierra.'),
(3, 'Leguminosa', '', '(Judías, Habas, Guisantes etc.). Reponedoras de nutrientes.'),
(4, 'Fruit i flor', '', '(Tomates, Melones, Berenjenas etc.), (Coliflores, Alcachofas, etc.), Patatas y Maíz. Requieren muchos nutrientes y agotan mucho la tierra.');

-- --------------------------------------------------------

--
-- Estructura de la taula `img_bancal`
--

CREATE TABLE IF NOT EXISTS `img_bancal` (
  `id_foto` int(11) NOT NULL AUTO_INCREMENT,
  `id_bancal` int(11) NOT NULL,
  `titol` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Titol de la foto',
  `detalls` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id_foto`,`user`),
  KEY `id_planta` (`id_bancal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='emmagatzema fotos de les plantes. un registre per foto. idPlanta_idFoto.jpg/...' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `img_plaga`
--

CREATE TABLE IF NOT EXISTS `img_plaga` (
  `id_foto` int(11) NOT NULL AUTO_INCREMENT,
  `id_plaga` int(11) NOT NULL,
  `titol` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Titol de la foto',
  `detalls` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id_foto`,`user`),
  KEY `id_planta` (`id_plaga`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='emmagatzema fotos de les plantes. un registre per foto. idPlanta_idFoto.jpg/...' AUTO_INCREMENT=6 ;

--
-- Bolcant dades de la taula `img_plaga`
--

INSERT INTO `img_plaga` (`id_foto`, `id_plaga`, `titol`, `detalls`, `user`) VALUES
(1, 157, 'Pulgó', 'Pot ser de distints colors, generalment negre, verd o blanc.', 41),
(1, 163, 'Pulgó', 'Pot ser de distints colors, generalment negre, verd o blanc.', 42),
(1, 169, 'Pulgó', 'Pot ser de distints colors, generalment negre, verd o blanc.', 43),
(1, 175, 'Pulgó', 'Pot ser de distints colors, generalment negre, verd o blanc.', 44),
(2, 158, 'Mosca blanca', 'Posa els ous a l''envés de les fulles', 41),
(2, 164, 'Mosca blanca', 'Posa els ous a l''envés de les fulles', 42),
(2, 170, 'Mosca blanca', 'Posa els ous a l''envés de les fulles', 43),
(2, 176, 'Mosca blanca', 'Posa els ous a l''envés de les fulles', 44),
(3, 159, 'Oidio', 'Fong blanquinós que apareix a la superfície de les fulles. La corriola és un bon indicador de la presència del fong.', 41),
(3, 165, 'Oidio', 'Fong blanquinós que apareix a la superfície de les fulles. La corriola és un bon indicador de la presència del fong.', 42),
(3, 171, 'Oidio', 'Fong blanquinós que apareix a la superfície de les fulles. La corriola és un bon indicador de la presència del fong.', 43),
(3, 177, 'Oidio', 'Fong blanquinós que apareix a la superfície de les fulles. La corriola és un bon indicador de la presència del fong.', 44),
(5, 161, 'Escarabat de ka creïlla', 'Amb calor i aliment suficient, son realment prolífics en la posta d''ous. Cal revisar quan hi haja risc per a prendre mesures a priori.', 41),
(5, 167, 'Escarabat de ka creïlla', 'Amb calor i aliment suficient, son realment prolífics en la posta d''ous. Cal revisar quan hi haja risc per a prendre mesures a priori.', 42),
(5, 173, 'Escarabat de ka creïlla', 'Amb calor i aliment suficient, son realment prolífics en la posta d''ous. Cal revisar quan hi haja risc per a prendre mesures a priori.', 43),
(5, 179, 'Escarabat de ka creïlla', 'Amb calor i aliment suficient, son realment prolífics en la posta d''ous. Cal revisar quan hi haja risc per a prendre mesures a priori.', 44);

-- --------------------------------------------------------

--
-- Estructura de la taula `img_planta`
--

CREATE TABLE IF NOT EXISTS `img_planta` (
  `id_foto` int(11) NOT NULL AUTO_INCREMENT,
  `id_planta` int(11) NOT NULL,
  `titol` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Titol de la foto',
  `detalls` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id_foto`,`user`),
  KEY `id_planta` (`id_planta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='emmagatzema fotos de les plantes. un registre per foto. idPlanta_idFoto.jpg/...' AUTO_INCREMENT=8 ;

--
-- Bolcant dades de la taula `img_planta`
--

INSERT INTO `img_planta` (`id_foto`, `id_planta`, `titol`, `detalls`, `user`) VALUES
(1, 169, 'Tomaca valenciana', 'Es pot observar la poda a un únic ull', 41),
(1, 175, 'Tomaca valenciana', 'Es pot observar la poda a un únic ull', 42),
(1, 181, 'Tomaca valenciana', 'Es pot observar la poda a un únic ull', 43),
(1, 187, 'Tomaca valenciana', 'Es pot observar la poda a un únic ull', 44),
(2, 174, 'Favera en flor', 'Es poden veure les flors i les faves ja maures, apuntant encara cap a dalt.', 42),
(2, 180, 'Favera en flor', 'Es poden veure les flors i les faves ja maures, apuntant encara cap a dalt.', 43),
(2, 186, 'Favera en flor', 'Es poden veure les flors i les faves ja maures, apuntant encara cap a dalt.', 44),
(3, 170, 'Carxofera en estat vegetatiu', 'En aquesta mata s''han podat les fulles de baix per airejar i evitar plagues, fongs...', 41),
(3, 176, 'Carxofera en estat vegetatiu', 'En aquesta mata s''han podat les fulles de baix per airejar i evitar plagues, fongs...', 42),
(3, 182, 'Carxofera en estat vegetatiu', 'En aquesta mata s''han podat les fulles de baix per airejar i evitar plagues, fongs...', 43),
(3, 188, 'Carxofera en estat vegetatiu', 'En aquesta mata s''han podat les fulles de baix per airejar i evitar plagues, fongs...', 44),
(4, 166, 'Carlotes collides', '5Les carlotes són de les verdures que més treball i habilitat necessiten per a obtindre una bona collita.', 41),
(4, 172, 'Carlotes collides', '5Les carlotes són de les verdures que més treball i habilitat necessiten per a obtindre una bona collita.', 42),
(4, 178, 'Carlotes collides', '5Les carlotes són de les verdures que més treball i habilitat necessiten per a obtindre una bona collita.', 43),
(4, 184, 'Carlotes collides', '5Les carlotes són de les verdures que més treball i habilitat necessiten per a obtindre una bona collita.', 44),
(5, 171, 'Creïllera i tubercles collits', 'Per a evitar la verdor de la creïlla, que resulta tòxica, cal cobrir-les bé amb els aporcaments necessaris.', 41),
(5, 177, 'Creïllera i tubercles collits', 'Per a evitar la verdor de la creïlla, que resulta tòxica, cal cobrir-les bé amb els aporcaments necessaris.', 42),
(5, 183, 'Creïllera i tubercles collits', 'Per a evitar la verdor de la creïlla, que resulta tòxica, cal cobrir-les bé amb els aporcaments necessaris.', 43),
(5, 189, 'Creïllera i tubercles collits', 'Per a evitar la verdor de la creïlla, que resulta tòxica, cal cobrir-les bé amb els aporcaments necessaris.', 44),
(7, 167, 'All porro', 'Cal adaptar la sembra i el cultiu per a poder blanquejar una part suficient del porro.', 41),
(7, 173, 'All porro', 'Cal adaptar la sembra i el cultiu per a poder blanquejar una part suficient del porro.', 42),
(7, 179, 'All porro', 'Cal adaptar la sembra i el cultiu per a poder blanquejar una part suficient del porro.', 43),
(7, 185, 'All porro', 'Cal adaptar la sembra i el cultiu per a poder blanquejar una part suficient del porro.', 44);

-- --------------------------------------------------------

--
-- Estructura de la taula `mes`
--

CREATE TABLE IF NOT EXISTS `mes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='id també val com numero de mes' AUTO_INCREMENT=13 ;

--
-- Bolcant dades de la taula `mes`
--

INSERT INTO `mes` (`id`, `nom`) VALUES
(1, 'Gener'),
(2, 'Febrer'),
(3, 'Març'),
(4, 'Abril'),
(5, 'Maig'),
(6, 'Juny'),
(7, 'Juliol'),
(8, 'Agost'),
(9, 'Setembre'),
(10, 'Octubre'),
(11, 'Novembre'),
(12, 'Desembre');

-- --------------------------------------------------------

--
-- Estructura de la taula `parcela`
--

CREATE TABLE IF NOT EXISTS `parcela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `ocupada` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'True si hi ha algo plantat, false si es pot plantar',
  `bancal` int(11) NOT NULL COMMENT 'BANCAL al que pertany la PARCELA',
  `superficie` int(20) NOT NULL DEFAULT '0' COMMENT 'superf. en m2',
  `detalls` varchar(400) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`,`user`),
  KEY `bancal` (`bancal`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Bolcant dades de la taula `parcela`
--

INSERT INTO `parcela` (`id`, `nom`, `ocupada`, `bancal`, `superficie`, `detalls`, `user`) VALUES
(1, 'assoleiada', 0, 1, 30, 'asdfasdfasdf', 41),
(2, 'sombra', 0, 1, 22, 'asdfasdf', 41),
(3, 'prova', 0, 2, 4, 'sdasdfasdfk asdfkljasd faslñkdfj asdñklfj asdkfjas ñdlf', 41),
(4, 'prova2', 0, 3, 22, 'asdfasfasd', 42);

-- --------------------------------------------------------

--
-- Estructura de la taula `plaga`
--

CREATE TABLE IF NOT EXISTS `plaga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_comu` varchar(23) CHARACTER SET utf8 NOT NULL,
  `nom_cientific` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `descripcio` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `tractament` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`,`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=181 ;

--
-- Bolcant dades de la taula `plaga`
--

INSERT INTO `plaga` (`id`, `nom_comu`, `nom_cientific`, `descripcio`, `tractament`, `user`) VALUES
(157, 'Pulgon', 'Aphididae', 'Insecte de pocs mm de llarg. Generalment negre. Succiona la savia de la planta i deixa restes de melaza que impedixen la fotosintesi. En ocasions, les formigues son les grangeres de pulgons que els crien per a obtindre la melaza com aliment.', 'Les mariquites son el millor tractament, doncs s''alimenten de pulgó i altres insectes perjudicials. Com a preventiu, sabó potàsic quan la planta tinga certa envergadura i repetir cada 20-25 dies. Si apareix, pulveritzar bé la planta ja que actua per contacte.', 41),
(158, 'Mosca blanca', 'Aleyrodidae', 'Insecte d''entre 1 i 1''5mm de longitud. Tenen una boca puntiaguda per a punxar i obtindre la savia de les plantes.', 'Sabo potasic com al pulgo.', 41),
(159, 'Oidio', 'Oidium leucoconium', 'Fong les espores del qual viatgen per l''aire i arrelen a les fulles, principalment a les plantes dèbils i que estan a la sombra. Es fàcil de diagnosticar, es presenta com una pols o cendra sobre les fulles que va creixent i secant les fulles fins que finalment estes moren. És menys present en flors.', 'El sol pot ser suficient per acabar amb ell. Elimnar les parts infectades per a evitar contagis (ja no es recuperaran). La correhuela sol tindre oidio, pel que és bo mantindre-la a ratlla. Plantar massa dens o regar amb excessiva freqüència pot ser també causa d''oidio. Amb sofre es pot tractar, o utilitzant purín d''ortiga com a preventiu.', 41),
(160, 'Mildiu', 'Peronosporaceae', 'Fong que apareix en el haz de les fulles de color verd, després groc, i per últim marró. En el envés es veu un fieltro o pelusilla blanca. Períodes plujosos o humits seguits de dies càlids (15-30ºC) son els prefectes per a la proliferació.', 'Aplicacions amb cobre o caldo bordelés. Reduïr humitat ambiental, regar menys..', 41),
(161, 'Escarabat de la creïlla', 'Leptinotarsa decemlineata', 'Escarabat d''1cm de llarg en etapa adulta, a ratlles clares i obscures. Posen els ous de color taronja en l''envés de les fulles, en grups de 20 a 60. Tant larves com adults devoren gran quantitat de fulles així com flors, causant un gran mal a la planta si hi ha un excés. Hivernen en la terra i en primavera s''activen amb la calor', 'Bacilus thunergensis com tractament i preventiu. És bona idea revisar les fulles quan les plantes arriben als 40cm en busca d''adults, larves o ous, ja que pot ser una infecció molt lleu que passe a una plaga en uns dies. Poden volar, viatjant de plantes infectades a altres sanes. Ataca a la creïlla i en major mesura a l''albergina', 41),
(162, 'Cotxinilla o caparreta', 'Oniscidea', 'Viuen en llocs obscurs i humits. Alguns poden fer/se una bola per a protegir/se. Salimenten de materia vegetal, insectes morts... Poden ser un problema si hi ha molts. A les composteres fan un gran paper, podem traslladar/los all''i si els trobem a l-hort.', 'Augmentar la ventilació de la planta afectada i aplicar sabó potàsic.', 41),
(163, 'Pulgon', 'Aphididae', 'Insecte de pocs mm de llarg. Generalment negre. Succiona la savia de la planta i deixa restes de melaza que impedixen la fotosintesi. En ocasions, les formigues son les grangeres de pulgons que els crien per a obtindre la melaza com aliment.', 'Les mariquites son el millor tractament, doncs s''alimenten de pulgó i altres insectes perjudicials. Com a preventiu, sabó potàsic quan la planta tinga certa envergadura i repetir cada 20-25 dies. Si apareix, pulveritzar bé la planta ja que actua per contacte.', 42),
(164, 'Mosca blanca', 'Aleyrodidae', 'Insecte d''entre 1 i 1''5mm de longitud. Tenen una boca puntiaguda per a punxar i obtindre la savia de les plantes.', 'Sabo potasic com al pulgo.', 42),
(165, 'Oidio', 'Oidium leucoconium', 'Fong les espores del qual viatgen per l''aire i arrelen a les fulles, principalment a les plantes dèbils i que estan a la sombra. Es fàcil de diagnosticar, es presenta com una pols o cendra sobre les fulles que va creixent i secant les fulles fins que finalment estes moren. És menys present en flors.', 'El sol pot ser suficient per acabar amb ell. Elimnar les parts infectades per a evitar contagis (ja no es recuperaran). La correhuela sol tindre oidio, pel que és bo mantindre-la a ratlla. Plantar massa dens o regar amb excessiva freqüència pot ser també causa d''oidio. Amb sofre es pot tractar, o utilitzant purín d''ortiga com a preventiu.', 42),
(166, 'Mildiu', 'Peronosporaceae', 'Fong que apareix en el haz de les fulles de color verd, després groc, i per últim marró. En el envés es veu un fieltro o pelusilla blanca. Períodes plujosos o humits seguits de dies càlids (15-30ºC) son els prefectes per a la proliferació.', 'Aplicacions amb cobre o caldo bordelés. Reduïr humitat ambiental, regar menys..', 42),
(167, 'Escarabat de la creïlla', 'Leptinotarsa decemlineata', 'Escarabat d''1cm de llarg en etapa adulta, a ratlles clares i obscures. Posen els ous de color taronja en l''envés de les fulles, en grups de 20 a 60. Tant larves com adults devoren gran quantitat de fulles així com flors, causant un gran mal a la planta si hi ha un excés. Hivernen en la terra i en primavera s''activen amb la calor', 'Bacilus thunergensis com tractament i preventiu. És bona idea revisar les fulles quan les plantes arriben als 40cm en busca d''adults, larves o ous, ja que pot ser una infecció molt lleu que passe a una plaga en uns dies. Poden volar, viatjant de plantes infectades a altres sanes. Ataca a la creïlla i en major mesura a l''albergina', 42),
(168, 'Cotxinilla o caparreta', 'Oniscidea', 'Viuen en llocs obscurs i humits. Alguns poden fer/se una bola per a protegir/se. Salimenten de materia vegetal, insectes morts... Poden ser un problema si hi ha molts. A les composteres fan un gran paper, podem traslladar/los all''i si els trobem a l-hort.', 'Augmentar la ventilació de la planta afectada i aplicar sabó potàsic.', 42),
(169, 'Pulgon', 'Aphididae', 'Insecte de pocs mm de llarg. Generalment negre. Succiona la savia de la planta i deixa restes de melaza que impedixen la fotosintesi. En ocasions, les formigues son les grangeres de pulgons que els crien per a obtindre la melaza com aliment.', 'Les mariquites son el millor tractament, doncs s''alimenten de pulgó i altres insectes perjudicials. Com a preventiu, sabó potàsic quan la planta tinga certa envergadura i repetir cada 20-25 dies. Si apareix, pulveritzar bé la planta ja que actua per contacte.', 43),
(170, 'Mosca blanca', 'Aleyrodidae', 'Insecte d''entre 1 i 1''5mm de longitud. Tenen una boca puntiaguda per a punxar i obtindre la savia de les plantes.', 'Sabo potasic com al pulgo.', 43),
(171, 'Oidio', 'Oidium leucoconium', 'Fong les espores del qual viatgen per l''aire i arrelen a les fulles, principalment a les plantes dèbils i que estan a la sombra. Es fàcil de diagnosticar, es presenta com una pols o cendra sobre les fulles que va creixent i secant les fulles fins que finalment estes moren. És menys present en flors.', 'El sol pot ser suficient per acabar amb ell. Elimnar les parts infectades per a evitar contagis (ja no es recuperaran). La correhuela sol tindre oidio, pel que és bo mantindre-la a ratlla. Plantar massa dens o regar amb excessiva freqüència pot ser també causa d''oidio. Amb sofre es pot tractar, o utilitzant purín d''ortiga com a preventiu.', 43),
(172, 'Mildiu', 'Peronosporaceae', 'Fong que apareix en el haz de les fulles de color verd, després groc, i per últim marró. En el envés es veu un fieltro o pelusilla blanca. Períodes plujosos o humits seguits de dies càlids (15-30ºC) son els prefectes per a la proliferació.', 'Aplicacions amb cobre o caldo bordelés. Reduïr humitat ambiental, regar menys..', 43),
(173, 'Escarabat de la creïlla', 'Leptinotarsa decemlineata', 'Escarabat d''1cm de llarg en etapa adulta, a ratlles clares i obscures. Posen els ous de color taronja en l''envés de les fulles, en grups de 20 a 60. Tant larves com adults devoren gran quantitat de fulles així com flors, causant un gran mal a la planta si hi ha un excés. Hivernen en la terra i en primavera s''activen amb la calor', 'Bacilus thunergensis com tractament i preventiu. És bona idea revisar les fulles quan les plantes arriben als 40cm en busca d''adults, larves o ous, ja que pot ser una infecció molt lleu que passe a una plaga en uns dies. Poden volar, viatjant de plantes infectades a altres sanes. Ataca a la creïlla i en major mesura a l''albergina', 43),
(174, 'Cotxinilla o caparreta', 'Oniscidea', 'Viuen en llocs obscurs i humits. Alguns poden fer/se una bola per a protegir/se. Salimenten de materia vegetal, insectes morts... Poden ser un problema si hi ha molts. A les composteres fan un gran paper, podem traslladar/los all''i si els trobem a l-hort.', 'Augmentar la ventilació de la planta afectada i aplicar sabó potàsic.', 43),
(175, 'Pulgon', 'Aphididae', 'Insecte de pocs mm de llarg. Generalment negre. Succiona la savia de la planta i deixa restes de melaza que impedixen la fotosintesi. En ocasions, les formigues son les grangeres de pulgons que els crien per a obtindre la melaza com aliment.', 'Les mariquites son el millor tractament, doncs s''alimenten de pulgó i altres insectes perjudicials. Com a preventiu, sabó potàsic quan la planta tinga certa envergadura i repetir cada 20-25 dies. Si apareix, pulveritzar bé la planta ja que actua per contacte.', 44),
(176, 'Mosca blanca', 'Aleyrodidae', 'Insecte d''entre 1 i 1''5mm de longitud. Tenen una boca puntiaguda per a punxar i obtindre la savia de les plantes.', 'Sabo potasic com al pulgo.', 44),
(177, 'Oidio', 'Oidium leucoconium', 'Fong les espores del qual viatgen per l''aire i arrelen a les fulles, principalment a les plantes dèbils i que estan a la sombra. Es fàcil de diagnosticar, es presenta com una pols o cendra sobre les fulles que va creixent i secant les fulles fins que finalment estes moren. És menys present en flors.', 'El sol pot ser suficient per acabar amb ell. Elimnar les parts infectades per a evitar contagis (ja no es recuperaran). La correhuela sol tindre oidio, pel que és bo mantindre-la a ratlla. Plantar massa dens o regar amb excessiva freqüència pot ser també causa d''oidio. Amb sofre es pot tractar, o utilitzant purín d''ortiga com a preventiu.', 44),
(178, 'Mildiu', 'Peronosporaceae', 'Fong que apareix en el haz de les fulles de color verd, després groc, i per últim marró. En el envés es veu un fieltro o pelusilla blanca. Períodes plujosos o humits seguits de dies càlids (15-30ºC) son els prefectes per a la proliferació.', 'Aplicacions amb cobre o caldo bordelés. Reduïr humitat ambiental, regar menys..', 44),
(179, 'Escarabat de la creïlla', 'Leptinotarsa decemlineata', 'Escarabat d''1cm de llarg en etapa adulta, a ratlles clares i obscures. Posen els ous de color taronja en l''envés de les fulles, en grups de 20 a 60. Tant larves com adults devoren gran quantitat de fulles així com flors, causant un gran mal a la planta si hi ha un excés. Hivernen en la terra i en primavera s''activen amb la calor', 'Bacilus thunergensis com tractament i preventiu. És bona idea revisar les fulles quan les plantes arriben als 40cm en busca d''adults, larves o ous, ja que pot ser una infecció molt lleu que passe a una plaga en uns dies. Poden volar, viatjant de plantes infectades a altres sanes. Ataca a la creïlla i en major mesura a l''albergina', 44),
(180, 'Cotxinilla o caparreta', 'Oniscidea', 'Viuen en llocs obscurs i humits. Alguns poden fer/se una bola per a protegir/se. Salimenten de materia vegetal, insectes morts... Poden ser un problema si hi ha molts. A les composteres fan un gran paper, podem traslladar/los all''i si els trobem a l-hort.', 'Augmentar la ventilació de la planta afectada i aplicar sabó potàsic.', 44);

-- --------------------------------------------------------

--
-- Estructura de la taula `planta`
--

CREATE TABLE IF NOT EXISTS `planta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_comu` varchar(30) NOT NULL,
  `nom_cientific` varchar(46) DEFAULT NULL,
  `grup` int(11) DEFAULT NULL,
  `familia` int(11) DEFAULT NULL,
  `sembra_ini` date DEFAULT NULL COMMENT 'Marca la data d''inici de sembra',
  `sembra_fi` date DEFAULT NULL COMMENT 'Marca la data de fi de sembra',
  `marc_ample` int(11) DEFAULT NULL COMMENT 'Distància entre cavallons',
  `marc_llarg` int(11) DEFAULT NULL COMMENT 'Distància entre plantes dins del cavalló',
  `produccio` varchar(23) DEFAULT NULL,
  `sembra` varchar(2000) DEFAULT NULL COMMENT 'Detalls de la sembra, prepraració del planter, etc.',
  `cultiu` varchar(2000) DEFAULT NULL,
  `collita` varchar(2000) DEFAULT NULL COMMENT 'Detalls de la recol·lecció de la planta',
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`,`user`),
  KEY `grup` (`grup`),
  KEY `familia` (`familia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='llistat de plantes i dades com familia, plagues...' AUTO_INCREMENT=190 ;

--
-- Bolcant dades de la taula `planta`
--

INSERT INTO `planta` (`id`, `nom_comu`, `nom_cientific`, `grup`, `familia`, `sembra_ini`, `sembra_fi`, `marc_ample`, `marc_llarg`, `produccio`, `sembra`, `cultiu`, `collita`, `user`) VALUES
(166, 'Carlota', 'Daucus carota', 1, 6, '2014-09-01', '2014-05-01', 30, 15, '600g/m2', 'Per a la sembra en cavallons, plantar en la cresta unes poques llavors cada 6-8cm, soterrades uns 2-4cm. Abans de sembrar cal regar els cavallons, si es rega després correm el risc d''arrastrar les llavors o destapar-les, dificultant així la germinació. Mantindre la terra humida. Una vegada broten, clarejar fins deixar 1 o 2, suficient per a que puguen creixer suficientment. Poden plantar-se en zig-zag per aprofitar més l''espai.', 'La carlota té un cicle de dos anys. Durant el primer s''aprofita l''arrel, el segon produix la flor i les llavors. Cal collir-les abans de que comence aquesta segona fase, ja que es tornen massa dures per al consum. Són especialment sensibles a la competència amb males herbes, pel que cal tindre perfectament net el camp abans i durant el cultiu. És dels cultius més difícils de dur endvant exitosament.', 'Segons varietat i altres factors, entre 3 i 7 mesos després de la sembra. Es pot regar uns dies abans de la collita per a facilitar l''arrancament.', 41),
(167, 'Porro', 'Allium porrum', 2, 7, '2013-11-01', '2014-02-01', 30, 20, 'ND', 'Pot fer-se sembra directa al lloc definitiu, o més recomanablement utilitzar planter. Amb açó aconseguim certa uniformitat en el desenvolupament. Calen uns 70-90 dies en el planter.', 'Cal preparar el cultiu per a poder aporcar-li terra periòdicament, i augmentar així la part comestible del porro.', 'És recomanable realitzar-la en saó, per a evitar trencament al treure els porros. Pot usar-se una ferramenta similar a una forca per a simplificar la feina.', 41),
(169, 'Tomaquera', 'Solanum lycopersicum', 4, 1, '2014-03-15', '2014-06-30', 50, 40, '1-3kg/mata', 'Uns 60 dies abans de posar al camp. Sembrar 2 o 3 llavors per alveol per a deixar la més forta quan alcancen els 10cm. Vigilar aparició de plagues, ja que els brots de tomaquera son aliments predilectes de més d''un insecte.', 'Cal podarla al mes del trasplante definitiu i dixarli un ull únicament per a poder encanyar-la (varietat valenciana)', 'Quan comencen a ''pintar'', és a dir, mostren el color roig, ja podem collir. Tindrem en compte els dies que transcorreran fins a consumir-la per agafar-la més verda o més madura.\r\nPer a conservar les llavors, deixar madurar en la planta fins que comence a secar-se. Quan passe, treure les llavors i deixar assecar per a conservar-les.', 41),
(170, 'Carxofera', 'Cynara scolymus', 4, 4, '2014-07-15', '2014-09-15', 120, 80, '1.5kg/mata', 'Pot realitzar-se per llavor o per estaca, que és la més utilitzada. Es sembren dos estaques per forat, per arrancar després la més dèbil, si les dues prosperen. Després del segon reg, podem aprofitar la saó per replantar les que hagen fallat', 'La carxofera té un cicle productiu de tres anys, encara que poden trobar-se cultius a un i dos anys. El primer any la producció no és elevada, ja que encara no s''ha desenvolupat el sistema d''arrels. El segon i tercer any són els més productius, mentre que a partir del quart la vellea de la planta fa recomanable eliminar-la, a més de que instal·lant el carxofar en altra parcela afavorim les rotacions al bancal. ', 'Segons el clima, la collita comença entre octubre i gener, allargant-se fins a juny en les zones més fredes. Cal collir-les abans de que maduren massa i es tornen dures i fibroses, és a dir, mentre les fulles estan apegades a la flor. Tallar uns 8-10cm de la tija junt amb la carxofa.', 41),
(171, 'Creïlla', 'Solanum tuberosum ', 4, 1, '2014-01-01', '2014-01-31', 70, 30, '2-3kg/m2', 'Encara que poden sembrar-se de llavor, només contemplarem la opció de plantar la creïlla. Poden deixar-se a obscures sobre estants de fusta per provocar l''aparició dels grills, les protuberàncies que es formen a la superfície de la creïlla quan no es consumix en un període de temps determinat. Aquestes brotacions es convertiran en la part aèria de la planta, pel que interessa que tinguen bon tamany quan es planta la creïlla en terra. Si hi ha més d''un brot en la creïlla, podem partir-la i aprofitar per sembrar diverses mates d''un sol tubercle. Soterrar-les a uns 5-10cm de profunditat.', 'Es tracta d''una planta de clima templat, la temperatura òptima oscila entre 13º i 18º. Cal assegurar-se de que no es produïran gelades despres de la brotació, ja que temperatures per baix de 0ºC maten la planta. Per a plantar, la terra ha d''estar a més de 7ºC. Conforme van creixent, cal anar aporcant per evitar l''exposició dels tubercles al sol, ja que verdegen per la producció de solanina, tòxica per al consum. Disposar els cavallons de tal forma que permeten l''aporcat posterior. Respecte a les necessitats d''aigua, una lleugera sequera abans de la formació dels tubercles afavorix un sistema radicular potent. En la resta del cultiu, tindre en compte que la creïlla és una gran consumidora d''aigua, però com la majoria de plantes, no els agrada l''excés.', 'Si es realitza la collita manual, anar amb molta cura de no fer malbé els tubercles. Es pot segar abans la part visible de la planta per a provocar l''engrossiment de la creïlla, a més de simplificar la tasca de la recol·lecció. Retirar-los tots, aprofitables per a menjar o no, o rebrotaran més endavant.', 41),
(172, 'Carlota', 'Daucus carota', 1, 6, '2014-09-01', '2014-05-01', 30, 15, '600g/m2', 'Per a la sembra en cavallons, plantar en la cresta unes poques llavors cada 6-8cm, soterrades uns 2-4cm. Abans de sembrar cal regar els cavallons, si es rega després correm el risc d''arrastrar les llavors o destapar-les, dificultant així la germinació. Mantindre la terra humida. Una vegada broten, clarejar fins deixar 1 o 2, suficient per a que puguen creixer suficientment. Poden plantar-se en zig-zag per aprofitar més l''espai.', 'La carlota té un cicle de dos anys. Durant el primer s''aprofita l''arrel, el segon produix la flor i les llavors. Cal collir-les abans de que comence aquesta segona fase, ja que es tornen massa dures per al consum. Són especialment sensibles a la competència amb males herbes, pel que cal tindre perfectament net el camp abans i durant el cultiu. És dels cultius més difícils de dur endvant exitosament.', 'Segons varietat i altres factors, entre 3 i 7 mesos després de la sembra. Es pot regar uns dies abans de la collita per a facilitar l''arrancament.', 42),
(173, 'Porro', 'Allium porrum', 2, 7, '2013-11-01', '2014-02-01', 30, 20, 'ND', 'Pot fer-se sembra directa al lloc definitiu, o més recomanablement utilitzar planter. Amb açó aconseguim certa uniformitat en el desenvolupament. Calen uns 70-90 dies en el planter.', 'Cal preparar el cultiu per a poder aporcar-li terra periòdicament, i augmentar així la part comestible del porro.', 'És recomanable realitzar-la en saó, per a evitar trencament al treure els porros. Pot usar-se una ferramenta similar a una forca per a simplificar la feina.', 42),
(174, 'Favera', 'Vicia faba', 3, 2, '2014-09-01', '2014-01-01', 70, 70, '1kg/mata', 'Sembra directa, amb 1, 2 o 3 llavors. Reguem bé abans i després de posar-les. Després no caldrà tornar a regar fins que naixquen.', 'tapar amb palla per a evitar brosses. recomanable pulveritzar en potàsic, ja que es fàcil que li aparega pulgó', 'Uns 60 dies després de la plantació, fins a que moren als X mesos. Es cullen quan fan entre 15-20cm per a menjar tendres. Per a guardar llavor, deixar-les fer-se grans i assecar-les al sol dins de la vaina, fins que perguen humitat.', 42),
(175, 'Tomaquera', 'Solanum lycopersicum', 4, 1, '2014-03-15', '2014-06-30', 50, 40, '1-3kg/mata', 'Uns 60 dies abans de posar al camp. Sembrar 2 o 3 llavors per alveol per a deixar la més forta quan alcancen els 10cm. Vigilar aparició de plagues, ja que els brots de tomaquera son aliments predilectes de més d''un insecte.', 'Cal podarla al mes del trasplante definitiu i dixarli un ull únicament per a poder encanyar-la (varietat valenciana)', 'Quan comencen a ''pintar'', és a dir, mostren el color roig, ja podem collir. Tindrem en compte els dies que transcorreran fins a consumir-la per agafar-la més verda o més madura.\r\nPer a conservar les llavors, deixar madurar en la planta fins que comence a secar-se. Quan passe, treure les llavors i deixar assecar per a conservar-les.', 42),
(176, 'Carxofera', 'Cynara scolymus', 4, 4, '2014-07-15', '2014-09-15', 120, 80, '1.5kg/mata', 'Pot realitzar-se per llavor o per estaca, que és la més utilitzada. Es sembren dos estaques per forat, per arrancar després la més dèbil, si les dues prosperen. Després del segon reg, podem aprofitar la saó per replantar les que hagen fallat', 'La carxofera té un cicle productiu de tres anys, encara que poden trobar-se cultius a un i dos anys. El primer any la producció no és elevada, ja que encara no s''ha desenvolupat el sistema d''arrels. El segon i tercer any són els més productius, mentre que a partir del quart la vellea de la planta fa recomanable eliminar-la, a més de que instal·lant el carxofar en altra parcela afavorim les rotacions al bancal. ', 'Segons el clima, la collita comença entre octubre i gener, allargant-se fins a juny en les zones més fredes. Cal collir-les abans de que maduren massa i es tornen dures i fibroses, és a dir, mentre les fulles estan apegades a la flor. Tallar uns 8-10cm de la tija junt amb la carxofa.', 42),
(177, 'Creïlla', 'Solanum tuberosum ', 4, 1, '2014-01-01', '2014-01-31', 70, 30, '2-3kg/m2', 'Encara que poden sembrar-se de llavor, només contemplarem la opció de plantar la creïlla. Poden deixar-se a obscures sobre estants de fusta per provocar l''aparició dels grills, les protuberàncies que es formen a la superfície de la creïlla quan no es consumix en un període de temps determinat. Aquestes brotacions es convertiran en la part aèria de la planta, pel que interessa que tinguen bon tamany quan es planta la creïlla en terra. Si hi ha més d''un brot en la creïlla, podem partir-la i aprofitar per sembrar diverses mates d''un sol tubercle. Soterrar-les a uns 5-10cm de profunditat.', 'Es tracta d''una planta de clima templat, la temperatura òptima oscila entre 13º i 18º. Cal assegurar-se de que no es produïran gelades despres de la brotació, ja que temperatures per baix de 0ºC maten la planta. Per a plantar, la terra ha d''estar a més de 7ºC. Conforme van creixent, cal anar aporcant per evitar l''exposició dels tubercles al sol, ja que verdegen per la producció de solanina, tòxica per al consum. Disposar els cavallons de tal forma que permeten l''aporcat posterior. Respecte a les necessitats d''aigua, una lleugera sequera abans de la formació dels tubercles afavorix un sistema radicular potent. En la resta del cultiu, tindre en compte que la creïlla és una gran consumidora d''aigua, però com la majoria de plantes, no els agrada l''excés.', 'Si es realitza la collita manual, anar amb molta cura de no fer malbé els tubercles. Es pot segar abans la part visible de la planta per a provocar l''engrossiment de la creïlla, a més de simplificar la tasca de la recol·lecció. Retirar-los tots, aprofitables per a menjar o no, o rebrotaran més endavant.', 42),
(178, 'Carlota', 'Daucus carota', 1, 6, '2014-09-01', '2014-05-01', 30, 15, '600g/m2', 'Per a la sembra en cavallons, plantar en la cresta unes poques llavors cada 6-8cm, soterrades uns 2-4cm. Abans de sembrar cal regar els cavallons, si es rega després correm el risc d''arrastrar les llavors o destapar-les, dificultant així la germinació. Mantindre la terra humida. Una vegada broten, clarejar fins deixar 1 o 2, suficient per a que puguen creixer suficientment. Poden plantar-se en zig-zag per aprofitar més l''espai.', 'La carlota té un cicle de dos anys. Durant el primer s''aprofita l''arrel, el segon produix la flor i les llavors. Cal collir-les abans de que comence aquesta segona fase, ja que es tornen massa dures per al consum. Són especialment sensibles a la competència amb males herbes, pel que cal tindre perfectament net el camp abans i durant el cultiu. És dels cultius més difícils de dur endvant exitosament.', 'Segons varietat i altres factors, entre 3 i 7 mesos després de la sembra. Es pot regar uns dies abans de la collita per a facilitar l''arrancament.', 43),
(179, 'Porro', 'Allium porrum', 2, 7, '2013-11-01', '2014-02-01', 30, 20, 'ND', 'Pot fer-se sembra directa al lloc definitiu, o més recomanablement utilitzar planter. Amb açó aconseguim certa uniformitat en el desenvolupament. Calen uns 70-90 dies en el planter.', 'Cal preparar el cultiu per a poder aporcar-li terra periòdicament, i augmentar així la part comestible del porro.', 'És recomanable realitzar-la en saó, per a evitar trencament al treure els porros. Pot usar-se una ferramenta similar a una forca per a simplificar la feina.', 43),
(180, 'Favera', 'Vicia faba', 3, 2, '2014-09-01', '2014-01-01', 70, 70, '1kg/mata', 'Sembra directa, amb 1, 2 o 3 llavors. Reguem bé abans i després de posar-les. Després no caldrà tornar a regar fins que naixquen.', 'tapar amb palla per a evitar brosses. recomanable pulveritzar en potàsic, ja que es fàcil que li aparega pulgó', 'Uns 60 dies després de la plantació, fins a que moren als X mesos. Es cullen quan fan entre 15-20cm per a menjar tendres. Per a guardar llavor, deixar-les fer-se grans i assecar-les al sol dins de la vaina, fins que perguen humitat.', 43),
(181, 'Tomaquera', 'Solanum lycopersicum', 4, 1, '2014-03-15', '2014-06-30', 50, 40, '1-3kg/mata', 'Uns 60 dies abans de posar al camp. Sembrar 2 o 3 llavors per alveol per a deixar la més forta quan alcancen els 10cm. Vigilar aparició de plagues, ja que els brots de tomaquera son aliments predilectes de més d''un insecte.', 'Cal podarla al mes del trasplante definitiu i dixarli un ull únicament per a poder encanyar-la (varietat valenciana)', 'Quan comencen a ''pintar'', és a dir, mostren el color roig, ja podem collir. Tindrem en compte els dies que transcorreran fins a consumir-la per agafar-la més verda o més madura.\r\nPer a conservar les llavors, deixar madurar en la planta fins que comence a secar-se. Quan passe, treure les llavors i deixar assecar per a conservar-les.', 43),
(182, 'Carxofera', 'Cynara scolymus', 4, 4, '2014-07-15', '2014-09-15', 120, 80, '1.5kg/mata', 'Pot realitzar-se per llavor o per estaca, que és la més utilitzada. Es sembren dos estaques per forat, per arrancar després la més dèbil, si les dues prosperen. Després del segon reg, podem aprofitar la saó per replantar les que hagen fallat', 'La carxofera té un cicle productiu de tres anys, encara que poden trobar-se cultius a un i dos anys. El primer any la producció no és elevada, ja que encara no s''ha desenvolupat el sistema d''arrels. El segon i tercer any són els més productius, mentre que a partir del quart la vellea de la planta fa recomanable eliminar-la, a més de que instal·lant el carxofar en altra parcela afavorim les rotacions al bancal. ', 'Segons el clima, la collita comença entre octubre i gener, allargant-se fins a juny en les zones més fredes. Cal collir-les abans de que maduren massa i es tornen dures i fibroses, és a dir, mentre les fulles estan apegades a la flor. Tallar uns 8-10cm de la tija junt amb la carxofa.', 43),
(183, 'Creïlla', 'Solanum tuberosum ', 4, 1, '2014-01-01', '2014-01-31', 70, 30, '2-3kg/m2', 'Encara que poden sembrar-se de llavor, només contemplarem la opció de plantar la creïlla. Poden deixar-se a obscures sobre estants de fusta per provocar l''aparició dels grills, les protuberàncies que es formen a la superfície de la creïlla quan no es consumix en un període de temps determinat. Aquestes brotacions es convertiran en la part aèria de la planta, pel que interessa que tinguen bon tamany quan es planta la creïlla en terra. Si hi ha més d''un brot en la creïlla, podem partir-la i aprofitar per sembrar diverses mates d''un sol tubercle. Soterrar-les a uns 5-10cm de profunditat.', 'Es tracta d''una planta de clima templat, la temperatura òptima oscila entre 13º i 18º. Cal assegurar-se de que no es produïran gelades despres de la brotació, ja que temperatures per baix de 0ºC maten la planta. Per a plantar, la terra ha d''estar a més de 7ºC. Conforme van creixent, cal anar aporcant per evitar l''exposició dels tubercles al sol, ja que verdegen per la producció de solanina, tòxica per al consum. Disposar els cavallons de tal forma que permeten l''aporcat posterior. Respecte a les necessitats d''aigua, una lleugera sequera abans de la formació dels tubercles afavorix un sistema radicular potent. En la resta del cultiu, tindre en compte que la creïlla és una gran consumidora d''aigua, però com la majoria de plantes, no els agrada l''excés.', 'Si es realitza la collita manual, anar amb molta cura de no fer malbé els tubercles. Es pot segar abans la part visible de la planta per a provocar l''engrossiment de la creïlla, a més de simplificar la tasca de la recol·lecció. Retirar-los tots, aprofitables per a menjar o no, o rebrotaran més endavant.', 43),
(184, 'Carlota', 'Daucus carota', 1, 6, '2014-09-01', '2014-05-01', 30, 15, '600g/m2', 'Per a la sembra en cavallons, plantar en la cresta unes poques llavors cada 6-8cm, soterrades uns 2-4cm. Abans de sembrar cal regar els cavallons, si es rega després correm el risc d''arrastrar les llavors o destapar-les, dificultant així la germinació. Mantindre la terra humida. Una vegada broten, clarejar fins deixar 1 o 2, suficient per a que puguen creixer suficientment. Poden plantar-se en zig-zag per aprofitar més l''espai.', 'La carlota té un cicle de dos anys. Durant el primer s''aprofita l''arrel, el segon produix la flor i les llavors. Cal collir-les abans de que comence aquesta segona fase, ja que es tornen massa dures per al consum. Són especialment sensibles a la competència amb males herbes, pel que cal tindre perfectament net el camp abans i durant el cultiu. És dels cultius més difícils de dur endvant exitosament.', 'Segons varietat i altres factors, entre 3 i 7 mesos després de la sembra. Es pot regar uns dies abans de la collita per a facilitar l''arrancament.', 44),
(185, 'Porro', 'Allium porrum', 2, 7, '2013-11-01', '2014-02-01', 30, 20, 'ND', 'Pot fer-se sembra directa al lloc definitiu, o més recomanablement utilitzar planter. Amb açó aconseguim certa uniformitat en el desenvolupament. Calen uns 70-90 dies en el planter.', 'Cal preparar el cultiu per a poder aporcar-li terra periòdicament, i augmentar així la part comestible del porro.', 'És recomanable realitzar-la en saó, per a evitar trencament al treure els porros. Pot usar-se una ferramenta similar a una forca per a simplificar la feina.', 44),
(186, 'Favera', 'Vicia faba', 3, 2, '2014-09-01', '2014-01-01', 70, 70, '1kg/mata', 'Sembra directa, amb 1, 2 o 3 llavors. Reguem bé abans i després de posar-les. Després no caldrà tornar a regar fins que naixquen.', 'tapar amb palla per a evitar brosses. recomanable pulveritzar en potàsic, ja que es fàcil que li aparega pulgó', 'Uns 60 dies després de la plantació, fins a que moren als X mesos. Es cullen quan fan entre 15-20cm per a menjar tendres. Per a guardar llavor, deixar-les fer-se grans i assecar-les al sol dins de la vaina, fins que perguen humitat.', 44),
(187, 'Tomaquera', 'Solanum lycopersicum', 4, 1, '2014-03-15', '2014-06-30', 50, 40, '1-3kg/mata', 'Uns 60 dies abans de posar al camp. Sembrar 2 o 3 llavors per alveol per a deixar la més forta quan alcancen els 10cm. Vigilar aparició de plagues, ja que els brots de tomaquera son aliments predilectes de més d''un insecte.', 'Cal podarla al mes del trasplante definitiu i dixarli un ull únicament per a poder encanyar-la (varietat valenciana)', 'Quan comencen a ''pintar'', és a dir, mostren el color roig, ja podem collir. Tindrem en compte els dies que transcorreran fins a consumir-la per agafar-la més verda o més madura.\r\nPer a conservar les llavors, deixar madurar en la planta fins que comence a secar-se. Quan passe, treure les llavors i deixar assecar per a conservar-les.', 44),
(188, 'Carxofera', 'Cynara scolymus', 4, 4, '2014-07-15', '2014-09-15', 120, 80, '1.5kg/mata', 'Pot realitzar-se per llavor o per estaca, que és la més utilitzada. Es sembren dos estaques per forat, per arrancar després la més dèbil, si les dues prosperen. Després del segon reg, podem aprofitar la saó per replantar les que hagen fallat', 'La carxofera té un cicle productiu de tres anys, encara que poden trobar-se cultius a un i dos anys. El primer any la producció no és elevada, ja que encara no s''ha desenvolupat el sistema d''arrels. El segon i tercer any són els més productius, mentre que a partir del quart la vellea de la planta fa recomanable eliminar-la, a més de que instal·lant el carxofar en altra parcela afavorim les rotacions al bancal. ', 'Segons el clima, la collita comença entre octubre i gener, allargant-se fins a juny en les zones més fredes. Cal collir-les abans de que maduren massa i es tornen dures i fibroses, és a dir, mentre les fulles estan apegades a la flor. Tallar uns 8-10cm de la tija junt amb la carxofa.', 44),
(189, 'Creïlla', 'Solanum tuberosum ', 4, 1, '2014-01-01', '2014-01-31', 70, 30, '2-3kg/m2', 'Encara que poden sembrar-se de llavor, només contemplarem la opció de plantar la creïlla. Poden deixar-se a obscures sobre estants de fusta per provocar l''aparició dels grills, les protuberàncies que es formen a la superfície de la creïlla quan no es consumix en un període de temps determinat. Aquestes brotacions es convertiran en la part aèria de la planta, pel que interessa que tinguen bon tamany quan es planta la creïlla en terra. Si hi ha més d''un brot en la creïlla, podem partir-la i aprofitar per sembrar diverses mates d''un sol tubercle. Soterrar-les a uns 5-10cm de profunditat.', 'Es tracta d''una planta de clima templat, la temperatura òptima oscila entre 13º i 18º. Cal assegurar-se de que no es produïran gelades despres de la brotació, ja que temperatures per baix de 0ºC maten la planta. Per a plantar, la terra ha d''estar a més de 7ºC. Conforme van creixent, cal anar aporcant per evitar l''exposició dels tubercles al sol, ja que verdegen per la producció de solanina, tòxica per al consum. Disposar els cavallons de tal forma que permeten l''aporcat posterior. Respecte a les necessitats d''aigua, una lleugera sequera abans de la formació dels tubercles afavorix un sistema radicular potent. En la resta del cultiu, tindre en compte que la creïlla és una gran consumidora d''aigua, però com la majoria de plantes, no els agrada l''excés.', 'Si es realitza la collita manual, anar amb molta cura de no fer malbé els tubercles. Es pot segar abans la part visible de la planta per a provocar l''engrossiment de la creïlla, a més de simplificar la tasca de la recol·lecció. Retirar-los tots, aprofitables per a menjar o no, o rebrotaran més endavant.', 44);

-- --------------------------------------------------------

--
-- Estructura de la taula `remei`
--

CREATE TABLE IF NOT EXISTS `remei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcio` varchar(2000) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Descripció breu del remei. Inclou info general de aplicacio. La info concreta es crea a la taula tasca_plaga',
  `preparacio` varchar(2000) DEFAULT NULL COMMENT 'Procés de preparació del remei de principi a fi',
  `aplicacio` varchar(2999) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`,`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='el REMEI es relaciona amb la PLAGA a través de TASCA_PLAGA' AUTO_INCREMENT=91 ;

--
-- Bolcant dades de la taula `remei`
--

INSERT INTO `remei` (`id`, `nom`, `descripcio`, `preparacio`, `aplicacio`, `user`) VALUES
(71, 'Sabo potasic', 'Sabó obtés d''extractes de plantes mitjançant processos naturals. Pot trobar-se a tendes especialitzades o supermercats. Actua sobre la majoria d''insectes per contacte. Pot usar-se com a preventiu cada 15 dies.', 'Mesclar 20g de sabó per cada litre d''aigua. Aprox, una cullera sopera per cada 5 litres. Pulveritzar sobre la planta afectada i les circumdants', 'Aplicacio de remei. Procurar temperatures ni molt altes ni molt baixes. no pulveritzar amb risc de gelada. Aplicacio de remei. Procurar temperatures ni molt altes ni molt baixes. no pulveritzar amb risc de gelada. ', 41),
(72, 'Purin de ortiga', 'Estimulant del creixement, propietats curatives front a mildiu o altres carències. Preveu l''atac d''àcars.', '''Ortiga virens'' o ''ortiga dioica'', riques en nitrògen i sals minerals.  2kg d''ortiga fresca o 400g de seca per 20l d''aigua. Es macera durant 5 dies, menejant la mescla cada dia. Després es cola i es diluix en 40l d''aigua (en total, 2kg per 60l. S''usa per a enfortir la planta, regant i pulveritzant.', 'Aplicacio de remei. Procurar temperatures ni molt altes ni molt baixes. no pulveritzar amb risc de gelada. Aplicacio de remei. Procurar temperatures ni molt altes ni molt baixes. no pulveritzar amb risc de gelada. ', 41),
(73, 'Sofre', 'Antioídio i acaricida preventiu i curatiu. Modifica el PH de la superfície foliar creant un clima hostil per al desenvolupament dels fongs. A més preveu l''aparició d''aranya roja.', 'S''afig sofre "micronizado" soluble en proporció de 8g per cada litre d''aigua, i es fumiga a poder ser per ambdues cares de les fulles. El sofre normal (groc) no es disol en aigua, pero es pot espolvorejar sobre la planta. S''usa amb temperatures entre 20 i 30ºC. 3 aplicacions cada 5 dies.', 'Aplicacio de remei. Procurar temperatures ni molt altes ni molt baixes. no pulveritzar amb risc de gelada. Aplicacio de remei. Procurar temperatures ni molt altes ni molt baixes. no pulveritzar amb risc de gelada. ', 41),
(74, 'Llet', 'La llet (animal) conté una sèrie de bactèries i elements que creen una pel·lícula protectora quan s''estenen sobre la superfície de les fulles, tornant-la un medi hostil per al desenvolupament dels fongs.', 'Diluir llet desnatada amb aigua al 5-10%, fer proves i augmentar o reduir la dosi segons necessitat. Netejar estris immediatament després, ja que la llet fa mala olor si es deixa.', NULL, 41),
(75, 'Infusio de brots de tomaquera', 'Pareix ser que els brots de tomaca macerats en aigua son un mitjà efectiu contra els pulgons.', 'Mesclar 1kg de brots tendres amb 10l d''aigua. Diluir aquesta mescla al 50% amb aigua i aplicar com a preventiu.', NULL, 41),
(76, 'Sabo potasic', 'Sabó obtés d''extractes de plantes mitjançant processos naturals. Pot trobar-se a tendes especialitzades o supermercats. Actua sobre la majoria d''insectes per contacte. Pot usar-se com a preventiu cada 15 dies.', 'Mesclar 20g de sabó per cada litre d''aigua. Aprox, una cullera sopera per cada 5 litres. Pulveritzar sobre la planta afectada i les circumdants', NULL, 42),
(77, 'Purin de ortiga', 'Estimulant del creixement, propietats curatives front a mildiu o altres carències. Preveu l''atac d''àcars.', '''Ortiga virens'' o ''ortiga dioica'', riques en nitrògen i sals minerals.  2kg d''ortiga fresca o 400g de seca per 20l d''aigua. Es macera durant 5 dies, menejant la mescla cada dia. Després es cola i es diluix en 40l d''aigua (en total, 2kg per 60l. S''usa per a enfortir la planta, regant i pulveritzant.', NULL, 42),
(78, 'Sofre', 'Antioídio i acaricida preventiu i curatiu. Modifica el PH de la superfície foliar creant un clima hostil per al desenvolupament dels fongs. A més preveu l''aparició d''aranya roja.', 'S''afig sofre "micronizado" soluble en proporció de 8g per cada litre d''aigua, i es fumiga a poder ser per ambdues cares de les fulles. El sofre normal (groc) no es disol en aigua, pero es pot espolvorejar sobre la planta. S''usa amb temperatures entre 20 i 30ºC. 3 aplicacions cada 5 dies.', NULL, 42),
(79, 'Llet', 'La llet (animal) conté una sèrie de bactèries i elements que creen una pel·lícula protectora quan s''estenen sobre la superfície de les fulles, tornant-la un medi hostil per al desenvolupament dels fongs.', 'Diluir llet desnatada amb aigua al 5-10%, fer proves i augmentar o reduir la dosi segons necessitat. Netejar estris immediatament després, ja que la llet fa mala olor si es deixa.', NULL, 42),
(80, 'Infusio de brots de tomaquera', 'Pareix ser que els brots de tomaca macerats en aigua son un mitjà efectiu contra els pulgons.', 'Mesclar 1kg de brots tendres amb 10l d''aigua. Diluir aquesta mescla al 50% amb aigua i aplicar com a preventiu.', NULL, 42),
(81, 'Sabo potasic', 'Sabó obtés d''extractes de plantes mitjançant processos naturals. Pot trobar-se a tendes especialitzades o supermercats. Actua sobre la majoria d''insectes per contacte. Pot usar-se com a preventiu cada 15 dies.', 'Mesclar 20g de sabó per cada litre d''aigua. Aprox, una cullera sopera per cada 5 litres. Pulveritzar sobre la planta afectada i les circumdants', NULL, 43),
(82, 'Purin de ortiga', 'Estimulant del creixement, propietats curatives front a mildiu o altres carències. Preveu l''atac d''àcars.', '''Ortiga virens'' o ''ortiga dioica'', riques en nitrògen i sals minerals.  2kg d''ortiga fresca o 400g de seca per 20l d''aigua. Es macera durant 5 dies, menejant la mescla cada dia. Després es cola i es diluix en 40l d''aigua (en total, 2kg per 60l. S''usa per a enfortir la planta, regant i pulveritzant.', NULL, 43),
(83, 'Sofre', 'Antioídio i acaricida preventiu i curatiu. Modifica el PH de la superfície foliar creant un clima hostil per al desenvolupament dels fongs. A més preveu l''aparició d''aranya roja.', 'S''afig sofre "micronizado" soluble en proporció de 8g per cada litre d''aigua, i es fumiga a poder ser per ambdues cares de les fulles. El sofre normal (groc) no es disol en aigua, pero es pot espolvorejar sobre la planta. S''usa amb temperatures entre 20 i 30ºC. 3 aplicacions cada 5 dies.', NULL, 43),
(84, 'Llet', 'La llet (animal) conté una sèrie de bactèries i elements que creen una pel·lícula protectora quan s''estenen sobre la superfície de les fulles, tornant-la un medi hostil per al desenvolupament dels fongs.', 'Diluir llet desnatada amb aigua al 5-10%, fer proves i augmentar o reduir la dosi segons necessitat. Netejar estris immediatament després, ja que la llet fa mala olor si es deixa.', NULL, 43),
(85, 'Infusio de brots de tomaquera', 'Pareix ser que els brots de tomaca macerats en aigua son un mitjà efectiu contra els pulgons.', 'Mesclar 1kg de brots tendres amb 10l d''aigua. Diluir aquesta mescla al 50% amb aigua i aplicar com a preventiu.', NULL, 43),
(86, 'Sabo potasic', 'Sabó obtés d''extractes de plantes mitjançant processos naturals. Pot trobar-se a tendes especialitzades o supermercats. Actua sobre la majoria d''insectes per contacte. Pot usar-se com a preventiu cada 15 dies.', 'Mesclar 20g de sabó per cada litre d''aigua. Aprox, una cullera sopera per cada 5 litres. Pulveritzar sobre la planta afectada i les circumdants', NULL, 44),
(87, 'Purin de ortiga', 'Estimulant del creixement, propietats curatives front a mildiu o altres carències. Preveu l''atac d''àcars.', '''Ortiga virens'' o ''ortiga dioica'', riques en nitrògen i sals minerals.  2kg d''ortiga fresca o 400g de seca per 20l d''aigua. Es macera durant 5 dies, menejant la mescla cada dia. Després es cola i es diluix en 40l d''aigua (en total, 2kg per 60l. S''usa per a enfortir la planta, regant i pulveritzant.', NULL, 44),
(88, 'Sofre', 'Antioídio i acaricida preventiu i curatiu. Modifica el PH de la superfície foliar creant un clima hostil per al desenvolupament dels fongs. A més preveu l''aparició d''aranya roja.', 'S''afig sofre "micronizado" soluble en proporció de 8g per cada litre d''aigua, i es fumiga a poder ser per ambdues cares de les fulles. El sofre normal (groc) no es disol en aigua, pero es pot espolvorejar sobre la planta. S''usa amb temperatures entre 20 i 30ºC. 3 aplicacions cada 5 dies.', NULL, 44),
(89, 'Llet', 'La llet (animal) conté una sèrie de bactèries i elements que creen una pel·lícula protectora quan s''estenen sobre la superfície de les fulles, tornant-la un medi hostil per al desenvolupament dels fongs.', 'Diluir llet desnatada amb aigua al 5-10%, fer proves i augmentar o reduir la dosi segons necessitat. Netejar estris immediatament després, ja que la llet fa mala olor si es deixa.', NULL, 44),
(90, 'Infusio de brots de tomaquera', 'Pareix ser que els brots de tomaca macerats en aigua son un mitjà efectiu contra els pulgons.', 'Mesclar 1kg de brots tendres amb 10l d''aigua. Diluir aquesta mescla al 50% amb aigua i aplicar com a preventiu.', NULL, 44);

-- --------------------------------------------------------

--
-- Estructura de la taula `tasca_fixa`
--

CREATE TABLE IF NOT EXISTS `tasca_fixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mes` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `descripcio` varchar(4000) NOT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`,`user`),
  KEY `mes` (`mes`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='tasques fixes per mes de l''any' AUTO_INCREMENT=29 ;

--
-- Bolcant dades de la taula `tasca_fixa`
--

INSERT INTO `tasca_fixa` (`id`, `mes`, `nom`, `descripcio`, `user`) VALUES
(1, 1, 'Recollir canyes', 'Cal deixar-les secar unes setmanes per evitar que rebroten quan les usem. Tallar en diagonal a l''altura dels nucs per a facilitar la feina de clavar-les.', 41),
(2, 7, 'Solarització', 'Tapar el terreny amb algun material que aïlle la llum i mantinga el calor (generalment plàstic negre) per sofocar el terreny les setmanes de més calor, a més de mantindre''l sense regar mentre estiga tapat. Evitarem que broten males herbes, i al calfar la terra prolongadament també reduÏm la presència de patògens.', 41),
(3, 1, 'Abonat estiu', 'Si no ho hem fet ja, i anem a utilitzar algun adob que haja de descomposar-se (com excrements de cavall) es bona idea deixar-lo sobre la superfície on plantarem per a que vaja reduint-se i mesclant-se amb la terra.', 41),
(4, 1, 'Peparar semilleros estiu', 'Podem anar preparant ja tomaques, albergines, carabassetes... i altres cultius d''estiu.', 41),
(5, 1, 'asdf', 'asdfasdf asd', 41),
(6, 1, 'robe', 'asdfasdf asd', 41),
(7, 11, 'Collitaoliveres', 'Quan comencen a estar rogetes o negres', 41),
(8, 1, 'Recollir canyes', 'Cal deixar-les secar unes setmanes per evitar que rebroten quan les usem. Tallar en diagonal a l''altura dels nucs per a facilitar la feina de clavar-les.', 42),
(9, 7, 'Solarització', 'Tapar el terreny amb algun material que aïlle la llum i mantinga el calor (generalment plàstic negre) per sofocar el terreny les setmanes de més calor, a més de mantindre''l sense regar mentre estiga tapat. Evitarem que broten males herbes, i al calfar la terra prolongadament també reduÏm la presència de patògens.', 42),
(10, 1, 'Abonat estiu', 'Si no ho hem fet ja, i anem a utilitzar algun adob que haja de descomposar-se (com excrements de cavall) es bona idea deixar-lo sobre la superfície on plantarem per a que vaja reduint-se i mesclant-se amb la terra.', 42),
(11, 1, 'Peparar semilleros estiu', 'Podem anar preparant ja tomaques, albergines, carabassetes... i altres cultius d''estiu.', 42),
(12, 1, 'asdf', 'asdfasdf asd', 42),
(13, 1, 'robe', 'asdfasdf asd', 42),
(14, 11, 'Collitaoliveres', 'Quan comencen a estar rogetes o negres', 42),
(15, 1, 'Recollir canyes', 'Cal deixar-les secar unes setmanes per evitar que rebroten quan les usem. Tallar en diagonal a l''altura dels nucs per a facilitar la feina de clavar-les.', 43),
(16, 7, 'Solarització', 'Tapar el terreny amb algun material que aïlle la llum i mantinga el calor (generalment plàstic negre) per sofocar el terreny les setmanes de més calor, a més de mantindre''l sense regar mentre estiga tapat. Evitarem que broten males herbes, i al calfar la terra prolongadament també reduÏm la presència de patògens.', 43),
(17, 1, 'Abonat estiu', 'Si no ho hem fet ja, i anem a utilitzar algun adob que haja de descomposar-se (com excrements de cavall) es bona idea deixar-lo sobre la superfície on plantarem per a que vaja reduint-se i mesclant-se amb la terra.', 43),
(18, 1, 'Peparar semilleros estiu', 'Podem anar preparant ja tomaques, albergines, carabassetes... i altres cultius d''estiu.', 43),
(19, 1, 'asdf', 'asdfasdf asd', 43),
(20, 1, 'robe', 'asdfasdf asd', 43),
(21, 11, 'Collitaoliveres', 'Quan comencen a estar rogetes o negres', 43),
(22, 1, 'Recollir canyes', 'Cal deixar-les secar unes setmanes per evitar que rebroten quan les usem. Tallar en diagonal a l''altura dels nucs per a facilitar la feina de clavar-les.', 44),
(23, 7, 'Solarització', 'Tapar el terreny amb algun material que aïlle la llum i mantinga el calor (generalment plàstic negre) per sofocar el terreny les setmanes de més calor, a més de mantindre''l sense regar mentre estiga tapat. Evitarem que broten males herbes, i al calfar la terra prolongadament també reduÏm la presència de patògens.', 44),
(24, 1, 'Abonat estiu', 'Si no ho hem fet ja, i anem a utilitzar algun adob que haja de descomposar-se (com excrements de cavall) es bona idea deixar-lo sobre la superfície on plantarem per a que vaja reduint-se i mesclant-se amb la terra.', 44),
(25, 1, 'Peparar semilleros estiu', 'Podem anar preparant ja tomaques, albergines, carabassetes... i altres cultius d''estiu.', 44),
(26, 1, 'asdf', 'asdfasdf asd', 44),
(27, 1, 'robe', 'asdfasdf asd', 44),
(28, 11, 'Collitaoliveres', 'Quan comencen a estar rogetes o negres', 44);

-- --------------------------------------------------------

--
-- Estructura de la taula `tasca_planta`
--

CREATE TABLE IF NOT EXISTS `tasca_planta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_planta` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL COMMENT '3 o 4 paraules q resumisquen la tasca',
  `dies` int(11) NOT NULL COMMENT 'Dies des de la sembra',
  `descripcio` varchar(4000) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`,`id_planta`,`user`),
  KEY `id_planta` (`id_planta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=417 ;

--
-- Bolcant dades de la taula `tasca_planta`
--

INSERT INTO `tasca_planta` (`id`, `id_planta`, `nom`, `dies`, `descripcio`, `user`) VALUES
(1, 169, 'Sembra', 0, 'sembra 1-3 llavors per alveolo. regar abans la terra fins que sobre, no tornar a regar fins que germinen.', 41),
(2, 169, 'repicat', 20, 'Quan tenen uns 10cm, deixem una única plàntula per alvèol per afavorir el creixement. Seguim regant per a mantindre humida la terra.', 41),
(3, 169, 'Transplantament i reg.', 50, 'trasplante al lloc definitiu. pot enterrar-se part de la tija ja que arrela molt fàcilment. regar després.', 41),
(4, 169, 'Sofre', 60, 'Per l''excés d''humitat després de regar, s''aplica sofre en pols per evitar l''aparició de fongs.', 41),
(5, 169, 'Desullat', 80, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 41),
(6, 169, 'Reg', 85, 'Si cal, tornem a regar a manta. D''ací en avant, en funció de la calor, humitat, etc. les tomaqueres es regaran cada 7-10 dies.', 41),
(7, 167, 'sembra', 0, 'sembrar en semilleros de tamany mig a raó de 2-3 llavors per forat. de febrer a agost.', 41),
(8, 167, 'transplant', 75, '\0', 41),
(9, 167, 'repicat', 35, 'eliminar les plantes més dèbils de cada forat, si ha crescut més d''una.', 41),
(10, 167, 'aporcat', 95, 'aporcar terra per cobrir 1/4 part del porro', 41),
(11, 167, 'aporcat', 110, 'aporcar terra per cobrir 1/4 part del porro', 41),
(12, 167, 'aporcat', 125, 'aporcar terra per cobrir 1/4 part del porro', 41),
(13, 167, 'aporcat', 140, 'aporcar terra per cobrir 1/4 part del porro', 41),
(14, 167, 'aporcat', 155, 'aporcar terra per cobrir 1/4 part del porro', 41),
(15, 167, 'aporcat', 170, 'aporcar terra per cobrir 1/4 part del porro', 41),
(16, 167, 'recolecció', 180, 'realitzar quan hi haja saó per no trencar els puerros', 41),
(17, 169, 'arrancar', 180, 'Per la quantitat de malalties que poden patir les tomaqueres durant el cultiu, es recomana cremar-les desprs darrencades, en compte dafegir-les al compost. Si no hi ha mostres de plagues ni malalties, podem afegir-la al compost.', 41),
(19, 166, 'Sembra', 1, 'Reguem bé el cavalló abans i després de posar la llavor, tenint compte de no destapar-la ni afonar-la amb l''aigua.', 41),
(20, 169, 'Desullar', 95, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 41),
(21, 169, 'Desullar', 110, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 41),
(22, 169, 'Desullar', 125, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 41),
(23, 169, 'Desullar', 140, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 41),
(24, 169, 'Desullar', 155, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 41),
(25, 169, 'Desullar', 170, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 41),
(31, 170, 'Plantació + reg', 1, 'A la distància del marc, sembrar dues estaques per mata, per a triar la millor quan arrelen. No enterrar molt profundament per a evitar la pudrició. Regar abundantment per a afavorir l''arrelament després de la sembra, evitant sempre que l''aigua arribe a la soca.', 41),
(32, 170, 'Replantació i repicat', 30, 'Si prosperen les dues mates, arranquem la més dèbil per a afavorir el creixement de la sana. També podem aprofitar i replantar on no hagen arrelat correctament.', 41),
(33, 170, 'Poda d''estiu', 270, 'Entre abril i juny, comença el període de descans de la carxofera. Es seguen a 5-10 cm de terra, amb tisores o falç, es deixen secar entre els cavallons, i es cremen quan s''han secat completament. Deixarem les mates sense regar fins a setembre-octubre, quan rebrotaràn després de les pluges de tardor o del reg que realitzem. Podem aprofitar el període estival per a netejar de males herbes.', 41),
(34, 170, 'Poda d''estiu', 635, 'Entre abril i juny, comença el període de descans de la carxofera. Es seguen a 5-10 cm de terra, amb tisores o falç, es deixen secar entre els cavallons, i es cremen quan s''han secat completament. Deixarem les mates sense regar fins a setembre-octubre, quan rebrotaràn després de les pluges de tardor o del reg que realitzem. Podem aprofitar el període estival per a netejar de males herbes.', 41),
(35, 170, 'Arrancar', 1000, 'Si volem reproduïr les carxoferes, al juny quan es seca, s''arrenquen les estaques per a trasplantar en agost-setembre a la nova ubicació. Deixar les estaques sense fulles i amb un poc d''arrel per a que agarren fàcilment. Pel consum de nutrients de la carxofera durant tres anys, es recomana plantar algun adob verd i/o deixar la terra en guaret abans de començar altre cultiu.', 41),
(36, 170, 'Reg de rebrot', 390, 'Quan arriba la tardor reguem per a afavorir el rebrot de la mata.', 41),
(37, 170, 'Reg de rebrot', 755, 'Quan arriba la tardor reguem per a afavorir el rebrot de la mata.', 41),
(38, 170, 'Crema', 450, 'Si no ho hem fet ja, cremar la poda de la carxofera en el regador entre cavallons. Amb la cendra aportem nutrients per al pròxim any.', 41),
(39, 170, 'Crema', 815, 'Si no ho hem fet ja, cremar la poda de la carxofera en el regador entre cavallons. Amb la cendra aportem nutrients per al pròxim any.', 41),
(40, 170, 'Poda', 90, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(41, 170, 'Poda', 120, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(42, 170, 'Poda', 150, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(43, 170, 'Poda', 180, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(44, 170, 'Poda', 210, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(45, 170, 'Poda', 240, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(46, 170, 'Poda', 480, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(47, 170, 'Poda', 510, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(48, 170, 'Poda', 540, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(49, 170, 'Poda', 570, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(50, 170, 'Poda', 600, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(51, 170, 'Poda', 845, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(52, 170, 'Poda', 875, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(53, 170, 'Poda', 905, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(54, 170, 'Poda', 935, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(55, 170, 'Poda', 965, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 41),
(56, 166, 'Repicat', 30, 'Eliminar les plàntules que estiguen massa prop, deixant entre 8 i 15 cm de distància entre plantes.', 41),
(57, 166, 'Repicat', 45, 'És recomanable repassar el cultiu i comprovar que no hi ha massa densitat de carlotes creixent juntes, ja que es quedarán raquítiques, a més d''augmenta la probabilitat d''agafar fongs.', 41),
(58, 166, 'Collita', 150, 'Es recomana realitzar la collita en saó per a evitar el trencament dels tubercles. Es recomana la collita escalonada ja que les carlotes fresques perden ràpidament la seua firmesa.', 41),
(59, 171, 'Sembra', 1, 'Realitzar en saó.', 41),
(60, 171, 'Aporcat', 60, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 41),
(61, 171, 'Aporcat', 90, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 41),
(62, 171, 'Aporcat', 120, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 41),
(63, 171, 'Sembra', 1, 'Realitzar en saó.', 41),
(64, 171, 'Aporcat', 150, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 41),
(65, 171, 'Arrancat de mates', 170, 'Uns dies abans de la recol·lecció, es poden arrancar les mates (amb una falç per exemple) per afavorir el engrossament dels tubercles ', 41),
(66, 171, 'Collita ', 180, 'Si es realitza manualment, cal anar amb compte de no danyar-les amb la ferramenta. ', 41),
(75, 166, 'Desbrossat', 20, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 41),
(76, 166, 'Desbrossat', 40, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 41),
(77, 166, 'Desbrossat', 60, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 41),
(78, 166, 'Desbrossat', 80, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 41),
(79, 166, 'Desbrossat', 100, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 41),
(80, 166, 'Desbrossat', 120, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 41),
(81, 166, 'Desbrossat', 140, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 41),
(82, 175, 'Sembra', 0, 'sembra 1-3 llavors per alveolo. regar abans la terra fins que sobre, no tornar a regar fins que germinen.', 42),
(83, 175, 'repicat', 20, 'Quan tenen uns 10cm, deixem una única plàntula per alvèol per afavorir el creixement. Seguim regant per a mantindre humida la terra.', 42),
(84, 175, 'Transplantament i reg.', 50, 'trasplante al lloc definitiu. pot enterrar-se part de la tija ja que arrela molt fàcilment. regar després.', 42),
(85, 175, 'Sofre', 60, 'Per l''excés d''humitat després de regar, s''aplica sofre en pols per evitar l''aparició de fongs.', 42),
(86, 175, 'Desullat', 80, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 42),
(87, 175, 'Reg', 85, 'Si cal, tornem a regar a manta. D''ací en avant, en funció de la calor, humitat, etc. les tomaqueres es regaran cada 7-10 dies.', 42),
(88, 173, 'sembra', 0, 'sembrar en semilleros de tamany mig a raó de 2-3 llavors per forat. de febrer a agost.', 42),
(89, 173, 'transplant', 75, '\0', 42),
(90, 173, 'repicat', 35, 'eliminar les plantes més dèbils de cada forat, si ha crescut més d''una.', 42),
(91, 173, 'aporcat', 95, 'aporcar terra per cobrir 1/4 part del porro', 42),
(92, 173, 'aporcat', 110, 'aporcar terra per cobrir 1/4 part del porro', 42),
(93, 173, 'aporcat', 125, 'aporcar terra per cobrir 1/4 part del porro', 42),
(94, 173, 'aporcat', 140, 'aporcar terra per cobrir 1/4 part del porro', 42),
(95, 173, 'aporcat', 155, 'aporcar terra per cobrir 1/4 part del porro', 42),
(96, 173, 'aporcat', 170, 'aporcar terra per cobrir 1/4 part del porro', 42),
(97, 173, 'recolecció', 180, 'realitzar quan hi haja saó per no trencar els puerros', 42),
(98, 175, 'arrancar', 180, 'Per la quantitat de malalties que poden patir les tomaqueres durant el cultiu, es recomana cremar-les desprs darrencades, en compte dafegir-les al compost. Si no hi ha mostres de plagues ni malalties, podem afegir-la al compost.', 42),
(99, 174, 'Sembra', 1, 'Posar 2 o 3 faves a 5cm de profunditat. No xafar massa la terra superior', 42),
(100, 172, 'Sembra', 1, 'Reguem bé el cavalló abans i després de posar la llavor, tenint compte de no destapar-la ni afonar-la amb l''aigua.', 42),
(101, 175, 'Desullar', 95, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 42),
(102, 175, 'Desullar', 110, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 42),
(103, 175, 'Desullar', 125, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 42),
(104, 175, 'Desullar', 140, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 42),
(105, 175, 'Desullar', 155, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 42),
(106, 175, 'Desullar', 170, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 42),
(107, 174, 'Regar', 15, 'Després de començar a brotar les faves, realitzem un reg a manta.', 42),
(108, 174, 'Podar', 45, 'Les rames més lletges, fines i malaltisses, poden podar-se per a propiciar el creixement de la part sana de la planta. Revisar pulgó', 42),
(109, 174, 'Purín d''ortiga', 40, 'Pot aplicar-se purín d''ortiga per a afavorir el creixement i la vigorositat de la planta. La cua de cavall també és efectiva, a més de antifúngica.', 42),
(110, 174, 'Arrancar', 180, 'Encara que pot variar, uns sis mesos després de la sembra la mata deixa de ser productiva. Si disposem de rotovator, podem deixar secar les mates sobre la terra i triturar-les després per incorporar-les a la terra.', 42),
(111, 174, 'Collita', 90, 'Encara que depén de la varietat, uns tres mesos després de la sembra comencen a apareixer les primeres faves madures.', 42),
(112, 176, 'Plantació + reg', 1, 'A la distància del marc, sembrar dues estaques per mata, per a triar la millor quan arrelen. No enterrar molt profundament per a evitar la pudrició. Regar abundantment per a afavorir l''arrelament després de la sembra, evitant sempre que l''aigua arribe a la soca.', 42),
(113, 176, 'Replantació i repicat', 30, 'Si prosperen les dues mates, arranquem la més dèbil per a afavorir el creixement de la sana. També podem aprofitar i replantar on no hagen arrelat correctament.', 42),
(114, 176, 'Poda d''estiu', 270, 'Entre abril i juny, comença el període de descans de la carxofera. Es seguen a 5-10 cm de terra, amb tisores o falç, es deixen secar entre els cavallons, i es cremen quan s''han secat completament. Deixarem les mates sense regar fins a setembre-octubre, quan rebrotaràn després de les pluges de tardor o del reg que realitzem. Podem aprofitar el període estival per a netejar de males herbes.', 42),
(115, 176, 'Poda d''estiu', 635, 'Entre abril i juny, comença el període de descans de la carxofera. Es seguen a 5-10 cm de terra, amb tisores o falç, es deixen secar entre els cavallons, i es cremen quan s''han secat completament. Deixarem les mates sense regar fins a setembre-octubre, quan rebrotaràn després de les pluges de tardor o del reg que realitzem. Podem aprofitar el període estival per a netejar de males herbes.', 42),
(116, 176, 'Arrancar', 1000, 'Si volem reproduïr les carxoferes, al juny quan es seca, s''arrenquen les estaques per a trasplantar en agost-setembre a la nova ubicació. Deixar les estaques sense fulles i amb un poc d''arrel per a que agarren fàcilment. Pel consum de nutrients de la carxofera durant tres anys, es recomana plantar algun adob verd i/o deixar la terra en guaret abans de començar altre cultiu.', 42),
(117, 176, 'Reg de rebrot', 390, 'Quan arriba la tardor reguem per a afavorir el rebrot de la mata.', 42),
(118, 176, 'Reg de rebrot', 755, 'Quan arriba la tardor reguem per a afavorir el rebrot de la mata.', 42),
(119, 176, 'Crema', 450, 'Si no ho hem fet ja, cremar la poda de la carxofera en el regador entre cavallons. Amb la cendra aportem nutrients per al pròxim any.', 42),
(120, 176, 'Crema', 815, 'Si no ho hem fet ja, cremar la poda de la carxofera en el regador entre cavallons. Amb la cendra aportem nutrients per al pròxim any.', 42),
(121, 176, 'Poda', 90, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(122, 176, 'Poda', 120, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(123, 176, 'Poda', 150, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(124, 176, 'Poda', 180, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(125, 176, 'Poda', 210, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(126, 176, 'Poda', 240, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(127, 176, 'Poda', 480, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(128, 176, 'Poda', 510, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(129, 176, 'Poda', 540, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(130, 176, 'Poda', 570, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(131, 176, 'Poda', 600, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(132, 176, 'Poda', 845, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(133, 176, 'Poda', 875, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(134, 176, 'Poda', 905, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(135, 176, 'Poda', 935, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(136, 176, 'Poda', 965, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 42),
(137, 172, 'Repicat', 30, 'Eliminar les plàntules que estiguen massa prop, deixant entre 8 i 15 cm de distància entre plantes.', 42),
(138, 172, 'Repicat', 45, 'És recomanable repassar el cultiu i comprovar que no hi ha massa densitat de carlotes creixent juntes, ja que es quedarán raquítiques, a més d''augmenta la probabilitat d''agafar fongs.', 42),
(139, 172, 'Collita', 150, 'Es recomana realitzar la collita en saó per a evitar el trencament dels tubercles. Es recomana la collita escalonada ja que les carlotes fresques perden ràpidament la seua firmesa.', 42),
(140, 177, 'Sembra', 1, 'Realitzar en saó.', 42),
(141, 177, 'Aporcat', 60, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 42),
(142, 177, 'Aporcat', 90, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 42),
(143, 177, 'Aporcat', 120, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 42),
(144, 177, 'Sembra', 1, 'Realitzar en saó.', 42),
(145, 177, 'Aporcat', 150, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 42),
(146, 177, 'Arrancat de mates', 170, 'Uns dies abans de la recol·lecció, es poden arrancar les mates (amb una falç per exemple) per afavorir el engrossament dels tubercles ', 42),
(147, 177, 'Collita ', 180, 'Si es realitza manualment, cal anar amb compte de no danyar-les amb la ferramenta. ', 42),
(148, 174, 'Desbrossat', 30, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 42),
(149, 174, 'Desbrossat', 50, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 42),
(150, 174, 'Desbrossat', 70, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 42),
(151, 174, 'Desbrossat', 90, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 42),
(152, 174, 'Desbrossat', 110, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 42),
(153, 174, 'Desbrossat', 130, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 42),
(154, 174, 'Desbrossat', 150, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 42),
(155, 174, 'Desbrossat', 170, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 42),
(156, 172, 'Desbrossat', 20, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 42),
(157, 172, 'Desbrossat', 40, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 42),
(158, 172, 'Desbrossat', 60, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 42),
(159, 172, 'Desbrossat', 80, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 42),
(160, 172, 'Desbrossat', 100, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 42),
(161, 172, 'Desbrossat', 120, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 42),
(162, 172, 'Desbrossat', 140, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 42),
(209, 181, 'Sembra', 0, 'sembra 1-3 llavors per alveolo. regar abans la terra fins que sobre, no tornar a regar fins que germinen.', 43),
(210, 181, 'repicat', 20, 'Quan tenen uns 10cm, deixem una única plàntula per alvèol per afavorir el creixement. Seguim regant per a mantindre humida la terra.', 43),
(211, 181, 'Transplantament i reg.', 50, 'trasplante al lloc definitiu. pot enterrar-se part de la tija ja que arrela molt fàcilment. regar després.', 43),
(212, 181, 'Sofre', 60, 'Per l''excés d''humitat després de regar, s''aplica sofre en pols per evitar l''aparició de fongs.', 43),
(213, 181, 'Desullat', 80, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 43),
(214, 181, 'Reg', 85, 'Si cal, tornem a regar a manta. D''ací en avant, en funció de la calor, humitat, etc. les tomaqueres es regaran cada 7-10 dies.', 43),
(215, 179, 'sembra', 0, 'sembrar en semilleros de tamany mig a raó de 2-3 llavors per forat. de febrer a agost.', 43),
(216, 179, 'transplant', 75, '\0', 43),
(217, 179, 'repicat', 35, 'eliminar les plantes més dèbils de cada forat, si ha crescut més d''una.', 43),
(218, 179, 'aporcat', 95, 'aporcar terra per cobrir 1/4 part del porro', 43),
(219, 179, 'aporcat', 110, 'aporcar terra per cobrir 1/4 part del porro', 43),
(220, 179, 'aporcat', 125, 'aporcar terra per cobrir 1/4 part del porro', 43),
(221, 179, 'aporcat', 140, 'aporcar terra per cobrir 1/4 part del porro', 43),
(222, 179, 'aporcat', 155, 'aporcar terra per cobrir 1/4 part del porro', 43),
(223, 179, 'aporcat', 170, 'aporcar terra per cobrir 1/4 part del porro', 43),
(224, 179, 'recolecció', 180, 'realitzar quan hi haja saó per no trencar els puerros', 43),
(225, 181, 'arrancar', 180, 'Per la quantitat de malalties que poden patir les tomaqueres durant el cultiu, es recomana cremar-les desprs darrencades, en compte dafegir-les al compost. Si no hi ha mostres de plagues ni malalties, podem afegir-la al compost.', 43),
(226, 180, 'Sembra', 1, 'Posar 2 o 3 faves a 5cm de profunditat. No xafar massa la terra superior', 43),
(227, 178, 'Sembra', 1, 'Reguem bé el cavalló abans i després de posar la llavor, tenint compte de no destapar-la ni afonar-la amb l''aigua.', 43),
(228, 181, 'Desullar', 95, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 43),
(229, 181, 'Desullar', 110, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 43),
(230, 181, 'Desullar', 125, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 43),
(231, 181, 'Desullar', 140, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 43),
(232, 181, 'Desullar', 155, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 43),
(233, 181, 'Desullar', 170, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 43),
(234, 180, 'Regar', 15, 'Després de començar a brotar les faves, realitzem un reg a manta.', 43),
(235, 180, 'Podar', 45, 'Les rames més lletges, fines i malaltisses, poden podar-se per a propiciar el creixement de la part sana de la planta. Revisar pulgó', 43),
(236, 180, 'Purín d''ortiga', 40, 'Pot aplicar-se purín d''ortiga per a afavorir el creixement i la vigorositat de la planta. La cua de cavall també és efectiva, a més de antifúngica.', 43),
(237, 180, 'Arrancar', 180, 'Encara que pot variar, uns sis mesos després de la sembra la mata deixa de ser productiva. Si disposem de rotovator, podem deixar secar les mates sobre la terra i triturar-les després per incorporar-les a la terra.', 43),
(238, 180, 'Collita', 90, 'Encara que depén de la varietat, uns tres mesos després de la sembra comencen a apareixer les primeres faves madures.', 43),
(239, 182, 'Plantació + reg', 1, 'A la distància del marc, sembrar dues estaques per mata, per a triar la millor quan arrelen. No enterrar molt profundament per a evitar la pudrició. Regar abundantment per a afavorir l''arrelament després de la sembra, evitant sempre que l''aigua arribe a la soca.', 43),
(240, 182, 'Replantació i repicat', 30, 'Si prosperen les dues mates, arranquem la més dèbil per a afavorir el creixement de la sana. També podem aprofitar i replantar on no hagen arrelat correctament.', 43),
(241, 182, 'Poda d''estiu', 270, 'Entre abril i juny, comença el període de descans de la carxofera. Es seguen a 5-10 cm de terra, amb tisores o falç, es deixen secar entre els cavallons, i es cremen quan s''han secat completament. Deixarem les mates sense regar fins a setembre-octubre, quan rebrotaràn després de les pluges de tardor o del reg que realitzem. Podem aprofitar el període estival per a netejar de males herbes.', 43),
(242, 182, 'Poda d''estiu', 635, 'Entre abril i juny, comença el període de descans de la carxofera. Es seguen a 5-10 cm de terra, amb tisores o falç, es deixen secar entre els cavallons, i es cremen quan s''han secat completament. Deixarem les mates sense regar fins a setembre-octubre, quan rebrotaràn després de les pluges de tardor o del reg que realitzem. Podem aprofitar el període estival per a netejar de males herbes.', 43),
(243, 182, 'Arrancar', 1000, 'Si volem reproduïr les carxoferes, al juny quan es seca, s''arrenquen les estaques per a trasplantar en agost-setembre a la nova ubicació. Deixar les estaques sense fulles i amb un poc d''arrel per a que agarren fàcilment. Pel consum de nutrients de la carxofera durant tres anys, es recomana plantar algun adob verd i/o deixar la terra en guaret abans de començar altre cultiu.', 43),
(244, 182, 'Reg de rebrot', 390, 'Quan arriba la tardor reguem per a afavorir el rebrot de la mata.', 43),
(245, 182, 'Reg de rebrot', 755, 'Quan arriba la tardor reguem per a afavorir el rebrot de la mata.', 43),
(246, 182, 'Crema', 450, 'Si no ho hem fet ja, cremar la poda de la carxofera en el regador entre cavallons. Amb la cendra aportem nutrients per al pròxim any.', 43),
(247, 182, 'Crema', 815, 'Si no ho hem fet ja, cremar la poda de la carxofera en el regador entre cavallons. Amb la cendra aportem nutrients per al pròxim any.', 43),
(248, 182, 'Poda', 90, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(249, 182, 'Poda', 120, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(250, 182, 'Poda', 150, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(251, 182, 'Poda', 180, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(252, 182, 'Poda', 210, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(253, 182, 'Poda', 240, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(254, 182, 'Poda', 480, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(255, 182, 'Poda', 510, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(256, 182, 'Poda', 540, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(257, 182, 'Poda', 570, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(258, 182, 'Poda', 600, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(259, 182, 'Poda', 845, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(260, 182, 'Poda', 875, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(261, 182, 'Poda', 905, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(262, 182, 'Poda', 935, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(263, 182, 'Poda', 965, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 43),
(264, 178, 'Repicat', 30, 'Eliminar les plàntules que estiguen massa prop, deixant entre 8 i 15 cm de distància entre plantes.', 43),
(265, 178, 'Repicat', 45, 'És recomanable repassar el cultiu i comprovar que no hi ha massa densitat de carlotes creixent juntes, ja que es quedarán raquítiques, a més d''augmenta la probabilitat d''agafar fongs.', 43),
(266, 178, 'Collita', 150, 'Es recomana realitzar la collita en saó per a evitar el trencament dels tubercles. Es recomana la collita escalonada ja que les carlotes fresques perden ràpidament la seua firmesa.', 43),
(267, 183, 'Sembra', 1, 'Realitzar en saó.', 43),
(268, 183, 'Aporcat', 60, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 43),
(269, 183, 'Aporcat', 90, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 43),
(270, 183, 'Aporcat', 120, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 43),
(271, 183, 'Sembra', 1, 'Realitzar en saó.', 43),
(272, 183, 'Aporcat', 150, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 43),
(273, 183, 'Arrancat de mates', 170, 'Uns dies abans de la recol·lecció, es poden arrancar les mates (amb una falç per exemple) per afavorir el engrossament dels tubercles ', 43),
(274, 183, 'Collita ', 180, 'Si es realitza manualment, cal anar amb compte de no danyar-les amb la ferramenta. ', 43),
(275, 180, 'Desbrossat', 30, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 43),
(276, 180, 'Desbrossat', 50, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 43),
(277, 180, 'Desbrossat', 70, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 43),
(278, 180, 'Desbrossat', 90, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 43),
(279, 180, 'Desbrossat', 110, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 43),
(280, 180, 'Desbrossat', 130, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 43),
(281, 180, 'Desbrossat', 150, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 43),
(282, 180, 'Desbrossat', 170, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 43),
(283, 178, 'Desbrossat', 20, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 43),
(284, 178, 'Desbrossat', 40, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 43),
(285, 178, 'Desbrossat', 60, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 43),
(286, 178, 'Desbrossat', 80, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 43),
(287, 178, 'Desbrossat', 100, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 43),
(288, 178, 'Desbrossat', 120, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 43),
(289, 178, 'Desbrossat', 140, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 43),
(336, 187, 'Sembra', 0, 'sembra 1-3 llavors per alveolo. regar abans la terra fins que sobre, no tornar a regar fins que germinen.', 44),
(337, 187, 'repicat', 20, 'Quan tenen uns 10cm, deixem una única plàntula per alvèol per afavorir el creixement. Seguim regant per a mantindre humida la terra.', 44),
(338, 187, 'Transplantament i reg.', 50, 'trasplante al lloc definitiu. pot enterrar-se part de la tija ja que arrela molt fàcilment. regar després.', 44),
(339, 187, 'Sofre', 60, 'Per l''excés d''humitat després de regar, s''aplica sofre en pols per evitar l''aparició de fongs.', 44),
(340, 187, 'Desullat', 80, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 44),
(341, 187, 'Reg', 85, 'Si cal, tornem a regar a manta. D''ací en avant, en funció de la calor, humitat, etc. les tomaqueres es regaran cada 7-10 dies.', 44),
(342, 185, 'sembra', 0, 'sembrar en semilleros de tamany mig a raó de 2-3 llavors per forat. de febrer a agost.', 44),
(343, 185, 'transplant', 75, '\0', 44),
(344, 185, 'repicat', 35, 'eliminar les plantes més dèbils de cada forat, si ha crescut més d''una.', 44),
(345, 185, 'aporcat', 95, 'aporcar terra per cobrir 1/4 part del porro', 44),
(346, 185, 'aporcat', 110, 'aporcar terra per cobrir 1/4 part del porro', 44),
(347, 185, 'aporcat', 125, 'aporcar terra per cobrir 1/4 part del porro', 44),
(348, 185, 'aporcat', 140, 'aporcar terra per cobrir 1/4 part del porro', 44),
(349, 185, 'aporcat', 155, 'aporcar terra per cobrir 1/4 part del porro', 44),
(350, 185, 'aporcat', 170, 'aporcar terra per cobrir 1/4 part del porro', 44);
INSERT INTO `tasca_planta` (`id`, `id_planta`, `nom`, `dies`, `descripcio`, `user`) VALUES
(351, 185, 'recolecció', 180, 'realitzar quan hi haja saó per no trencar els puerros', 44),
(352, 187, 'arrancar', 180, 'Per la quantitat de malalties que poden patir les tomaqueres durant el cultiu, es recomana cremar-les desprs darrencades, en compte dafegir-les al compost. Si no hi ha mostres de plagues ni malalties, podem afegir-la al compost.', 44),
(353, 186, 'Sembra', 1, 'Posar 2 o 3 faves a 5cm de profunditat. No xafar massa la terra superior', 44),
(354, 184, 'Sembra', 1, 'Reguem bé el cavalló abans i després de posar la llavor, tenint compte de no destapar-la ni afonar-la amb l''aigua.', 44),
(355, 187, 'Desullar', 95, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 44),
(356, 187, 'Desullar', 110, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 44),
(357, 187, 'Desullar', 125, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 44),
(358, 187, 'Desullar', 140, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 44),
(359, 187, 'Desullar', 155, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 44),
(360, 187, 'Desullar', 170, 'Eliminar els brots de les axiles, deixant només un per planta. Comprovar rebrots a la part inferior del tronc.', 44),
(361, 186, 'Regar', 15, 'Després de començar a brotar les faves, realitzem un reg a manta.', 44),
(362, 186, 'Podar', 45, 'Les rames més lletges, fines i malaltisses, poden podar-se per a propiciar el creixement de la part sana de la planta. Revisar pulgó', 44),
(363, 186, 'Purín d''ortiga', 40, 'Pot aplicar-se purín d''ortiga per a afavorir el creixement i la vigorositat de la planta. La cua de cavall també és efectiva, a més de antifúngica.', 44),
(364, 186, 'Arrancar', 180, 'Encara que pot variar, uns sis mesos després de la sembra la mata deixa de ser productiva. Si disposem de rotovator, podem deixar secar les mates sobre la terra i triturar-les després per incorporar-les a la terra.', 44),
(365, 186, 'Collita', 90, 'Encara que depén de la varietat, uns tres mesos després de la sembra comencen a apareixer les primeres faves madures.', 44),
(366, 188, 'Plantació + reg', 1, 'A la distància del marc, sembrar dues estaques per mata, per a triar la millor quan arrelen. No enterrar molt profundament per a evitar la pudrició. Regar abundantment per a afavorir l''arrelament després de la sembra, evitant sempre que l''aigua arribe a la soca.', 44),
(367, 188, 'Replantació i repicat', 30, 'Si prosperen les dues mates, arranquem la més dèbil per a afavorir el creixement de la sana. També podem aprofitar i replantar on no hagen arrelat correctament.', 44),
(368, 188, 'Poda d''estiu', 270, 'Entre abril i juny, comença el període de descans de la carxofera. Es seguen a 5-10 cm de terra, amb tisores o falç, es deixen secar entre els cavallons, i es cremen quan s''han secat completament. Deixarem les mates sense regar fins a setembre-octubre, quan rebrotaràn després de les pluges de tardor o del reg que realitzem. Podem aprofitar el període estival per a netejar de males herbes.', 44),
(369, 188, 'Poda d''estiu', 635, 'Entre abril i juny, comença el període de descans de la carxofera. Es seguen a 5-10 cm de terra, amb tisores o falç, es deixen secar entre els cavallons, i es cremen quan s''han secat completament. Deixarem les mates sense regar fins a setembre-octubre, quan rebrotaràn després de les pluges de tardor o del reg que realitzem. Podem aprofitar el període estival per a netejar de males herbes.', 44),
(370, 188, 'Arrancar', 1000, 'Si volem reproduïr les carxoferes, al juny quan es seca, s''arrenquen les estaques per a trasplantar en agost-setembre a la nova ubicació. Deixar les estaques sense fulles i amb un poc d''arrel per a que agarren fàcilment. Pel consum de nutrients de la carxofera durant tres anys, es recomana plantar algun adob verd i/o deixar la terra en guaret abans de començar altre cultiu.', 44),
(371, 188, 'Reg de rebrot', 390, 'Quan arriba la tardor reguem per a afavorir el rebrot de la mata.', 44),
(372, 188, 'Reg de rebrot', 755, 'Quan arriba la tardor reguem per a afavorir el rebrot de la mata.', 44),
(373, 188, 'Crema', 450, 'Si no ho hem fet ja, cremar la poda de la carxofera en el regador entre cavallons. Amb la cendra aportem nutrients per al pròxim any.', 44),
(374, 188, 'Crema', 815, 'Si no ho hem fet ja, cremar la poda de la carxofera en el regador entre cavallons. Amb la cendra aportem nutrients per al pròxim any.', 44),
(375, 188, 'Poda', 90, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(376, 188, 'Poda', 120, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(377, 188, 'Poda', 150, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(378, 188, 'Poda', 180, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(379, 188, 'Poda', 210, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(380, 188, 'Poda', 240, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(381, 188, 'Poda', 480, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(382, 188, 'Poda', 510, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(383, 188, 'Poda', 540, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(384, 188, 'Poda', 570, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(385, 188, 'Poda', 600, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(386, 188, 'Poda', 845, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(387, 188, 'Poda', 875, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(388, 188, 'Poda', 905, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(389, 188, 'Poda', 935, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(390, 188, 'Poda', 965, 'Per a disminuir el risc de fongs i altres plagues o malalties, es recomana podar amb un ganivet les fulles baixes de la carxofera, especialment les que presenten alguna malaltia. Generalment, es poden podar les fulles ''girades'', és a dir, amb la part verda apuntant cap a la terra i la part blanquinosa apuntant al cel.', 44),
(391, 184, 'Repicat', 30, 'Eliminar les plàntules que estiguen massa prop, deixant entre 8 i 15 cm de distància entre plantes.', 44),
(392, 184, 'Repicat', 45, 'És recomanable repassar el cultiu i comprovar que no hi ha massa densitat de carlotes creixent juntes, ja que es quedarán raquítiques, a més d''augmenta la probabilitat d''agafar fongs.', 44),
(393, 184, 'Collita', 150, 'Es recomana realitzar la collita en saó per a evitar el trencament dels tubercles. Es recomana la collita escalonada ja que les carlotes fresques perden ràpidament la seua firmesa.', 44),
(394, 189, 'Sembra', 1, 'Realitzar en saó.', 44),
(395, 189, 'Aporcat', 60, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 44),
(396, 189, 'Aporcat', 90, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 44),
(397, 189, 'Aporcat', 120, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 44),
(398, 189, 'Sembra', 1, 'Realitzar en saó.', 44),
(399, 189, 'Aporcat', 150, 'Afegim terra al cavalló per cobrir les creïlles que puguen estar exposades al sol. ', 44),
(400, 189, 'Arrancat de mates', 170, 'Uns dies abans de la recol·lecció, es poden arrancar les mates (amb una falç per exemple) per afavorir el engrossament dels tubercles ', 44),
(401, 189, 'Collita ', 180, 'Si es realitza manualment, cal anar amb compte de no danyar-les amb la ferramenta. ', 44),
(402, 186, 'Desbrossat', 30, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 44),
(403, 186, 'Desbrossat', 50, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 44),
(404, 186, 'Desbrossat', 70, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 44),
(405, 186, 'Desbrossat', 90, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 44),
(406, 186, 'Desbrossat', 110, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 44),
(407, 186, 'Desbrossat', 130, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 44),
(408, 186, 'Desbrossat', 150, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 44),
(409, 186, 'Desbrossat', 170, 'Rascant amb una aixada ampla de mànec llarg, o amb rastrell o les mans si no disposem d''altra ferramenta, arrenquem les adventícies que han pogut aparèixer. Podem deixar-les estesses sobre els cavallons, no sobre els canals de reg, ja que acabarien taponant-los.', 44),
(410, 184, 'Desbrossat', 20, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 44),
(411, 184, 'Desbrossat', 40, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 44),
(412, 184, 'Desbrossat', 60, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 44),
(413, 184, 'Desbrossat', 80, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 44),
(414, 184, 'Desbrossat', 100, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 44),
(415, 184, 'Desbrossat', 120, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 44),
(416, 184, 'Desbrossat', 140, 'Les carlotes necessiten un terreny especialment net donat el seu sistema d''arrels. Procurarem evitar competència d''adventícies especialment en les primeres fases.', 44);

-- --------------------------------------------------------

--
-- Estructura de la taula `tasca_remei`
--

CREATE TABLE IF NOT EXISTS `tasca_remei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_remei` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `dies` int(11) NOT NULL,
  `descripcio` varchar(4000) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`id`,`user`),
  KEY `id_remei` (`id_remei`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Bolcant dades de la taula `tasca_remei`
--

INSERT INTO `tasca_remei` (`id`, `id_remei`, `nom`, `dies`, `descripcio`, `user`) VALUES
(1, 71, 'Pulveritzar potàsic 1/3', 1, 'Primera aplicació de potàsic. Mullar bé tota la planta, ja que actua per contacte', 41),
(2, 71, 'Pulveritzar potàsic 2/3', 6, 'Segona aplicació de potàsic. Comprovar si disminueix la quantitat de pulgo.', 41),
(3, 71, 'Pulveritzar potàsic 3/3', 11, 'Tercera i última aplicació. Comprovar el nivell de població de pulgó. Continuar amb aplicacions preventives cada 15 dies després d''aquesta última aplicació', 41),
(4, 73, 'Sofre en pols 1/3', 1, 'Més preventiu que correctiu. Si plou, cal tornar a aplicar.', 41),
(5, 73, 'Sofre en pols 2/3', 6, 'Comprovar avanç de la patologia. Pot ser un bon moment per a podar les fulles més "lletges" de la planta.', 41),
(6, 73, 'Sofre en pols 3/3', 11, 'Si no conseguim detindre la infecció amb aquesta tercera aplicació, cal buscar altres mitjans per contolar-la.', 41),
(7, 76, 'Pulveritzar potàsic 1/3', 1, 'Primera aplicació de potàsic. Mullar bé tota la planta, ja que actua per contacte', 42),
(8, 76, 'Pulveritzar potàsic 2/3', 6, 'Segona aplicació de potàsic. Comprovar si disminueix la quantitat de pulgo.', 42),
(9, 76, 'Pulveritzar potàsic 3/3', 11, 'Tercera i última aplicació. Comprovar el nivell de població de pulgó. Continuar amb aplicacions preventives cada 15 dies després d''aquesta última aplicació', 42),
(10, 78, 'Sofre en pols 1/3', 1, 'Més preventiu que correctiu. Si plou, cal tornar a aplicar.', 42),
(11, 78, 'Sofre en pols 2/3', 6, 'Comprovar avanç de la patologia. Pot ser un bon moment per a podar les fulles més "lletges" de la planta.', 42),
(12, 78, 'Sofre en pols 3/3', 11, 'Si no conseguim detindre la infecció amb aquesta tercera aplicació, cal buscar altres mitjans per contolar-la.', 42),
(14, 81, 'Pulveritzar potàsic 1/3', 1, 'Primera aplicació de potàsic. Mullar bé tota la planta, ja que actua per contacte', 43),
(15, 81, 'Pulveritzar potàsic 2/3', 6, 'Segona aplicació de potàsic. Comprovar si disminueix la quantitat de pulgo.', 43),
(16, 81, 'Pulveritzar potàsic 3/3', 11, 'Tercera i última aplicació. Comprovar el nivell de població de pulgó. Continuar amb aplicacions preventives cada 15 dies després d''aquesta última aplicació', 43),
(17, 83, 'Sofre en pols 1/3', 1, 'Més preventiu que correctiu. Si plou, cal tornar a aplicar.', 43),
(18, 83, 'Sofre en pols 2/3', 6, 'Comprovar avanç de la patologia. Pot ser un bon moment per a podar les fulles més "lletges" de la planta.', 43),
(19, 83, 'Sofre en pols 3/3', 11, 'Si no conseguim detindre la infecció amb aquesta tercera aplicació, cal buscar altres mitjans per contolar-la.', 43),
(21, 86, 'Pulveritzar potàsic 1/3', 1, 'Primera aplicació de potàsic. Mullar bé tota la planta, ja que actua per contacte', 44),
(22, 86, 'Pulveritzar potàsic 2/3', 6, 'Segona aplicació de potàsic. Comprovar si disminueix la quantitat de pulgo.', 44),
(23, 86, 'Pulveritzar potàsic 3/3', 11, 'Tercera i última aplicació. Comprovar el nivell de població de pulgó. Continuar amb aplicacions preventives cada 15 dies després d''aquesta última aplicació', 44),
(24, 88, 'Sofre en pols 1/3', 1, 'Més preventiu que correctiu. Si plou, cal tornar a aplicar.', 44),
(25, 88, 'Sofre en pols 2/3', 6, 'Comprovar avanç de la patologia. Pot ser un bon moment per a podar les fulles més "lletges" de la planta.', 44),
(26, 88, 'Sofre en pols 3/3', 11, 'Si no conseguim detindre la infecció amb aquesta tercera aplicació, cal buscar altres mitjans per contolar-la.', 44);

-- --------------------------------------------------------

--
-- Estructura de la taula `tractada`
--

CREATE TABLE IF NOT EXISTS `tractada` (
  `id_plaga` int(11) NOT NULL,
  `id_remei` int(11) NOT NULL,
  `detalls` varchar(4000) DEFAULT NULL,
  `user` int(11) NOT NULL COMMENT 'users owner id',
  PRIMARY KEY (`user`,`id_plaga`,`id_remei`),
  KEY `id_plaga` (`id_plaga`),
  KEY `id_remei` (`id_remei`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Descriu quines plagues són tractades per quins remeis.';

--
-- Bolcant dades de la taula `tractada`
--

INSERT INTO `tractada` (`id_plaga`, `id_remei`, `detalls`, `user`) VALUES
(157, 71, 'Cal tindre molt de compte en els atacs als brots.', 41),
(157, 75, 'Eficàcia no comprovada.', 41),
(162, 71, 'Cal banyar completament la planta per a assegurar-se un tractament efectiu', 41),
(163, 76, 'Cal tindre molt de compte en els atacs als brots.', 42),
(163, 80, 'Eficàcia no comprovada.', 42),
(168, 76, 'Cal banyar completament la planta per a assegurar-se un tractament efectiu', 42),
(169, 81, 'Cal tindre molt de compte en els atacs als brots.', 43),
(169, 85, 'Eficàcia no comprovada.', 43),
(174, 81, 'Cal banyar completament la planta per a assegurar-se un tractament efectiu', 43),
(175, 86, 'Cal tindre molt de compte en els atacs als brots.', 44),
(175, 90, 'Eficàcia no comprovada.', 44),
(180, 86, 'Cal banyar completament la planta per a assegurar-se un tractament efectiu', 44);

--
-- Restriccions per taules bolcades
--

--
-- Restriccions per la taula `afectada`
--
ALTER TABLE `afectada`
  ADD CONSTRAINT `afectada_ibfk_3` FOREIGN KEY (`id_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `afectada_ibfk_4` FOREIGN KEY (`id_plaga`) REFERENCES `plaga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `cultiu`
--
ALTER TABLE `cultiu`
  ADD CONSTRAINT `cultiu_ibfk_4` FOREIGN KEY (`planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cultiu_ibfk_5` FOREIGN KEY (`parcela`) REFERENCES `parcela` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_6` FOREIGN KEY (`parcela`) REFERENCES `parcela` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_7` FOREIGN KEY (`parcela`) REFERENCES `parcela` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `img_bancal`
--
ALTER TABLE `img_bancal`
  ADD CONSTRAINT `img_bancal_ibfk_1` FOREIGN KEY (`id_bancal`) REFERENCES `bancal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `img_plaga`
--
ALTER TABLE `img_plaga`
  ADD CONSTRAINT `img_plaga_ibfk_1` FOREIGN KEY (`id_plaga`) REFERENCES `plaga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `img_planta`
--
ALTER TABLE `img_planta`
  ADD CONSTRAINT `img_planta_ibfk_1` FOREIGN KEY (`id_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `parcela`
--
ALTER TABLE `parcela`
  ADD CONSTRAINT `parcela_ibfk_1` FOREIGN KEY (`bancal`) REFERENCES `bancal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `planta`
--
ALTER TABLE `planta`
  ADD CONSTRAINT `planta_ibfk_1` FOREIGN KEY (`grup`) REFERENCES `grup` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `planta_ibfk_2` FOREIGN KEY (`familia`) REFERENCES `familia` (`id`) ON UPDATE CASCADE;

--
-- Restriccions per la taula `tasca_fixa`
--
ALTER TABLE `tasca_fixa`
  ADD CONSTRAINT `tasca_fixa_ibfk_1` FOREIGN KEY (`mes`) REFERENCES `mes` (`id`);

--
-- Restriccions per la taula `tasca_planta`
--
ALTER TABLE `tasca_planta`
  ADD CONSTRAINT `tasca_planta_ibfk_1` FOREIGN KEY (`id_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `tasca_remei`
--
ALTER TABLE `tasca_remei`
  ADD CONSTRAINT `tasca_remei_ibfk_2` FOREIGN KEY (`id_remei`) REFERENCES `remei` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per la taula `tractada`
--
ALTER TABLE `tractada`
  ADD CONSTRAINT `tractada_ibfk_3` FOREIGN KEY (`id_plaga`) REFERENCES `plaga` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tractada_ibfk_4` FOREIGN KEY (`id_remei`) REFERENCES `remei` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
