-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: daliserver
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `air`
--

DROP TABLE IF EXISTS `air`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `air` (
  `id` varchar(255) DEFAULT NULL,
  `aqi` varchar(255) DEFAULT NULL,
  `pm25` varchar(255) DEFAULT NULL,
  `pm10` varchar(255) DEFAULT NULL,
  `so2` varchar(255) DEFAULT NULL,
  `no2` varchar(255) DEFAULT NULL,
  `co` varchar(255) DEFAULT NULL,
  `o3` varchar(255) DEFAULT NULL,
  `primaryPollutant` varchar(255) DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `updateTime` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `air`
--

LOCK TABLES `air` WRITE;
/*!40000 ALTER TABLE `air` DISABLE KEYS */;
INSERT INTO `air` VALUES ('WS08H58U92R8','24','10','24','3','5','0.52','63','','优','2021-05-13 14:00:00');
/*!40000 ALTER TABLE `air` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation`
--

DROP TABLE IF EXISTS `automation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automation` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `projectId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `automationState` varchar(255) DEFAULT NULL,
  `effectiveDay` varchar(255) DEFAULT NULL,
  `effectiveTime` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation`
--

LOCK TABLES `automation` WRITE;
/*!40000 ALTER TABLE `automation` DISABLE KEYS */;
INSERT INTO `automation` VALUES (6,'1615540147000','1615540220000','6','1','','','正常','ALL','0000,0100','True');
/*!40000 ALTER TABLE `automation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automationaction`
--

DROP TABLE IF EXISTS `automationaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automationaction` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `automationActionType` varchar(255) DEFAULT NULL,
  `targetSceneId` varchar(255) DEFAULT NULL,
  `targetNaturalCycleId` varchar(255) DEFAULT NULL,
  `supportedActionId` varchar(255) DEFAULT NULL,
  `supportedServiceId` varchar(255) DEFAULT NULL,
  `actionExecuteType` varchar(255) DEFAULT NULL,
  `actionTimeDelay` varchar(255) DEFAULT NULL,
  `actionOrder` varchar(255) DEFAULT NULL,
  `actionParameter1` varchar(255) DEFAULT NULL,
  `actionParameter2` varchar(255) DEFAULT NULL,
  `actionParameter3` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `deviceGroupList` varchar(255) DEFAULT NULL,
  `deviceList` varchar(255) DEFAULT NULL,
  `automationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automationaction`
--

LOCK TABLES `automationaction` WRITE;
/*!40000 ALTER TABLE `automationaction` DISABLE KEYS */;
INSERT INTO `automationaction` VALUES (15,'0、客厅灯1、2 照明/激活照明场景 5','DEVICE',NULL,NULL,'9','1','REALTIME',NULL,'0','5','','','True','','579,581,580','6');
/*!40000 ALTER TABLE `automationaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automationcondition`
--

DROP TABLE IF EXISTS `automationcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automationcondition` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `conditionType` varchar(255) DEFAULT NULL,
  `conditionEventId` varchar(255) DEFAULT NULL,
  `conditionValue` varchar(255) DEFAULT NULL,
  `conditionTime` varchar(255) DEFAULT NULL,
  `conditionEndpointType` varchar(255) DEFAULT NULL,
  `conditionEndpointId` varchar(255) DEFAULT NULL,
  `automationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automationcondition`
--

LOCK TABLES `automationcondition` WRITE;
/*!40000 ALTER TABLE `automationcondition` DISABLE KEYS */;
INSERT INTO `automationcondition` VALUES (16,'0 设备状态改变 发生任何变化','STATEEVENT','2872','all','DEVICE','580','6',NULL);
/*!40000 ALTER TABLE `automationcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automationtrigger`
--

DROP TABLE IF EXISTS `automationtrigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automationtrigger` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `triggerType` varchar(255) DEFAULT NULL,
  `triggerEventId` varchar(255) DEFAULT NULL,
  `triggerValue` varchar(255) DEFAULT NULL,
  `triggerTime` varchar(255) DEFAULT NULL,
  `triggerEndpointType` varchar(255) DEFAULT NULL,
  `triggerEndpointId` varchar(255) DEFAULT NULL,
  `automationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automationtrigger`
--

LOCK TABLES `automationtrigger` WRITE;
/*!40000 ALTER TABLE `automationtrigger` DISABLE KEYS */;
INSERT INTO `automationtrigger` VALUES (26,'0 设备状态改变 发生任何变化','STATEEVENT','2872','all','true##0','DEVICE','2872','6');
/*!40000 ALTER TABLE `automationtrigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characteristic`
--

DROP TABLE IF EXISTS `characteristic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characteristic` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `characteristicName` varchar(255) DEFAULT NULL,
  `characteristicType` varchar(255) DEFAULT NULL,
  `characteristicUnit` varchar(255) DEFAULT NULL,
  `characteristicControlDisplay` varchar(255) DEFAULT NULL,
  `characteristicDescription` varchar(255) DEFAULT NULL,
  `characteristicParameter1` varchar(255) DEFAULT NULL,
  `characteristicParameter2` varchar(255) DEFAULT NULL,
  `characteristicParameter3` varchar(255) DEFAULT NULL,
  `characteristicLibraryId` varchar(255) DEFAULT NULL,
  `characteristicValue` varchar(255) DEFAULT NULL,
  `characteristicState` varchar(255) DEFAULT NULL,
  `serviceId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristic`
--

LOCK TABLES `characteristic` WRITE;
/*!40000 ALTER TABLE `characteristic` DISABLE KEYS */;
INSERT INTO `characteristic` VALUES (2835,'1615794593000','1615794593000','LUMINOUSFLUX','FLOAT','lm','DISPLAY','光通量','','','','95','','正常','656'),(2836,'1615794593000','1619420400000','POWER','BOOLEAN','','ALL','电源','开灯','关灯','','5','false','正常','656'),(2837,'1615794593000','1619420400000','BRIGHTNESS','INTEGER','级','ALL','亮度','254','0','','6','0','正常','656'),(2838,'1615794593000','1619420399000','COLORTEMPERATURE','INTEGER','K','ALL','色温','6000','2700','','7','2700','正常','656'),(2839,'1615794593000','1615794593000','ILLUMINATION','FLOAT','Lux','DISPLAY','照度','','','','91','','正常','656'),(2840,'1615794593000','1615794593000','LIGHTINGSCENE','ENUM','','CONTROL','照明场景','0##1##2##3##4##5##6##7##8##9##10##11##12##13##14##15','INTEGER','','8','','正常','656'),(2841,'1615862377000','1619420399000','COLORTEMPERATURE','INTEGER','K','ALL','色温','6000','2700','','7','2700','正常','657'),(2842,'1615862377000','1615862377000','ILLUMINATION','FLOAT','Lux','DISPLAY','照度','','','','91','','正常','657'),(2843,'1615862377000','1615862377000','LIGHTINGSCENE','ENUM','','CONTROL','照明场景','0##1##2##3##4##5##6##7##8##9##10##11##12##13##14##15','INTEGER','','8','','正常','657'),(2844,'1615862377000','1619420400000','POWER','BOOLEAN','','ALL','电源','开灯','关灯','','5','false','正常','657'),(2845,'1615862377000','1619420400000','BRIGHTNESS','INTEGER','级','ALL','亮度','254','0','','6','0','正常','657'),(2846,'1615862377000','1615862377000','LUMINOUSFLUX','FLOAT','lm','DISPLAY','光通量','','','','95','','正常','657'),(2865,'1616054038000','1616054038000','LIGHTINGSCENE','ENUM','','CONTROL','照明场景','0##1##2##3##4##5##6##7##8##9##10##11##12##13##14##15','INTEGER','','8','','正常','661'),(2866,'1616054038000','1619425289000','COLORTEMPERATURE','INTEGER','K','ALL','色温','6000','2700','','7','2700','正常','661'),(2867,'1616054038000','1616054038000','ILLUMINATION','FLOAT','Lux','DISPLAY','照度','','','','91','','正常','661'),(2868,'1616054038000','1619425289000','BRIGHTNESS','INTEGER','级','ALL','亮度','254','0','','6','150','正常','661'),(2869,'1616054038000','1616054038000','LUMINOUSFLUX','FLOAT','lm','DISPLAY','光通量','','','','95','','正常','661'),(2870,'1616054038000','1619408973000','POWER','BOOLEAN','','ALL','电源','开灯','关灯','','5','true','正常','661'),(2871,'1616054106000','1616054106000','LIGHTINGSCENE','ENUM','','CONTROL','照明场景','0##1##2##3##4##5##6##7##8##9##10##11##12##13##14##15','INTEGER','','8','','正常','662'),(2872,'1616054106000','1619408973000','POWER','BOOLEAN','','ALL','电源','开灯','关灯','','5','true','正常','662'),(2873,'1616054106000','1616054106000','LUMINOUSFLUX','FLOAT','lm','DISPLAY','光通量','','','','95','','正常','662'),(2874,'1616054106000','1619425289000','BRIGHTNESS','INTEGER','级','ALL','亮度','254','0','','6','150','正常','662'),(2875,'1616054106000','1619425289000','COLORTEMPERATURE','INTEGER','K','ALL','色温','6000','2700','','7','2700','正常','662'),(2876,'1616054106000','1616054106000','ILLUMINATION','FLOAT','Lux','DISPLAY','照度','','','','91','','正常','662'),(2893,'1616119366000','1616119366000','LUMINOUSFLUX','FLOAT','lm','DISPLAY','光通量','','','','95','','正常','666'),(2894,'1616119366000','1619425211000','POWER','BOOLEAN','','ALL','电源','开灯','关灯','','5','false','正常','666'),(2895,'1616119366000','1616119366000','LIGHTINGSCENE','ENUM','','CONTROL','照明场景','0##1##2##3##4##5##6##7##8##9##10##11##12##13##14##15','INTEGER','','8','','正常','666'),(2896,'1616119366000','1619425211000','COLORTEMPERATURE','INTEGER','K','ALL','色温','6000','2700','','7','2700','正常','666'),(2897,'1616119366000','1619425211000','BRIGHTNESS','INTEGER','级','ALL','亮度','254','0','','6','0','正常','666'),(2898,'1616119366000','1616119366000','ILLUMINATION','FLOAT','Lux','DISPLAY','照度','','','','91','','正常','666'),(3016,'1617345456000','1617345456000','LINETEMPERATURE','FLOAT','°C','DISPLAY','线路温度','','','','37','','正常','683'),(3017,'1617345456000','1617345456000','LINEPOWER','FLOAT','W','DISPLAY','线路功率','','','','42','','正常','683'),(3018,'1617345456000','1617345456000','POWER','BOOLEAN','','ALL','电源','打开电源','关闭电源','','34','','正常','683'),(3019,'1617345456000','1617345456000','LINECURRENT','FLOAT','A','DISPLAY','线路电流','','','','41','','正常','683'),(3020,'1617345456000','1617345456000','LINEENERGY','FLOAT ','kW·h','DISPLAY','线路电量','','','','39','','正常','683'),(3021,'1617345456000','1617345456000','LINEVOLTAGE','FLOAT','V','DISPLAY','线路电压','','','','40','','正常','683'),(3215,'1618536738000','1619420400000','POWER','BOOLEAN','','ALL','电源','开灯','关灯','','5','false','正常','715'),(3216,'1618536738000','1618536738000','LIGHTINGSCENE','ENUM','','CONTROL','照明场景','0##1##2##3##4##5##6##7##8##9##10##11##12##13##14##15','INTEGER','','8','','正常','715'),(3217,'1618536738000','1618536738000','LUMINOUSFLUX','FLOAT','lm','DISPLAY','光通量','','','','95','','正常','715'),(3218,'1618536738000','1618536738000','ILLUMINATION','FLOAT','Lux','DISPLAY','照度','','','','91','','正常','715'),(3219,'1618536738000','1619420400000','BRIGHTNESS','INTEGER','级','ALL','亮度','254','0','','6','0','正常','715'),(3220,'1618536738000','1619420399000','COLORTEMPERATURE','INTEGER','K','ALL','色温','6000','2700','','7','2700','正常','715'),(3221,'1618537436000','1619512965000','MOTORDRIVERPOSITION','INTEGER','','ALL','窗帘位置','254','0','','61','0','正常','716'),(3222,'1618537436000','1618537436000','CONTROLACTION','ENUM','','CONTROL','控制动作','关窗帘##开窗帘##停止','INTEGER','','60','','正常','716'),(3228,'1618971650000','1619425289000','HUMANBODYSTATE','STRING','','DISPLAY','人体状态','','','','164','Motion','正常','721'),(3263,'1619491491000','1619491491000','HUMANBODYSTATE','STRING','','DISPLAY','人体状态','','','','166','','正常','728'),(3264,'1619491491000','1619491491000','ILLUMINATION','FLOAT','Lux','DISPLAY','照度','','','','167','','正常','728'),(3287,'1620269427000','1620891268000','SETTINGTEMPERATURE','FLOAT','°C','ALL','设定温度','30.0','19.0','','48','1','正常','733'),(3288,'1620269427000','1620892003002','WINDSPEED','ENUM','','ALL','风速','高速##中高速##中速##中低速##低速','INTEGER','','50','2','正常','733'),(3289,'1620269427000','1620891028000','POWER','BOOLEAN','','ALL','电源','开空调','关空调','','46','true','正常','733'),(3290,'1620269427000','1620892024682','WORKMODE','ENUM','','ALL','工作模式','制冷##制热##通风##除湿','INTEGER','','49','0','正常','733'),(3291,'1620269427000','1620269427000','TEMPERATURE','FLOAT','°C','DISPLAY','室温','','','','47','','正常','733');
/*!40000 ALTER TABLE `characteristic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataprotocol`
--

DROP TABLE IF EXISTS `dataprotocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataprotocol` (
  `id` bigint(20) NOT NULL,
  `dataprotocolNamespace` varchar(255) DEFAULT NULL,
  `dataprotocolName` varchar(255) DEFAULT NULL,
  `actionName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataprotocol`
--

LOCK TABLES `dataprotocol` WRITE;
/*!40000 ALTER TABLE `dataprotocol` DISABLE KEYS */;
INSERT INTO `dataprotocol` VALUES (1,'PowerController','TurnOn','TURNONLIGHT'),(2,'PowerController','TurnOff','TURNOFFLIGHT'),(3,'BrightnessController','SetBrightness','BRIGHTNESSSET'),(4,'BrightnessController','AdjustBrightness','BRIGHTNESSUP'),(5,'BrightnessController','AdjustBrightness','BRIGHTNESSDOWN'),(6,'ColorTemperatureController','SetColorTemperature','COLORTEMPERATURESET'),(7,'ColorTemperatureController','AdjustColorTemperature','COLORTEMPERATUREUP'),(8,'ColorTemperatureController','AdjustColorTemperature','COLORTEMPERATUREDOWN'),(9,'LightingSceneController','ActivateLightingScene','ACTIVATELIGHTINGSCENE'),(10,'BrightnessController','AdjustBrightness','BRIGHTNESSUPABIT'),(11,'BrightnessController','AdjustBrightness','BRIGHTNESSDOWNABIT'),(12,'BrightnessController','SetBrightness','BRIGHTNESSMAX'),(13,'BrightnessController','SetBrightness','BRIGHTNESSMIN'),(14,'ColorTemperatureController','AdjustColorTemperature','COLORTEMPERATUREUPABIT'),(15,'ColorTemperatureController','AdjustColorTemperature','COLORTEMPERATUREDOWNABIT'),(16,'ColorTemperatureController','SetColorTemperature','COLORTEMPERATUREMAX'),(17,'ColorTemperatureController','SetColorTemperature','COLORTEMPERATUREMIN'),(18,'PowerController','ControlAction','TURNONFAN'),(19,'PowerController','ControlAction','TURNOFFFAN'),(20,'WindSpeedController','SetWindSpeed','SETWINDSPEED'),(21,'ControlActionController','ControlAction','TURNONCURTAIN'),(22,'ControlActionController','ControlAction','TURNOFFCURTAIN'),(23,'MotorDriverPositionController','SetMotorDriverPosition','SETCURTAINPOSITION'),(24,'ControlActionController','ControlAction','CURTAINPOSITIVEROTATE'),(25,'ControlActionController','ControlAction','CURTAINREVERSEROTATE'),(26,'MotorDriverPositionController','AdjustMotorDriverPosition','CURTAINPOSITIONOPENABIT'),(27,'MotorDriverPositionController','AdjustMotorDriverPosition','CURTAINPOSITIONCLOSEABIT'),(28,'ControlActionController','ControlAction','CURTAINSTOPACTION'),(29,'PowerController','TurnOn','TURNONOUTLET'),(30,'PowerController','TurnOff','TURNOFFOUTLET'),(31,'SwitchController','Click','CLICK'),(32,'SwitchController','DoubleClick','DOUBLECLICK'),(33,'SwitchController','LongPress','LONGPRESS'),(34,'LockStateController','Lock','LOCK'),(35,'LockStateController','Unlock','UNLOCK'),(36,'MotorDriverAngleController','SetMotorDriverAngle','SETCURTAINANGLE'),(37,'MotorDriverAngleController','AdjustMotorDriverAngle','CURTAINPOSITIVEROTATEABIT'),(38,'MotorDriverAngleController','AdjustMotorDriverAngle','CURTAINREVERSEROTATEABIT'),(39,'PowerController','TurnOn','TURNONAIRCONDITION'),(40,'PowerController','TurnOff','TURNOFFAIRCONDITION'),(41,'TemperatureController','SetTemperature','SETTEMPERATURE'),(42,'TemperatureController','AdjustTemperature','TEMPERATUREUP'),(43,'TemperatureController','AdjustTemperature','TEMPERATUREDOWN'),(44,'WindSpeedController','SetWindSpeed','SETWINDSPEED'),(45,'WorkModeController','SetWorkMode','SETWORKMODE'),(46,'ColdWaterValveController','TurnOn','TURNONCOLDWATERVALVE'),(47,'ColdWaterValveController','TurnOff','TURNOFFCOLDWATERVALVE'),(48,'HotWaterValveController','TurnOn','TURNONHOTWATERVALVE'),(49,'HotWaterValveController','TurnOff','TURNOFFHOTWATERVALVE'),(50,'WorkModeController','SetWorkMode','SETWORKMODE'),(51,'HumidificationController','TurnOn','TURNONHUMIDIFICATION'),(52,'HumidificationController','TurnOff','TURNOFFHUMIDIFICATION'),(53,'WindSpeedController','SetWindSpeed','SETWINDSPEED'),(54,'PowerController','TurnOn','TURNONBREAKER'),(55,'PowerController','TurnOff','TURNOFFBREAKER'),(56,'LeakTestController','LeakTest','LEAKTEST'),(57,'PlaybackStateController','Play','PLAY'),(58,'PlaybackStateController','Pause','PAUSE'),(59,'PlayModeController','SetPlayMode','SETPLAYMODE'),(60,'TrackController','SkipToPreviouStrack','SKIPTOPREVIOUSTRACK'),(61,'TrackController','SkipToNextTrack','SKIPTONEXTTRACK'),(62,'VolumeController','SetVolume','SETVOLUME'),(63,'VolumeController','AdjustVolume','VOLUMEUP'),(64,'VolumeController','AdjustVolume','VOLUMEDOWN'),(65,'MuteController','Mute','MUTE'),(66,'MuteController','Unmute','UNMUTE'),(67,'PlaylistController','Playlist','PLAYLIST'),(68,'PtzController','Up','PTZUP'),(69,'PtzController','Down','PTZDOWN'),(70,'PtzController','Left','PTZLEFT'),(71,'PtzController','Right','PTZRIGHT'),(72,'PtzController','VerticalStop','PTZVERTICALSTOP'),(73,'CaptureController','Capture','CAPTURE'),(74,'LensMaskingController','TurnOn','TURNONLENSMASKING'),(75,'LensMaskingController','TurnOff','TURNOFFLENSMASKING'),(76,'DefenceController','TurnOn','TURNONDEFENCE'),(77,'DefenceController','TurnOff','TURNOFFDEFENCE'),(78,'MirrorController','FlipVertical','FLIPVERTICAL'),(79,'MirrorController','FlipHorizontal','FLIPHORIZONTAL'),(80,'MirrorController','CenterPeel','CENTERPEEL'),(81,'PtzController','HorizontalStop','PTZHORIZONTALSTOP'),(82,'AudioSourceController','SetAudioSource','SETAUDIOSOURCE'),(83,'SwitchController','Shake','SHAKE'),(84,'RelayPowerController','TurnOn','TURNONRELAYPOWER'),(85,'RelayPowerController','TurnOff','TURNOFFRELAYPOWER'),(86,'SwingController','TurnOn','TURNONSWING'),(87,'SwingController','TurnOff','TURNOFFSWING');
/*!40000 ALTER TABLE `dataprotocol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `deviceProductName` varchar(255) DEFAULT NULL,
  `deviceDescription` varchar(255) DEFAULT NULL,
  `deviceProductModel` varchar(255) DEFAULT NULL,
  `deviceProductSpecification` varchar(255) DEFAULT NULL,
  `deviceVersion` varchar(255) DEFAULT NULL,
  `deviceLifeTime` varchar(255) DEFAULT NULL,
  `deviceFirmwareVersion` varchar(255) DEFAULT NULL,
  `hubId` varchar(255) DEFAULT NULL,
  `gatewayId` varchar(255) DEFAULT NULL,
  `spaceId` varchar(255) DEFAULT NULL,
  `deviceLibraryId` varchar(255) DEFAULT NULL,
  `parentType` varchar(255) DEFAULT NULL,
  `deviceName` varchar(255) DEFAULT NULL,
  `homeOrder` varchar(255) DEFAULT NULL,
  `spaceOrder` varchar(255) DEFAULT NULL,
  `deviceIconId` varchar(255) DEFAULT NULL,
  `deviceLocation` varchar(255) DEFAULT NULL,
  `deviceMacAddress` varchar(255) DEFAULT NULL,
  `deviceIp` varchar(255) DEFAULT NULL,
  `deviceAddress` varchar(255) DEFAULT NULL,
  `deviceSerialNumber` varchar(255) DEFAULT NULL,
  `deviceManufactureDate` varchar(255) DEFAULT NULL,
  `deviceInstallationDate` varchar(255) DEFAULT NULL,
  `homeStar` varchar(255) DEFAULT NULL,
  `spaceStar` varchar(255) DEFAULT NULL,
  `spaceAllocated` varchar(255) DEFAULT NULL,
  `hasPhoto` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `deviceState` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (646,'1615794593000','1619060993000','Licotek','LIGHT','可调光调色LED灯（DALI-MULIT）','可调光调色LED灯Multi版','A1000','43243243','1','',NULL,'7','53','63','2','GATEWAY','1','9','2',NULL,'1','','','1','','0','0','False','False',NULL,'False','True','Normal'),(647,'1615862377000','1619060993000','Licotek','LIGHT','可调光调色LED灯（DALI-MULIT）','可调光调色LED灯Multi版','A1000','43243243','1','',NULL,'7','53','63','2','GATEWAY','2','10','3',NULL,'2','','','2','','1600223977000','1615862377000','False','False',NULL,'False','True','Normal'),(651,'1616054038000','1619060993000','Licotek','LIGHT','可调光调色LED灯（DALI-MULIT）','可调光调色LED灯Multi版','A1000','43243243','1','',NULL,'7','10','63','2','GATEWAY','tcp0','2','10',NULL,'1','','','0','','1600415638000','1616054038000','False','False',NULL,'False','True','Normal'),(652,'1616054106000','1619060993000','Licotek','LIGHT','可调光调色LED灯（DALI-MULIT）','可调光调色LED灯Multi版','A1000','43243243','1','',NULL,'7','10','63','2','GATEWAY','tcp1','8','1',NULL,'1','','','1','','1600415706000','1616054106000','False','False',NULL,'False','True','Normal'),(656,'1616119366000','1619060993000','Licotek','LIGHT','可调光调色LED灯（DALI-MULIT）','可调光调色LED灯Multi版','A1000','43243243','1','',NULL,'7','10','63','2','GATEWAY','tcp2','5','9',NULL,'1','','','2','','1600480966000','1616119366000','False','False',NULL,'False','True','Normal'),(673,'1617345456000','1619060993000','佳岚智能','BREAKER','智能断路器1P','智能断路器1P','JL1-IBLE-40','','1','',NULL,'7','64',NULL,'12','GATEWAY','1','1',NULL,NULL,'1','','','1','','1601620656000','1617345456000','False','False',NULL,'False','True','Normal'),(705,'1618536738000','1619060993000','Licotek','LIGHT','可调光调色LED灯（DALI-MULIT）','可调光调色LED灯Multi版','A1000','43243243','1','',NULL,'7','53','63','2','GATEWAY','0','6','6',NULL,'','','','0','','1602811938000','1618536738000','False','False',NULL,'False','True','Normal'),(706,'1618537436000','1619060993000','Licotek','CURTAIN','上下式电动窗帘','上下式电动窗帘','C4404','123456782','1','',NULL,'7','53','63','17','GATEWAY','窗帘','7','7',NULL,'1','','','3','','1602812636000','1618537436000','False','False',NULL,'False','True','Normal'),(711,'1618971650000','1619424946000','Licotek','SENSOR','人体移动传感器（DALI）','人体移动传感器-DALI','DHBS00001','54354654654','1','',NULL,'7','10','63','37','GATEWAY','传感器','3',NULL,NULL,'1','','','1','','1603246850000','1618971650000','False','False','True','False','True','Normal'),(718,'1619491491000','1619678582000','迈睿','SENSOR','人体存在传感器（485）','人体存在传感器-RS485','HBS485000','57687879899','1','',NULL,'7','22',NULL,'39','GATEWAY','485传感器',NULL,NULL,NULL,'1','','','1','','1603766691000','1619491491000','False','False','False','False','True','Normal'),(723,'1620269427000','1620892024625','中弘','AIRCONDITION','多联机中央空调','多联式中央空调系统。。','AC10000','654665765','1','',NULL,'7','81','63','14','GATEWAY','空调',NULL,'10',NULL,'1','','','1-0','','1604631027000','1620269427000','False','False',NULL,'False','True','Normal');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicegroup`
--

DROP TABLE IF EXISTS `devicegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devicegroup` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `gatewayId` varchar(255) DEFAULT NULL,
  `spaceId` varchar(255) DEFAULT NULL,
  `deviceGroupName` varchar(255) DEFAULT NULL,
  `deviceGroupNumber` varchar(255) DEFAULT NULL,
  `homeOrder` varchar(255) DEFAULT NULL,
  `spaceOrder` varchar(255) DEFAULT NULL,
  `deviceGroupState` varchar(255) DEFAULT NULL,
  `homeStar` varchar(255) DEFAULT NULL,
  `spaceStar` varchar(255) DEFAULT NULL,
  `hasPhoto` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `devices` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicegroup`
--

LOCK TABLES `devicegroup` WRITE;
/*!40000 ALTER TABLE `devicegroup` DISABLE KEYS */;
INSERT INTO `devicegroup` VALUES (79,'1618798227000','1618798227000','53','63','USB组0','0','11','9','正常','False','False','False','True','705,646,647'),(80,'1619061010000','1619061010000','10','63','组0','0','13','11','正常','False','False','False','True','651,656,652');
/*!40000 ALTER TABLE `devicegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicelibrary`
--

DROP TABLE IF EXISTS `devicelibrary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devicelibrary` (
  `id` bigint(20) NOT NULL,
  `gmtCcreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `categoryLibraryId` varchar(255) DEFAULT NULL,
  `deviceProductName` varchar(255) DEFAULT NULL,
  `deviceProductModel` varchar(255) DEFAULT NULL,
  `deviceProductSpecification` varchar(255) DEFAULT NULL,
  `deviceVersion` varchar(255) DEFAULT NULL,
  `deviceLifetime` varchar(255) DEFAULT NULL,
  `deviceDescription` varchar(255) DEFAULT NULL,
  `deviceIcon` varchar(255) DEFAULT NULL,
  `deviceState` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicelibrary`
--

LOCK TABLES `devicelibrary` WRITE;
/*!40000 ALTER TABLE `devicelibrary` DISABLE KEYS */;
INSERT INTO `devicelibrary` VALUES (1,'2018-04-12 23:07:19','2018-05-07 19:20:31','3','可调光调色LED灯Color版','A1008','12345213','1','10','可调光调色LED灯Color版','https://www.easyicon.net/api/resizeApi.php?id=1188446&size=128','正常','True'),(2,'2018-04-12 23:07:19','2018-05-07 19:20:31','3','可调光调色LED灯Multi版','A1000','43243243','1','10','可调光调色LED灯Multi版','https://www.easyicon.net/api/resizeApi.php?id=1188446&size=128','正常','True'),(3,'2018-04-12 23:07:19','2018-05-07 19:20:31','3','可调光LED灯','A1101','43243243','1','5','可调光LED灯','https://www.easyicon.net/api/resizeApi.php?id=1188446&size=128','正常','True'),(4,'2018-04-12 23:07:19','2018-05-07 19:20:31','3','开关型LED灯','A1244','12345432','1','10','开关型LED灯','https://www.easyicon.net/api/resizeApi.php?id=1135532&size=72','正常','True'),(5,'2018-06-10 21:10:55','2018-06-10 21:10:58','4','电动窗帘','C4402','12345678','1','8','电动窗帘','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(6,'2018-08-24 20:39:59','2018-08-24 20:40:01','6','米家多功能网关（升级版）','DGNWG02LM',NULL,'1','1','米家多功能网关（升级版）','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(7,'2018-08-24 20:42:04','2018-08-24 20:42:06','7','米家智能插座(ZigBee版)',NULL,NULL,'1','1','米家智能插座(ZigBee版)','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(8,'2018-08-24 20:43:11','2018-08-24 20:43:13','8','米家无线开关',NULL,NULL,'1','1','米家无线开关','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(9,'2018-08-24 20:44:06','2018-08-24 20:44:08','9','米家人体传感器',NULL,NULL,'1','1','米家人体传感器','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(10,'2018-08-24 20:45:13','2018-08-24 20:45:16','9','米家门窗传感器',NULL,NULL,'1','1','米家门窗传感器','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(11,'2018-08-24 20:45:53','2018-08-24 20:45:55','9','米家温湿度传感器',NULL,NULL,'1','1','米家温湿度传感器','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(12,'2019-11-06 17:33:16','2019-11-06 17:33:18','11','智能漏电保护断路器1P+N','JL1-IBLE-40',NULL,'1','5','智能断路器1P+N带漏电保护','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(13,'2019-11-06 22:13:46','2019-11-06 22:13:48','13','新风系统','BE4.0',NULL,'1','3','智能新风系统。。。','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(14,'2019-11-06 22:57:19','2019-11-06 22:57:21','14','多联式中央空调','MS300',NULL,'1','6','多联式中央空调系统。。','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(15,'2019-11-06 23:00:31','2019-11-06 23:00:34','15','风机盘管中央空调','T8600-TB10-9YF0-M0',NULL,'1','6','风机盘管中央空调系统。。','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(16,'2018-06-10 21:10:55','2018-06-10 21:10:58','4','左右式电动窗帘','C4403','123456781','1','8','左右式电动窗帘','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(17,'2018-06-10 21:10:55','2018-06-10 21:10:58','4','上下式电动窗帘','C4404','123456782','1','8','上下式电动窗帘','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(18,'2018-06-10 21:10:55','2018-06-10 21:10:58','4','百叶窗式电动窗帘','C4405','123456783','1','8','百叶窗式电动窗帘','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(19,'2019-11-14 14:59:25','2019-11-14 14:59:28','3','开发板LED灯','D1000','12341233','1','1','2.4G网关开发板LED灯','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(20,'2019-11-06 23:00:31','2019-11-06 23:00:34','16','风机盘管中央空调','HLA2028D8',NULL,'1','6','风机盘管中央空调系统。。','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(21,'2020-01-09 11:59:05','2020-01-09 11:59:08','17','互联网音箱','1019FW','043035323000','1','3','SONOS互联网音箱','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(22,'2020-01-12 18:11:51','2020-01-12 18:11:53','18','互联网云台摄像机C6C','CS-C6C-3B1WFR',NULL,'1','1','互联网云台摄像机C6C','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(23,'2020-01-12 18:11:51','2020-01-12 18:11:53','18','互联网摄像机C3C','CS-C3C-3H2WFRL',NULL,'1','1','互联网摄像机C3C','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(24,'2018-04-12 23:07:19','2018-05-07 19:20:31','3','切相调光器','A1102','543545465465','1','5','切相调光器','https://www.easyicon.net/api/resizeApi.php?id=1188446&size=128','正常','True'),(25,'2020-05-14 10:59:59','2020-05-14 11:00:02','20','高保真音箱','BOX1001','432432432214321','1','3','澳斯迪高保真音箱','https://www.easyicon.net/api/resizeApi.php?id=1188446&size=128','正常','True'),(26,'2020-05-30 17:58:01','2020-05-30 17:58:03','21','智能猫眼DP1','DP1','432432455324','1','3','智能猫眼DP1','https://www.easyicon.net/api/resizeApi.php?id=1188446&size=128','正常','True'),(27,'2020-07-01 10:14:40','2020-07-01 10:14:43','22','空气质量检测仪','aqs001','3435465756678','1','3','智能空气质量检测仪','https://www.easyicon.net/api/resizeApi.php?id=1188446&size=128','正常','True'),(28,'2018-04-12 23:07:19','2018-05-07 19:20:31','23','可调光调色LED灯','YZ10000','5435465765768','1','3','优住可调光调色LED灯','https://www.easyicon.net/api/resizeApi.php?id=1188446&size=128','正常','True'),(29,'2018-06-10 21:10:55','2018-06-10 21:10:58','4','左半边单开式电动窗帘','C4403','123456781','1','3','左半边单开式电动窗帘','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(30,'2018-06-10 21:10:55','2018-06-10 21:10:58','4','右半边单开式电动窗帘','C4403','123456781','1','3','右半边单开式电动窗帘','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(31,'2018-08-24 20:45:53','2018-08-24 20:45:55','9','水浸传感器','SJCGQ11LM',NULL,'1','3','水浸传感器','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(32,'2018-08-24 20:45:53','2018-08-24 20:45:55','22','称重传感器','LNJINSFTC11','3213243424','1','2','称重传感器','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(33,'2018-08-24 20:45:53','2018-08-24 20:45:55','22','六路雷达报警器','NJBGG34244','543465465465','1','3','六路雷达报警器','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(34,'2019-11-06 17:33:16','2019-11-06 17:33:18','11','智能断路器1P（无控制）','JL1-IBLE-41',NULL,'1','3','智能断路器1P（无控制）','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(35,'2018-04-12 23:07:19','2018-05-07 19:20:31','25','排气扇','F12344','43435454','1','3','排气扇','https://www.easyicon.net/api/resizeApi.php?id=1135532&size=72\'','正常','True'),(36,'2018-04-12 23:07:19','2018-05-07 19:20:31','25','继电器设备','RD9889','43243545','1','3','继电器设备','https://www.easyicon.net/api/resizeApi.php?id=1135532&size=72','正常','True'),(37,'2021-03-22 18:00:34','2021-03-22 18:00:36','22','人体移动传感器（DALI）','DHBS00001','54354654654','1','3','人体移动传感器-DALI','https://www.easyicon.net/api/resizeApi.php?id=1135532&size=72','正常','True'),(38,'2021-03-22 18:00:34','2021-03-22 18:00:36','26','人体存在传感器（DALI）','HBSDALI000','43254654654','1','3','人体存在传感器-DALI','https://www.easyicon.net/api/resizeApi.php?id=1135532&size=72','正常','True'),(39,'2021-03-22 18:00:34','2021-03-22 18:00:36','26','人体存在传感器（485）','HBS485000','57687879899','1','3','人体存在传感器-RS485','https://www.easyicon.net/api/resizeApi.php?id=1135532&size=72','正常','True'),(40,'2020-01-12 18:11:51','2020-01-12 18:11:53','29','网络摄像机（枪机）','DS-2CD2T46FWDA3-XS','23432443244','1','3','网络摄像机','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(41,'2021-04-30 16:00:33','2021-04-30 16:00:35','31','新风系统（CON系列）','CON-PTC2','79878990665','1','3','博朗通CON系列新风系统','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(42,'2021-04-30 16:36:34','2021-04-30 16:36:36','32','电动移门','DOOR-LY-01','43654658609','1','3','继电器控制电动移门','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True'),(43,'2021-04-30 20:19:35','2021-04-30 20:19:38','33','雾化壁炉','FIREPLACE-01','43265473265','1','3','485雾化壁炉','https://www.easyicon.net/api/resizeApi.php?id=1156891&size=128','正常','True');
/*!40000 ALTER TABLE `devicelibrary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateway`
--

DROP TABLE IF EXISTS `gateway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gateway` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `gatewayProductName` varchar(255) DEFAULT NULL,
  `gatewayProductModel` varchar(255) DEFAULT NULL,
  `gatewayProductSpecification` varchar(255) DEFAULT NULL,
  `gatewayVersion` varchar(255) DEFAULT NULL,
  `gatewayDescription` varchar(255) DEFAULT NULL,
  `hubId` varchar(255) DEFAULT NULL,
  `gatewayLibraryId` varchar(255) DEFAULT NULL,
  `parentType` varchar(255) DEFAULT NULL,
  `gatewayName` varchar(255) DEFAULT NULL,
  `gatewayLocation` varchar(255) DEFAULT NULL,
  `gatewayMacAddress` varchar(255) DEFAULT NULL,
  `gatewayIp` varchar(255) DEFAULT NULL,
  `gatewayPort` varchar(255) DEFAULT NULL,
  `gatewayKey` varchar(255) DEFAULT NULL,
  `gatewaySerialNumber` varchar(255) DEFAULT NULL,
  `gatewayFirmwareVersion` varchar(255) DEFAULT NULL,
  `gatewayManufactureDate` varchar(255) DEFAULT NULL,
  `gatewayInstallationDate` varchar(255) DEFAULT NULL,
  `gatewayHeartbeatInterval` varchar(255) DEFAULT NULL,
  `gatewayHealthcheckInterval` varchar(255) DEFAULT NULL,
  `deviceHealthcheckInterval` varchar(255) DEFAULT NULL,
  `deviceStatequeryInterval` varchar(255) DEFAULT NULL,
  `deviceStatereportInterval` varchar(255) DEFAULT NULL,
  `hasDeviceScene` varchar(255) DEFAULT NULL,
  `hasDeviceGroup` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `gatewayState` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateway`
--

LOCK TABLES `gateway` WRITE;
/*!40000 ALTER TABLE `gateway` DISABLE KEYS */;
INSERT INTO `gateway` VALUES (10,'1564451504000','1619402607000','Licotek','GATEWAY','Licotek-Dali-TCP照明网关','G10066','321321312','1','Dali-TCP照明网关。。。','7','1','HUB','DALI网关','办公室','','192.168.0.102','','','','4.0','0','0','60','60','0','120','0','True','True','True','Error'),(22,'1574130577000','1618212439000','康耐德','GATEWAY','RS485-TCP网关','C2000-B1-SHE0101-AA1','432424342','1','RS485转TCP/IP网关。。','7','4','HUB','485','1','','192.168.0.171','','','','','0','0','60','60','0','0','0','False','False','True','Error'),(44,'1589938579000','1589945293000','澳斯迪','GATEWAY','音箱网关','AM8318','329173283','1','澳斯迪音箱网关','7','6','HUB','音箱','1','','192.168.0.252','','6','2','','1574213779000','1574213779000','120','120','0','0','0','False','False','True','Error'),(53,'1597902724000','1618536491000','Licotek','GATEWAY','Licotek-Dali-USB照明网关','G20066','321434324','1','Dali-USB照明网关。。。','7','7','HUB','USB主机','办公室','','5CF1814A3130','','','','4.0.5','1582177924000','1582177924000','0','0','0','0','0','True','True','True','Normal'),(55,'1598512256000','1604560611000','Aqara','GATEWAY','ZigBee网关','KTBL11LM','acpartner.v3','1','Aqara-空调伴侣升级版ZigBee网关','7','2','HUB','aqara','办公室','','192.168.0.254','','1827f3e75a185694','04cf8c8f4515','v3','1582787456000','1582787456000','120','120','120','240','240','False','False','True','Normal'),(57,'1600847325000','1602472917000','Licotek','GATEWAY','RS485-USB网关','R10001','321324325','1','RS485转USB网关。。','7','8','HUB','usb-485','1','','COM3','9600','','','','1584949725000','1584949725000','120','120','120','240','240','False','False','True','Normal'),(64,'1610414674000','1610415065000','佳岚智能','GATEWAY','断路器智能网关','JL1-GW200','4546765766','1','断路器智能网关。。','7','3','HUB','1111','1111','','1111','1111','','client002','','1594517074000','1594517074000','120','120','120','240','240','False','False','True','Error'),(65,'1611900911000','1611900911000','Licotek','GATEWAY','Licotek-Dali-串口照明网关','G20080','344324324','1','Dali-串口照明网关。。。','7','9','HUB','chuankou','1','','/dev/ttyS6','115200','','','','1596003311000','1596003311000','120','120','120','240','240','True','True','True','Normal'),(81,'1620269379000','1620717991000','中弘','GATEWAY','多联机空调网关','B01X2RT','432435456','1','多联机中央空调智能控制网关','7','10','HUB','空调','1','','192.168.0.251','9999','','1','','1604630979000','1604630979000','120','120','120','240','240','False','False','True','Normal');
/*!40000 ALTER TABLE `gateway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gatewaylibrary`
--

DROP TABLE IF EXISTS `gatewaylibrary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gatewaylibrary` (
  `id` int(11) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `categoryLibraryId` varchar(255) DEFAULT NULL,
  `gatewayProductName` varchar(255) DEFAULT NULL,
  `gatewayProductModel` varchar(255) DEFAULT NULL,
  `gatewayProductSpecification` varchar(255) DEFAULT NULL,
  `gatewayVersion` varchar(255) DEFAULT NULL,
  `gatewayDescription` varchar(255) DEFAULT NULL,
  `gatewayIcon` varchar(255) DEFAULT NULL,
  `gatewayState` varchar(255) DEFAULT NULL,
  `hasDeviceScene` varchar(255) DEFAULT NULL,
  `hasDeviceGroup` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gatewaylibrary`
--

LOCK TABLES `gatewaylibrary` WRITE;
/*!40000 ALTER TABLE `gatewaylibrary` DISABLE KEYS */;
INSERT INTO `gatewaylibrary` VALUES (1,'2018-04-12 23:37:54','2018-04-12 23:37:57','2','Licotek-Dali-TCP照明网关','G10066','321321312','1','Dali-TCP照明网关。。。',NULL,'正常','True','True','True'),(2,'2018-08-24 20:34:47','2018-08-24 20:34:49','6','ZigBee网关','KTBL11LM','acpartner.v3','1','Aqara-空调伴侣升级版ZigBee网关',NULL,'正常','False','False','True'),(3,'2019-11-06 17:17:37','2019-11-06 17:17:40','10','断路器智能网关','JL1-GW200','4546765766','1','断路器智能网关。。',NULL,'正常','False','False','True'),(4,'2019-11-06 22:07:15','2019-11-06 22:07:18','12','RS485-TCP网关','C2000-B1-SHE0101-AA1','432424342','1','RS485转TCP/IP网关。。',NULL,'正常','False','False','True'),(5,'2019-11-14 14:52:33','2019-11-14 14:52:36','2','2.4G网关-DEV','D10000','123123456','1','2.4G网关开发板',NULL,'正常','False','False','True'),(6,'2020-05-14 10:54:16','2020-05-14 10:54:18','19','音箱网关','AM8318','329173283','1','澳斯迪音箱网关',NULL,'正常','False','False','True'),(7,'2018-04-12 23:37:54','2018-04-12 23:37:57','2','Licotek-Dali-USB照明网关','G20066','321434324','1','Dali-USB照明网关。。。',NULL,'正常','True','True','True'),(8,'2019-11-06 22:07:15','2019-11-06 22:07:18','2','RS485-USB网关','R10001','321324325','1','RS485转USB网关。。',NULL,'正常','False','False','True'),(9,'2018-04-12 23:37:54','2018-04-12 23:37:57','2','Licotek-Dali-串口照明网关','G20080','344324324','1','Dali-串口照明网关。。。',NULL,'正常','True','True','True'),(10,'2021-03-22 19:44:56','2021-03-22 19:44:58','27','多联机空调网关','B01X2RT','432435456','1','多联机中央空调智能控制网关',NULL,'正常','False','False','True'),(11,'2021-03-22 19:51:14','2021-03-22 19:51:16','28','硬盘录像机网关','iDS-7608NX','325436565','1','硬盘录像机&摄像头网关',NULL,'正常','False','False','True'),(12,'2021-04-20 18:03:26','2021-04-20 18:03:29','2','八路红外扩展TCP网关','KBW0108H','643534854','1','信科八路红外扩展器TCP通讯',NULL,'正常','False','False','True');
/*!40000 ALTER TABLE `gatewaylibrary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography`
--

DROP TABLE IF EXISTS `geography`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geography` (
  `id` varchar(255) DEFAULT NULL,
  `geoDate` varchar(255) DEFAULT NULL,
  `sunrise` varchar(255) DEFAULT NULL,
  `sunset` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography`
--

LOCK TABLES `geography` WRITE;
/*!40000 ALTER TABLE `geography` DISABLE KEYS */;
INSERT INTO `geography` VALUES ('WS08H58U92R8','2021-05-13 00:00:00','05:49','18:59'),('WS08H58U92R8','2021-05-14 00:00:00','05:48','18:59'),('WS08H58U92R8','2021-05-15 00:00:00','05:48','19:00'),('WS08H58U92R8','2021-05-16 00:00:00','05:47','19:00'),('WS08H58U92R8','2021-05-17 00:00:00','05:47','19:01'),('WS08H58U92R8','2021-05-18 00:00:00','05:47','19:01'),('WS08H58U92R8','2021-05-19 00:00:00','05:46','19:01'),('WS08H58U92R8','2021-05-20 00:00:00','05:46','19:02');
/*!40000 ALTER TABLE `geography` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header`
--

DROP TABLE IF EXISTS `header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `header` (
  `type` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `sourceId` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `creationTime` varchar(255) DEFAULT NULL,
  `synchronizationVersion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header`
--

LOCK TABLES `header` WRITE;
/*!40000 ALTER TABLE `header` DISABLE KEYS */;
INSERT INTO `header` VALUES ('online','cloud','null','1620892025','2021-05-13 15:44:22','1620886684');
/*!40000 ALTER TABLE `header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hub`
--

DROP TABLE IF EXISTS `hub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hub` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `hubProductName` varchar(255) DEFAULT NULL,
  `hubProductModel` varchar(255) DEFAULT NULL,
  `hubProductSpecification` varchar(255) DEFAULT NULL,
  `hubVersion` varchar(255) DEFAULT NULL,
  `hubDescription` varchar(255) DEFAULT NULL,
  `hubLibraryId` bigint(20) DEFAULT NULL,
  `hubName` varchar(255) DEFAULT NULL,
  `hubIp` varchar(255) DEFAULT NULL,
  `hubMacAddress` varchar(255) DEFAULT NULL,
  `hubRunningVersion` varchar(255) DEFAULT NULL,
  `hubLocation` varchar(255) DEFAULT NULL,
  `hubAutoUpdate` varchar(255) DEFAULT NULL,
  `hubUpdateTime` varchar(255) DEFAULT NULL,
  `hubSerialNumber` varchar(255) DEFAULT NULL,
  `hubManufactureDate` varchar(255) DEFAULT NULL,
  `hubInstallationDate` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hub`
--

LOCK TABLES `hub` WRITE;
/*!40000 ALTER TABLE `hub` DISABLE KEYS */;
INSERT INTO `hub` VALUES (7,'1564450828000','1620803159000','Licotek','ＨＵＢ','家庭主机','H10099','12365465454','1','中控主机。。。',1,'办公室主机','192.168.0.220','1','0.0.1','办公室','True','09:30','10011010','0','0','True');
/*!40000 ALTER TABLE `hub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naturalcycle`
--

DROP TABLE IF EXISTS `naturalcycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `naturalcycle` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `projectId` varchar(255) DEFAULT NULL,
  `spaceId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `control` varchar(255) DEFAULT NULL,
  `naturalCycleState` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `deviceGroupList` varchar(255) DEFAULT NULL,
  `deviceList` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naturalcycle`
--

LOCK TABLES `naturalcycle` WRITE;
/*!40000 ALTER TABLE `naturalcycle` DISABLE KEYS */;
INSERT INTO `naturalcycle` VALUES (19,'1615540072000','1618996531000','6','63','1','','','LIGHTING','SMOOTHING','未执行','True','','652,651'),(21,'1617847739000','1619417838000','6','63','2','','','LIGHTING','SMOOTHING','未执行','True','','705,647,646');
/*!40000 ALTER TABLE `naturalcycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naturalcyclenode`
--

DROP TABLE IF EXISTS `naturalcyclenode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `naturalcyclenode` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `nodeOrder` varchar(255) DEFAULT NULL,
  `actionType1` varchar(255) DEFAULT NULL,
  `actionType2` varchar(255) DEFAULT NULL,
  `actionValue1` varchar(255) DEFAULT NULL,
  `actionValue2` varchar(255) DEFAULT NULL,
  `naturalcycleId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naturalcyclenode`
--

LOCK TABLES `naturalcyclenode` WRITE;
/*!40000 ALTER TABLE `naturalcyclenode` DISABLE KEYS */;
INSERT INTO `naturalcyclenode` VALUES (38,'','23:00:00','0','BRIGHTNESS','COLORTEMPERATURE','0','2700','19'),(39,'','00:30:00','1','BRIGHTNESS','COLORTEMPERATURE','250','6000','19'),(45,'','14:30:00','1','COLORTEMPERATURE','BRIGHTNESS','6000','254','21'),(46,'','14:00:00','0','COLORTEMPERATURE','BRIGHTNESS','2700','254','21'),(61,'','15:00:00','2','COLORTEMPERATURE','BRIGHTNESS','2700','0','21');
/*!40000 ALTER TABLE `naturalcyclenode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel`
--

DROP TABLE IF EXISTS `panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panel` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `panelProductName` varchar(255) DEFAULT NULL,
  `panelProductModel` varchar(255) DEFAULT NULL,
  `panelProductSpecification` varchar(255) DEFAULT NULL,
  `panelVersion` varchar(255) DEFAULT NULL,
  `panelDescription` varchar(255) DEFAULT NULL,
  `panelIcon` varchar(255) DEFAULT NULL,
  `hubId` varchar(255) DEFAULT NULL,
  `gatewayId` varchar(255) DEFAULT NULL,
  `panelLibraryId` varchar(255) DEFAULT NULL,
  `panelName` varchar(255) DEFAULT NULL,
  `panelLocation` varchar(255) DEFAULT NULL,
  `panelAddress` varchar(255) DEFAULT NULL,
  `panelSerialNumber` varchar(255) DEFAULT NULL,
  `panelManufactureDate` varchar(255) DEFAULT NULL,
  `panelInstallationDate` varchar(255) DEFAULT NULL,
  `panelConfigurationFile` varchar(255) DEFAULT NULL,
  `panelConfigurationFileUploadTime` varchar(255) DEFAULT NULL,
  `backlightBrightness` varchar(255) DEFAULT NULL,
  `standbyBrightness` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `nightLight` varchar(255) DEFAULT NULL,
  `pilotLight` varchar(255) DEFAULT NULL,
  `sound` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `panelTargets` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel`
--

LOCK TABLES `panel` WRITE;
/*!40000 ALTER TABLE `panel` DISABLE KEYS */;
INSERT INTO `panel` VALUES (40,'1616644008000','1618536698000','Licotek','PANEL','新式按键面板','P10031','321312321435','1','Licotek 新式按键面板，每个面板独立地址',NULL,'7','10','4','新建新式按键面板','','0','','1601005608000','1616644008000','',NULL,'1','100','False','True','True','True','True',''),(41,'1616644008000','1616653867000','Licotek','PANEL','新式按键面板','P10031','321312321435','1','Licotek 新式按键面板，每个面板独立地址',NULL,'7','10','4','新建新式按键面板','','1','','1601005608000','1616644008000','',NULL,'1','100','False','True','True','True','True',''),(43,'1618536738000','1618536738000','Licotek','PANEL','新式按键面板','P10031','321312321435','1','Licotek 新式按键面板，每个面板独立地址',NULL,'7','53','4','新建新式按键面板','','0','','1602811938000','1618536738000','',NULL,'1','100','False','True','True','True','True',''),(44,'1618536738000','1618536738000','Licotek','PANEL','新式按键面板','P10031','321312321435','1','Licotek 新式按键面板，每个面板独立地址',NULL,'7','53','4','新建新式按键面板','','1','','1602811938000','1618536738000','',NULL,'1','100','False','True','True','True','True','');
/*!40000 ALTER TABLE `panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panelbutton`
--

DROP TABLE IF EXISTS `panelbutton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panelbutton` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `panelButtonLibraryId` varchar(255) DEFAULT NULL,
  `panelButtonType` varchar(255) DEFAULT NULL,
  `panelButtonDescription` varchar(255) DEFAULT NULL,
  `panelButtonIcon` varchar(255) DEFAULT NULL,
  `panelButtonName` varchar(255) DEFAULT NULL,
  `panelButtonAddress` varchar(255) DEFAULT NULL,
  `panelButtonTargetType` varchar(255) DEFAULT NULL,
  `panelButtonTargetAddress` varchar(255) DEFAULT NULL,
  `abCommandMode` varchar(255) DEFAULT NULL,
  `cdCommandMode` varchar(255) DEFAULT NULL,
  `abTargetType` varchar(255) DEFAULT NULL,
  `abTargetAddress` varchar(255) DEFAULT NULL,
  `cdTargetType` varchar(255) DEFAULT NULL,
  `cdTargetAddress` varchar(255) DEFAULT NULL,
  `abCommandGroup` varchar(255) DEFAULT NULL,
  `commandA` varchar(255) DEFAULT NULL,
  `commandB` varchar(255) DEFAULT NULL,
  `commandC` varchar(255) DEFAULT NULL,
  `commandD` varchar(255) DEFAULT NULL,
  `commandCDTimeDelay` varchar(255) DEFAULT NULL,
  `backLightColor` varchar(255) DEFAULT NULL,
  `extendAction` varchar(255) DEFAULT NULL,
  `sound` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `panelId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panelbutton`
--

LOCK TABLES `panelbutton` WRITE;
/*!40000 ALTER TABLE `panelbutton` DISABLE KEYS */;
INSERT INTO `panelbutton` VALUES (144,'1616644008000','1618536698000','5','NEWPHYSICALBUTTON','新式物理按键','','0','0','','','A','','ALL','','','','','Off','','','',NULL,NULL,'True',NULL,'True','40'),(145,'1616644008000','1616644008000','5','NEWPHYSICALBUTTON','新式物理按键','','1','1','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','40'),(146,'1616644008000','1616644008000','5','NEWPHYSICALBUTTON','新式物理按键','','2','2','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','40'),(147,'1616644008000','1616644008000','5','NEWPHYSICALBUTTON','新式物理按键','','3','3','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','40'),(148,'1616644008000','1616644008000','6','NEWPHYSICALKNOB','新式物理旋钮','','0','0','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','40'),(149,'1616644008000','1616653867000','5','NEWPHYSICALBUTTON','新式物理按键','','0','0','','','A','','ALL','','','','','REcallMin','','','',NULL,NULL,'True',NULL,'True','41'),(150,'1616644008000','1616644008000','5','NEWPHYSICALBUTTON','新式物理按键','','1','1','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','41'),(151,'1616644008000','1616644008000','5','NEWPHYSICALBUTTON','新式物理按键','','2','2','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','41'),(152,'1616644008000','1616644008000','5','NEWPHYSICALBUTTON','新式物理按键','','3','3','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','41'),(153,'1616644008000','1616644008000','5','NEWPHYSICALBUTTON','新式物理按键','','4','4','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','41'),(154,'1616644008000','1616644008000','5','NEWPHYSICALBUTTON','新式物理按键','','5','5','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','41'),(155,'1616644008000','1616644008000','6','NEWPHYSICALKNOB','新式物理旋钮','','0','0','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','41'),(163,'1618536738000','1618536738000','5','NEWPHYSICALBUTTON','新式物理按键','','0','0','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','43'),(164,'1618536738000','1618536738000','5','NEWPHYSICALBUTTON','新式物理按键','','1','1','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','43'),(165,'1618536738000','1618536738000','5','NEWPHYSICALBUTTON','新式物理按键','','2','2','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','43'),(166,'1618536738000','1618536738000','5','NEWPHYSICALBUTTON','新式物理按键','','3','3','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','43'),(167,'1618536738000','1618536738000','6','NEWPHYSICALKNOB','新式物理旋钮','','0','0','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','43'),(168,'1618536738000','1618536738000','5','NEWPHYSICALBUTTON','新式物理按键','','0','0','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','44'),(169,'1618536738000','1618536738000','5','NEWPHYSICALBUTTON','新式物理按键','','1','1','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','44'),(170,'1618536738000','1618536738000','5','NEWPHYSICALBUTTON','新式物理按键','','2','2','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','44'),(171,'1618536738000','1618536738000','5','NEWPHYSICALBUTTON','新式物理按键','','3','3','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','44'),(172,'1618536738000','1618536738000','5','NEWPHYSICALBUTTON','新式物理按键','','4','4','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','44'),(173,'1618536738000','1618536738000','5','NEWPHYSICALBUTTON','新式物理按键','','5','5','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','44'),(174,'1618536738000','1618536738000','6','NEWPHYSICALKNOB','新式物理旋钮','','0','0','','','','','','','','','','','','','',NULL,NULL,'False',NULL,'True','44');
/*!40000 ALTER TABLE `panelbutton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panelbuttonaction`
--

DROP TABLE IF EXISTS `panelbuttonaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panelbuttonaction` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `panelButtonCommand` varchar(255) DEFAULT NULL,
  `panelButtonActionType` varchar(255) DEFAULT NULL,
  `targetSceneId` varchar(255) DEFAULT NULL,
  `targetNaturalCycleId` varchar(255) DEFAULT NULL,
  `supportedActionId` varchar(255) DEFAULT NULL,
  `supportedServiceId` varchar(255) DEFAULT NULL,
  `actionExecuteType` varchar(255) DEFAULT NULL,
  `actionTimeDelay` varchar(255) DEFAULT NULL,
  `actionOrder` varchar(255) DEFAULT NULL,
  `actionParameter1` varchar(255) DEFAULT NULL,
  `actionParameter2` varchar(255) DEFAULT NULL,
  `actionParameter3` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `panelButtonId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panelbuttonaction`
--

LOCK TABLES `panelbuttonaction` WRITE;
/*!40000 ALTER TABLE `panelbuttonaction` DISABLE KEYS */;
INSERT INTO `panelbuttonaction` VALUES (78,'1616654531000','1616654531000','','A','DEVICE',NULL,NULL,'1','1','REALTIME',NULL,'0','','','','True','144'),(80,'1617782498000','1617782498000','','A','NATURALCYCLE',NULL,'19',NULL,NULL,'REALTIME',NULL,'2','','','','True','144');
/*!40000 ALTER TABLE `panelbuttonaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panelbuttonactiontarget`
--

DROP TABLE IF EXISTS `panelbuttonactiontarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panelbuttonactiontarget` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `panelButtonActionTargetId` varchar(255) DEFAULT NULL,
  `panelButtonActionTargetType` varchar(255) DEFAULT NULL,
  `panelButtonActionId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panelbuttonactiontarget`
--

LOCK TABLES `panelbuttonactiontarget` WRITE;
/*!40000 ALTER TABLE `panelbuttonactiontarget` DISABLE KEYS */;
INSERT INTO `panelbuttonactiontarget` VALUES (229,'1616654531000','1616654531000','652','DEVICE','78');
/*!40000 ALTER TABLE `panelbuttonactiontarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `gatewayId` varchar(255) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `playlistId` varchar(255) DEFAULT NULL,
  `playlistName` varchar(255) DEFAULT NULL,
  `trackCount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (5,'1590648885000','1590652044000','44','AUXDI','Playlist','2','/mnt/yaffs2/中文歌曲/','47'),(6,'1590648885000','1590653073000','44','AUXDI','Playlist','7','/mnt/udisk/sawano/','5'),(7,'1590648885000','1590653073000','44','AUXDI','Playlist','8','/mnt/udisk/touhou pure/','10'),(8,'1590648885000','1590653073000','44','AUXDI','Playlist','9','/mnt/udisk/touhou vocal/','10');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  `projectType` varchar(255) DEFAULT NULL,
  `projectArea` varchar(255) DEFAULT NULL,
  `projectAreaId` varchar(255) DEFAULT NULL,
  `projectLocation` varchar(255) DEFAULT NULL,
  `projectLongitude` varchar(255) DEFAULT NULL,
  `projectLatitude` varchar(255) DEFAULT NULL,
  `projectDescription` varchar(255) DEFAULT NULL,
  `projectStartTime` varchar(255) DEFAULT NULL,
  `projectEndTime` varchar(255) DEFAULT NULL,
  `projectState` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (6,'1564450181000','1620886683000','和控办公室','ENTERPRISE','广东省/中山市','LICOTEK95041##WS08H58U92R8','利和','','','和控办公室测试','','','','True');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `propertyLibraryId` varchar(255) DEFAULT NULL,
  `propertyDescription` varchar(255) DEFAULT NULL,
  `propertyName` varchar(255) DEFAULT NULL,
  `propertyType` varchar(255) DEFAULT NULL,
  `propertyState` varchar(255) DEFAULT NULL,
  `propertyValue` varchar(255) DEFAULT NULL,
  `readOnly` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `deviceId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (130,'1615794593000','1615794593000','65','分组_3','GROUP_3','BOOLEAN','正常','','True','True','646'),(131,'1615794593000','1615794593000','87','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常','','True','True','646'),(132,'1615794593000','1615794593000','74','分组_12','GROUP_12','BOOLEAN','正常','','True','True','646'),(133,'1615794593000','1615794593000','77','分组_15','GROUP_15','BOOLEAN','正常','','True','True','646'),(134,'1615794593000','1615794593000','101','场景色温_7','SCENECOLORTEMPERATURE_7','INTEGER','正常','','True','True','646'),(135,'1615794593000','1615794593000','66','分组_4','GROUP_4','BOOLEAN','正常','','True','True','646'),(136,'1615794593000','1618539931000','94','场景色温_0','SCENECOLORTEMPERATURE_0','INTEGER','正常','65535','True','True','646'),(137,'1615794593000','1615794593000','95','场景色温_1','SCENECOLORTEMPERATURE_1','INTEGER','正常','','True','True','646'),(138,'1615794593000','1615794593000','76','分组_14','GROUP_14','BOOLEAN','正常','','True','True','646'),(139,'1615794593000','1615794593000','100','场景色温_6','SCENECOLORTEMPERATURE_6','INTEGER','正常','','True','True','646'),(140,'1615794593000','1618539931000','113','最小功率','MINLEVEL','INTEGER','正常','','False','True','646'),(141,'1615794593000','1615794593000','83','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常','','True','True','646'),(142,'1615794593000','1618539931000','112','最大功率','MAXLEVEL','INTEGER','正常','','False','True','646'),(143,'1615794593000','1615794593000','91','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常','','True','True','646'),(144,'1615794593000','1618539931000','78','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常','0','True','True','646'),(145,'1615794593000','1615794593000','64','分组_2','GROUP_2','BOOLEAN','正常','','True','True','646'),(146,'1615794593000','1615794593000','88','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常','','True','True','646'),(147,'1615794593000','1615794593000','73','分组_11','GROUP_11','BOOLEAN','正常','','True','True','646'),(148,'1615794593000','1615794593000','102','场景色温_8','SCENECOLORTEMPERATURE_8','INTEGER','正常','','True','True','646'),(149,'1615794593000','1615794593000','90','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常','','True','True','646'),(150,'1615794593000','1615794593000','70','分组_8','GROUP_8','BOOLEAN','正常','','True','True','646'),(151,'1615794593000','1615794593000','72','分组_10','GROUP_10','BOOLEAN','正常','','True','True','646'),(152,'1615794593000','1615794593000','80','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常','','True','True','646'),(153,'1615794593000','1618539931000','118','光通量','LUMINOUSFLUX','INTEGER','正常','','False','True','646'),(154,'1615794593000','1615794593000','105','场景色温_11','SCENECOLORTEMPERATURE_11','INTEGER','正常','','True','True','646'),(155,'1615794593000','1615794789000','121','DTR','DTR','INTEGER','正常','0','True','True','646'),(156,'1615794593000','1615794593000','79','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常','','True','True','646'),(157,'1615794593000','1618539931000','119','光照面积','IRRADIATIONAREA','FLOAT','正常','','False','True','646'),(158,'1615794593000','1615794593000','96','场景色温_2','SCENECOLORTEMPERATURE_2','INTEGER','正常','','True','True','646'),(159,'1615794593000','1615794593000','99','场景色温_5','SCENECOLORTEMPERATURE_5','INTEGER','正常','','True','True','646'),(160,'1615794593000','1615794593000','81','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常','','True','True','646'),(161,'1615794593000','1618539931000','117','功率及场景渐变时间','FADETIME','INTEGER','正常','','False','True','646'),(162,'1615794593000','1615794593000','62','分组_0','GROUP_0','BOOLEAN','正常','','True','True','646'),(163,'1615794593000','1615794789000','120','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','True','True','646'),(164,'1615794593000','1618539931000','110','上电功率等级','POWERONLEVEL','INTEGER','正常','','False','True','646'),(165,'1615794593000','1618539931000','114','上电色温','POWERONCOLOR','INTEGER','正常','','False','True','646'),(166,'1615794593000','1615794593000','82','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常','','True','True','646'),(167,'1615794593000','1615794593000','86','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常','','True','True','646'),(168,'1615794593000','1615794593000','103','场景色温_9','SCENECOLORTEMPERATURE_9','INTEGER','正常','','True','True','646'),(169,'1615794593000','1615794593000','92','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常','','True','True','646'),(170,'1615794593000','1615794593000','106','场景色温_12','SCENECOLORTEMPERATURE_12','INTEGER','正常','','True','True','646'),(171,'1615794593000','1615794593000','68','分组_6','GROUP_6','BOOLEAN','正常','','True','True','646'),(172,'1615794593000','1615794593000','108','场景色温_14','SCENECOLORTEMPERATURE_14','INTEGER','正常','','True','True','646'),(173,'1615794593000','1615794593000','84','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常','','True','True','646'),(174,'1615794593000','1615794593000','107','场景色温_13','SCENECOLORTEMPERATURE_13','INTEGER','正常','','True','True','646'),(175,'1615794593000','1615794593000','67','分组_5','GROUP_5','BOOLEAN','正常','','True','True','646'),(176,'1615794593000','1618539931000','111','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常','','False','True','646'),(177,'1615794593000','1615794593000','63','分组_1','GROUP_1','BOOLEAN','正常','','True','True','646'),(178,'1615794593000','1615794593000','75','分组_13','GROUP_13','BOOLEAN','正常','','True','True','646'),(179,'1615794593000','1615794593000','98','场景色温_4','SCENECOLORTEMPERATURE_4','INTEGER','正常','','True','True','646'),(180,'1615794593000','1615794593000','69','分组_7','GROUP_7','BOOLEAN','正常','','True','True','646'),(181,'1615794593000','1618539931000','115','系统故障色温','SYSTEMFAILURECOLOR','INTEGER','正常','','False','True','646'),(182,'1615794593000','1615794789000','122','随机地址','RANDOMADDRESS','STRING','正常','000000','True','True','646'),(183,'1615794593000','1615794593000','93','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常','','True','True','646'),(184,'1615794593000','1615794593000','89','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常','','True','True','646'),(185,'1615794593000','1615794593000','71','分组_9','GROUP_9','BOOLEAN','正常','','True','True','646'),(186,'1615794593000','1618539931000','116','调光渐变速率','FADERATE','INTEGER','正常','','False','True','646'),(187,'1615794593000','1615794593000','97','场景色温_3','SCENECOLORTEMPERATURE_3','INTEGER','正常','','True','True','646'),(188,'1615794593000','1615794593000','104','场景色温_10','SCENECOLORTEMPERATURE_10','INTEGER','正常','','True','True','646'),(189,'1615794593000','1615794593000','109','场景色温_15','SCENECOLORTEMPERATURE_15','INTEGER','正常','','True','True','646'),(190,'1615794593000','1615794593000','85','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常','','True','True','646'),(191,'1615862377000','1615862377000','82','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常','','True','True','647'),(192,'1615862377000','1615862377000','63','分组_1','GROUP_1','BOOLEAN','正常','','True','True','647'),(193,'1615862377000','1615862377000','111','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常','','False','True','647'),(194,'1615862377000','1615862377000','99','场景色温_5','SCENECOLORTEMPERATURE_5','INTEGER','正常','','True','True','647'),(195,'1615862377000','1618539931000','122','随机地址','RANDOMADDRESS','STRING','正常','000000','True','True','647'),(196,'1615862377000','1615862377000','100','场景色温_6','SCENECOLORTEMPERATURE_6','INTEGER','正常','','True','True','647'),(197,'1615862377000','1615862377000','77','分组_15','GROUP_15','BOOLEAN','正常','','True','True','647'),(198,'1615862377000','1615862377000','110','上电功率等级','POWERONLEVEL','INTEGER','正常','','False','True','647'),(199,'1615862377000','1615862377000','64','分组_2','GROUP_2','BOOLEAN','正常','','True','True','647'),(200,'1615862377000','1615862377000','70','分组_8','GROUP_8','BOOLEAN','正常','','True','True','647'),(201,'1615862377000','1615862377000','105','场景色温_11','SCENECOLORTEMPERATURE_11','INTEGER','正常','','True','True','647'),(202,'1615862377000','1615862377000','102','场景色温_8','SCENECOLORTEMPERATURE_8','INTEGER','正常','','True','True','647'),(203,'1615862377000','1615862377000','86','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常','','True','True','647'),(204,'1615862377000','1615862377000','84','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常','','True','True','647'),(205,'1615862377000','1615862377000','66','分组_4','GROUP_4','BOOLEAN','正常','','True','True','647'),(206,'1615862377000','1615862377000','68','分组_6','GROUP_6','BOOLEAN','正常','','True','True','647'),(207,'1615862377000','1615862377000','93','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常','','True','True','647'),(208,'1615862377000','1615862377000','76','分组_14','GROUP_14','BOOLEAN','正常','','True','True','647'),(209,'1615862377000','1615862377000','109','场景色温_15','SCENECOLORTEMPERATURE_15','INTEGER','正常','','True','True','647'),(210,'1615862377000','1615862377000','71','分组_9','GROUP_9','BOOLEAN','正常','','True','True','647'),(211,'1615862377000','1615862377000','89','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常','','True','True','647'),(212,'1615862377000','1615862377000','108','场景色温_14','SCENECOLORTEMPERATURE_14','INTEGER','正常','','True','True','647'),(213,'1615862377000','1615862377000','88','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常','','True','True','647'),(214,'1615862377000','1615862377000','72','分组_10','GROUP_10','BOOLEAN','正常','','True','True','647'),(215,'1615862377000','1615862377000','96','场景色温_2','SCENECOLORTEMPERATURE_2','INTEGER','正常','','True','True','647'),(216,'1615862377000','1615862377000','116','调光渐变速率','FADERATE','INTEGER','正常','','False','True','647'),(217,'1615862377000','1615862377000','62','分组_0','GROUP_0','BOOLEAN','正常','','True','True','647'),(218,'1615862377000','1615862377000','97','场景色温_3','SCENECOLORTEMPERATURE_3','INTEGER','正常','','True','True','647'),(219,'1615862377000','1615862377000','85','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常','','True','True','647'),(220,'1615862377000','1615862377000','81','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常','','True','True','647'),(221,'1615862377000','1615862377000','112','最大功率','MAXLEVEL','INTEGER','正常','','False','True','647'),(222,'1615862377000','1618539931000','78','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常','0','True','True','647'),(223,'1615862377000','1618539931000','121','DTR','DTR','INTEGER','正常','0','True','True','647'),(224,'1615862377000','1615862377000','104','场景色温_10','SCENECOLORTEMPERATURE_10','INTEGER','正常','','True','True','647'),(225,'1615862377000','1615862377000','80','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常','','True','True','647'),(226,'1615862377000','1615862377000','98','场景色温_4','SCENECOLORTEMPERATURE_4','INTEGER','正常','','True','True','647'),(227,'1615862377000','1615862377000','91','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常','','True','True','647'),(228,'1615862377000','1615862377000','103','场景色温_9','SCENECOLORTEMPERATURE_9','INTEGER','正常','','True','True','647'),(229,'1615862377000','1615862377000','119','光照面积','IRRADIATIONAREA','FLOAT','正常','','False','True','647'),(230,'1615862377000','1618539931000','120','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','True','True','647'),(231,'1615862377000','1615862377000','75','分组_13','GROUP_13','BOOLEAN','正常','','True','True','647'),(232,'1615862377000','1615862377000','69','分组_7','GROUP_7','BOOLEAN','正常','','True','True','647'),(233,'1615862377000','1615862377000','83','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常','','True','True','647'),(234,'1615862377000','1618539931000','94','场景色温_0','SCENECOLORTEMPERATURE_0','INTEGER','正常','65535','True','True','647'),(235,'1615862377000','1615862377000','118','光通量','LUMINOUSFLUX','INTEGER','正常','','False','True','647'),(236,'1615862377000','1615862377000','114','上电色温','POWERONCOLOR','INTEGER','正常','','False','True','647'),(237,'1615862377000','1615862377000','65','分组_3','GROUP_3','BOOLEAN','正常','','True','True','647'),(238,'1615862377000','1615862377000','101','场景色温_7','SCENECOLORTEMPERATURE_7','INTEGER','正常','','True','True','647'),(239,'1615862377000','1615862377000','79','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常','','True','True','647'),(240,'1615862377000','1615862377000','113','最小功率','MINLEVEL','INTEGER','正常','','False','True','647'),(241,'1615862377000','1615862377000','92','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常','','True','True','647'),(242,'1615862377000','1615862377000','95','场景色温_1','SCENECOLORTEMPERATURE_1','INTEGER','正常','','True','True','647'),(243,'1615862377000','1615862377000','73','分组_11','GROUP_11','BOOLEAN','正常','','True','True','647'),(244,'1615862377000','1615862377000','107','场景色温_13','SCENECOLORTEMPERATURE_13','INTEGER','正常','','True','True','647'),(245,'1615862377000','1615862377000','67','分组_5','GROUP_5','BOOLEAN','正常','','True','True','647'),(246,'1615862377000','1615862377000','90','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常','','True','True','647'),(247,'1615862377000','1615862377000','87','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常','','True','True','647'),(248,'1615862377000','1615862377000','106','场景色温_12','SCENECOLORTEMPERATURE_12','INTEGER','正常','','True','True','647'),(249,'1615862377000','1615862377000','115','系统故障色温','SYSTEMFAILURECOLOR','INTEGER','正常','','False','True','647'),(250,'1615862377000','1615862377000','74','分组_12','GROUP_12','BOOLEAN','正常','','True','True','647'),(251,'1615862377000','1615862377000','117','功率及场景渐变时间','FADETIME','INTEGER','正常','','False','True','647'),(435,'1616054038000','1616380624000','122','随机地址','RANDOMADDRESS','STRING','正常','000000','True','True','651'),(436,'1616054038000','1616054038000','104','场景色温_10','SCENECOLORTEMPERATURE_10','INTEGER','正常','','True','True','651'),(437,'1616054038000','1616054038000','114','上电色温','POWERONCOLOR','INTEGER','正常','','False','True','651'),(438,'1616054038000','1616054038000','107','场景色温_13','SCENECOLORTEMPERATURE_13','INTEGER','正常','','True','True','651'),(439,'1616054038000','1618996542000','95','场景色温_1','SCENECOLORTEMPERATURE_1','INTEGER','正常','6000','True','True','651'),(440,'1616054038000','1616054038000','119','光照面积','IRRADIATIONAREA','FLOAT','正常','','False','True','651'),(441,'1616054038000','1616054038000','66','分组_4','GROUP_4','BOOLEAN','正常','','True','True','651'),(442,'1616054038000','1616380700000','62','分组_0','GROUP_0','BOOLEAN','正常','True','True','True','651'),(443,'1616054038000','1616054038000','91','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常','','True','True','651'),(444,'1616054038000','1616054038000','102','场景色温_8','SCENECOLORTEMPERATURE_8','INTEGER','正常','','True','True','651'),(445,'1616054038000','1616054038000','71','分组_9','GROUP_9','BOOLEAN','正常','','True','True','651'),(446,'1616054038000','1616054038000','115','系统故障色温','SYSTEMFAILURECOLOR','INTEGER','正常','','False','True','651'),(447,'1616054038000','1616054038000','98','场景色温_4','SCENECOLORTEMPERATURE_4','INTEGER','正常','','True','True','651'),(448,'1616054038000','1616054038000','74','分组_12','GROUP_12','BOOLEAN','正常','','True','True','651'),(449,'1616054038000','1618996542000','79','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常','0','True','True','651'),(450,'1616054038000','1616054038000','83','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常','','True','True','651'),(451,'1616054038000','1616380624000','121','DTR','DTR','INTEGER','正常','0','True','True','651'),(452,'1616054038000','1616054038000','89','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常','','True','True','651'),(453,'1616054038000','1616054038000','97','场景色温_3','SCENECOLORTEMPERATURE_3','INTEGER','正常','','True','True','651'),(454,'1616054038000','1616054038000','69','分组_7','GROUP_7','BOOLEAN','正常','','True','True','651'),(455,'1616054038000','1616054038000','111','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常','','False','True','651'),(456,'1616054038000','1616054038000','92','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常','','True','True','651'),(457,'1616054038000','1616054038000','81','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常','','True','True','651'),(458,'1616054038000','1616054038000','113','最小功率','MINLEVEL','INTEGER','正常','','False','True','651'),(459,'1616054038000','1616054038000','72','分组_10','GROUP_10','BOOLEAN','正常','','True','True','651'),(460,'1616054038000','1616054038000','85','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常','','True','True','651'),(461,'1616054038000','1616054038000','106','场景色温_12','SCENECOLORTEMPERATURE_12','INTEGER','正常','','True','True','651'),(462,'1616054038000','1616054038000','93','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常','','True','True','651'),(463,'1616054038000','1616054038000','82','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常','','True','True','651'),(464,'1616054038000','1616054038000','78','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常','','True','True','651'),(465,'1616054038000','1616054038000','109','场景色温_15','SCENECOLORTEMPERATURE_15','INTEGER','正常','','True','True','651'),(466,'1616054038000','1616054038000','116','调光渐变速率','FADERATE','INTEGER','正常','','False','True','651'),(467,'1616054038000','1616380624000','120','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','True','True','651'),(468,'1616054038000','1616054038000','110','上电功率等级','POWERONLEVEL','INTEGER','正常','','False','True','651'),(469,'1616054038000','1616054038000','118','光通量','LUMINOUSFLUX','INTEGER','正常','','False','True','651'),(470,'1616054038000','1616054038000','76','分组_14','GROUP_14','BOOLEAN','正常','','True','True','651'),(471,'1616054038000','1616054038000','101','场景色温_7','SCENECOLORTEMPERATURE_7','INTEGER','正常','','True','True','651'),(472,'1616054038000','1616054038000','100','场景色温_6','SCENECOLORTEMPERATURE_6','INTEGER','正常','','True','True','651'),(473,'1616054038000','1616054038000','103','场景色温_9','SCENECOLORTEMPERATURE_9','INTEGER','正常','','True','True','651'),(474,'1616054038000','1616054038000','84','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常','','True','True','651'),(475,'1616054038000','1616054038000','80','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常','','True','True','651'),(476,'1616054038000','1616054038000','65','分组_3','GROUP_3','BOOLEAN','正常','','True','True','651'),(477,'1616054038000','1616054038000','73','分组_11','GROUP_11','BOOLEAN','正常','','True','True','651'),(478,'1616054038000','1616054038000','77','分组_15','GROUP_15','BOOLEAN','正常','','True','True','651'),(479,'1616054038000','1616054038000','105','场景色温_11','SCENECOLORTEMPERATURE_11','INTEGER','正常','','True','True','651'),(480,'1616054038000','1616054038000','75','分组_13','GROUP_13','BOOLEAN','正常','','True','True','651'),(481,'1616054038000','1616054038000','99','场景色温_5','SCENECOLORTEMPERATURE_5','INTEGER','正常','','True','True','651'),(482,'1616054038000','1616054038000','94','场景色温_0','SCENECOLORTEMPERATURE_0','INTEGER','正常','','True','True','651'),(483,'1616054038000','1616054038000','64','分组_2','GROUP_2','BOOLEAN','正常','','True','True','651'),(484,'1616054038000','1616054038000','67','分组_5','GROUP_5','BOOLEAN','正常','','True','True','651'),(485,'1616054038000','1616054038000','108','场景色温_14','SCENECOLORTEMPERATURE_14','INTEGER','正常','','True','True','651'),(486,'1616054038000','1616054038000','63','分组_1','GROUP_1','BOOLEAN','正常','','True','True','651'),(487,'1616054038000','1616054038000','117','功率及场景渐变时间','FADETIME','INTEGER','正常','','False','True','651'),(488,'1616054038000','1616054038000','88','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常','','True','True','651'),(489,'1616054038000','1616054038000','96','场景色温_2','SCENECOLORTEMPERATURE_2','INTEGER','正常','','True','True','651'),(490,'1616054038000','1616054038000','90','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常','','True','True','651'),(491,'1616054038000','1616380624000','112','最大功率','MAXLEVEL','INTEGER','正常','200','False','True','651'),(492,'1616054038000','1616054038000','86','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常','','True','True','651'),(493,'1616054038000','1616054038000','68','分组_6','GROUP_6','BOOLEAN','正常','','True','True','651'),(494,'1616054038000','1616054038000','87','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常','','True','True','651'),(495,'1616054038000','1616054038000','70','分组_8','GROUP_8','BOOLEAN','正常','','True','True','651'),(496,'1616054106000','1616054106000','73','分组_11','GROUP_11','BOOLEAN','正常','','True','True','652'),(497,'1616054106000','1616479875000','78','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常','254','True','True','652'),(498,'1616054106000','1616484633000','79','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常','200','True','True','652'),(499,'1616054106000','1616054106000','65','分组_3','GROUP_3','BOOLEAN','正常','','True','True','652'),(500,'1616054106000','1616054106000','70','分组_8','GROUP_8','BOOLEAN','正常','','True','True','652'),(501,'1616054106000','1616054106000','82','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常','','True','True','652'),(502,'1616054106000','1616054106000','102','场景色温_8','SCENECOLORTEMPERATURE_8','INTEGER','正常','','True','True','652'),(503,'1616054106000','1616054106000','105','场景色温_11','SCENECOLORTEMPERATURE_11','INTEGER','正常','','True','True','652'),(504,'1616054106000','1616054106000','71','分组_9','GROUP_9','BOOLEAN','正常','','True','True','652'),(505,'1616054106000','1616054106000','90','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常','','True','True','652'),(506,'1616054106000','1616054106000','109','场景色温_15','SCENECOLORTEMPERATURE_15','INTEGER','正常','','True','True','652'),(507,'1616054106000','1616054106000','117','功率及场景渐变时间','FADETIME','INTEGER','正常','','False','True','652'),(508,'1616054106000','1616054106000','116','调光渐变速率','FADERATE','INTEGER','正常','','False','True','652'),(509,'1616054106000','1617958303000','62','分组_0','GROUP_0','BOOLEAN','正常','True','True','True','652'),(510,'1616054106000','1616054106000','89','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常','','True','True','652'),(511,'1616054106000','1616054106000','93','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常','','True','True','652'),(512,'1616054106000','1616054106000','103','场景色温_9','SCENECOLORTEMPERATURE_9','INTEGER','正常','','True','True','652'),(513,'1616054106000','1616054106000','68','分组_6','GROUP_6','BOOLEAN','正常','','True','True','652'),(514,'1616054106000','1616054106000','106','场景色温_12','SCENECOLORTEMPERATURE_12','INTEGER','正常','','True','True','652'),(515,'1616054106000','1616054106000','88','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常','','True','True','652'),(516,'1616054106000','1616466498000','95','场景色温_1','SCENECOLORTEMPERATURE_1','INTEGER','正常','3000','True','True','652'),(517,'1616054106000','1616380700000','121','DTR','DTR','INTEGER','正常','0','True','True','652'),(518,'1616054106000','1616054106000','86','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常','','True','True','652'),(519,'1616054106000','1616054106000','107','场景色温_13','SCENECOLORTEMPERATURE_13','INTEGER','正常','','True','True','652'),(520,'1616054106000','1616397002000','112','最大功率','MAXLEVEL','INTEGER','正常','254','False','True','652'),(521,'1616054106000','1616054106000','101','场景色温_7','SCENECOLORTEMPERATURE_7','INTEGER','正常','','True','True','652'),(522,'1616054106000','1616054106000','75','分组_13','GROUP_13','BOOLEAN','正常','','True','True','652'),(523,'1616054106000','1616054106000','115','系统故障色温','SYSTEMFAILURECOLOR','INTEGER','正常','','False','True','652'),(524,'1616054106000','1616380700000','120','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','True','True','652'),(525,'1616054106000','1616054106000','114','上电色温','POWERONCOLOR','INTEGER','正常','','False','True','652'),(526,'1616054106000','1616466806000','94','场景色温_0','SCENECOLORTEMPERATURE_0','INTEGER','正常','6000','True','True','652'),(527,'1616054106000','1616054106000','97','场景色温_3','SCENECOLORTEMPERATURE_3','INTEGER','正常','','True','True','652'),(528,'1616054106000','1616054106000','76','分组_14','GROUP_14','BOOLEAN','正常','','True','True','652'),(529,'1616054106000','1616054106000','80','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常','','True','True','652'),(530,'1616054106000','1616054106000','77','分组_15','GROUP_15','BOOLEAN','正常','','True','True','652'),(531,'1616054106000','1616054106000','92','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常','','True','True','652'),(532,'1616054106000','1616054106000','72','分组_10','GROUP_10','BOOLEAN','正常','','True','True','652'),(533,'1616054106000','1616054106000','67','分组_5','GROUP_5','BOOLEAN','正常','','True','True','652'),(534,'1616054106000','1616054106000','64','分组_2','GROUP_2','BOOLEAN','正常','','True','True','652'),(535,'1616054106000','1616054106000','74','分组_12','GROUP_12','BOOLEAN','正常','','True','True','652'),(536,'1616054106000','1616054106000','85','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常','','True','True','652'),(537,'1616054106000','1616054106000','110','上电功率等级','POWERONLEVEL','INTEGER','正常','','False','True','652'),(538,'1616054106000','1616054106000','66','分组_4','GROUP_4','BOOLEAN','正常','','True','True','652'),(539,'1616054106000','1616054106000','119','光照面积','IRRADIATIONAREA','FLOAT','正常','','False','True','652'),(540,'1616054106000','1616054106000','84','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常','','True','True','652'),(541,'1616054106000','1616054106000','96','场景色温_2','SCENECOLORTEMPERATURE_2','INTEGER','正常','','True','True','652'),(542,'1616054106000','1616054106000','100','场景色温_6','SCENECOLORTEMPERATURE_6','INTEGER','正常','','True','True','652'),(543,'1616054106000','1616054106000','104','场景色温_10','SCENECOLORTEMPERATURE_10','INTEGER','正常','','True','True','652'),(544,'1616054106000','1616054106000','63','分组_1','GROUP_1','BOOLEAN','正常','','True','True','652'),(545,'1616054106000','1616054106000','111','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常','','False','True','652'),(546,'1616054106000','1616054106000','118','光通量','LUMINOUSFLUX','INTEGER','正常','','False','True','652'),(547,'1616054106000','1616054106000','69','分组_7','GROUP_7','BOOLEAN','正常','','True','True','652'),(548,'1616054106000','1616054106000','98','场景色温_4','SCENECOLORTEMPERATURE_4','INTEGER','正常','','True','True','652'),(549,'1616054106000','1616054106000','81','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常','','True','True','652'),(550,'1616054106000','1616054106000','99','场景色温_5','SCENECOLORTEMPERATURE_5','INTEGER','正常','','True','True','652'),(551,'1616054106000','1616054106000','87','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常','','True','True','652'),(552,'1616054106000','1616054106000','108','场景色温_14','SCENECOLORTEMPERATURE_14','INTEGER','正常','','True','True','652'),(553,'1616054106000','1616380700000','122','随机地址','RANDOMADDRESS','STRING','正常','000000','True','True','652'),(554,'1616054106000','1616054106000','113','最小功率','MINLEVEL','INTEGER','正常','','False','True','652'),(555,'1616054106000','1616054106000','83','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常','','True','True','652'),(556,'1616054106000','1616054106000','91','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常','','True','True','652'),(722,'1616119366000','1616119366000','71','分组_9','GROUP_9','BOOLEAN','正常','','True','True','656'),(723,'1616119366000','1616119366000','117','功率及场景渐变时间','FADETIME','INTEGER','正常','','False','True','656'),(724,'1616119366000','1616119366000','64','分组_2','GROUP_2','BOOLEAN','正常','','True','True','656'),(725,'1616119366000','1616119366000','86','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常','','True','True','656'),(726,'1616119366000','1616119366000','84','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常','','True','True','656'),(727,'1616119366000','1616119366000','88','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常','','True','True','656'),(728,'1616119366000','1616119366000','113','最小功率','MINLEVEL','INTEGER','正常','','False','True','656'),(729,'1616119366000','1616119366000','96','场景色温_2','SCENECOLORTEMPERATURE_2','INTEGER','正常','','True','True','656'),(730,'1616119366000','1616119366000','63','分组_1','GROUP_1','BOOLEAN','正常','','True','True','656'),(731,'1616119366000','1616119524000','120','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','True','True','656'),(732,'1616119366000','1616119366000','102','场景色温_8','SCENECOLORTEMPERATURE_8','INTEGER','正常','','True','True','656'),(733,'1616119366000','1616119366000','95','场景色温_1','SCENECOLORTEMPERATURE_1','INTEGER','正常','','True','True','656'),(734,'1616119366000','1616119366000','66','分组_4','GROUP_4','BOOLEAN','正常','','True','True','656'),(735,'1616119366000','1616119366000','105','场景色温_11','SCENECOLORTEMPERATURE_11','INTEGER','正常','','True','True','656'),(736,'1616119366000','1616119366000','90','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常','','True','True','656'),(737,'1616119366000','1616119366000','108','场景色温_14','SCENECOLORTEMPERATURE_14','INTEGER','正常','','True','True','656'),(738,'1616119366000','1616119366000','72','分组_10','GROUP_10','BOOLEAN','正常','','True','True','656'),(739,'1616119366000','1616119366000','85','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常','','True','True','656'),(740,'1616119366000','1616119366000','80','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常','','True','True','656'),(741,'1616119366000','1616119366000','75','分组_13','GROUP_13','BOOLEAN','正常','','True','True','656'),(742,'1616119366000','1616119366000','74','分组_12','GROUP_12','BOOLEAN','正常','','True','True','656'),(743,'1616119366000','1616119366000','107','场景色温_13','SCENECOLORTEMPERATURE_13','INTEGER','正常','','True','True','656'),(744,'1616119366000','1616119366000','99','场景色温_5','SCENECOLORTEMPERATURE_5','INTEGER','正常','','True','True','656'),(745,'1616119366000','1616119366000','114','上电色温','POWERONCOLOR','INTEGER','正常','','False','True','656'),(746,'1616119366000','1616119366000','104','场景色温_10','SCENECOLORTEMPERATURE_10','INTEGER','正常','','True','True','656'),(747,'1616119366000','1616119366000','100','场景色温_6','SCENECOLORTEMPERATURE_6','INTEGER','正常','','True','True','656'),(748,'1616119366000','1616119366000','111','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常','','False','True','656'),(749,'1616119366000','1616119366000','73','分组_11','GROUP_11','BOOLEAN','正常','','True','True','656'),(750,'1616119366000','1616119366000','69','分组_7','GROUP_7','BOOLEAN','正常','','True','True','656'),(751,'1616119366000','1616119366000','91','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常','','True','True','656'),(752,'1616119366000','1616119366000','94','场景色温_0','SCENECOLORTEMPERATURE_0','INTEGER','正常','','True','True','656'),(753,'1616119366000','1616119524000','122','随机地址','RANDOMADDRESS','STRING','正常','000000','True','True','656'),(754,'1616119366000','1616119366000','79','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常','','True','True','656'),(755,'1616119366000','1616119366000','65','分组_3','GROUP_3','BOOLEAN','正常','','True','True','656'),(756,'1616119366000','1616119366000','116','调光渐变速率','FADERATE','INTEGER','正常','','False','True','656'),(757,'1616119366000','1616119366000','76','分组_14','GROUP_14','BOOLEAN','正常','','True','True','656'),(758,'1616119366000','1616119366000','103','场景色温_9','SCENECOLORTEMPERATURE_9','INTEGER','正常','','True','True','656'),(759,'1616119366000','1616119366000','110','上电功率等级','POWERONLEVEL','INTEGER','正常','','False','True','656'),(760,'1616119366000','1616119366000','68','分组_6','GROUP_6','BOOLEAN','正常','','True','True','656'),(761,'1616119366000','1619060897000','62','分组_0','GROUP_0','BOOLEAN','正常','True','True','True','656'),(762,'1616119366000','1616119366000','101','场景色温_7','SCENECOLORTEMPERATURE_7','INTEGER','正常','','True','True','656'),(763,'1616119366000','1616119366000','89','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常','','True','True','656'),(764,'1616119366000','1616119524000','121','DTR','DTR','INTEGER','正常','0','True','True','656'),(765,'1616119366000','1616119366000','109','场景色温_15','SCENECOLORTEMPERATURE_15','INTEGER','正常','','True','True','656'),(766,'1616119366000','1616119366000','83','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常','','True','True','656'),(767,'1616119366000','1616119366000','92','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常','','True','True','656'),(768,'1616119366000','1616119366000','78','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常','','True','True','656'),(769,'1616119366000','1616119366000','81','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常','','True','True','656'),(770,'1616119366000','1616119366000','70','分组_8','GROUP_8','BOOLEAN','正常','','True','True','656'),(771,'1616119366000','1616119366000','112','最大功率','MAXLEVEL','INTEGER','正常','','False','True','656'),(772,'1616119366000','1616119366000','77','分组_15','GROUP_15','BOOLEAN','正常','','True','True','656'),(773,'1616119366000','1616119366000','97','场景色温_3','SCENECOLORTEMPERATURE_3','INTEGER','正常','','True','True','656'),(774,'1616119366000','1616119366000','93','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常','','True','True','656'),(775,'1616119366000','1616119366000','67','分组_5','GROUP_5','BOOLEAN','正常','','True','True','656'),(776,'1616119366000','1616119366000','106','场景色温_12','SCENECOLORTEMPERATURE_12','INTEGER','正常','','True','True','656'),(777,'1616119366000','1616119366000','82','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常','','True','True','656'),(778,'1616119366000','1616119366000','118','光通量','LUMINOUSFLUX','INTEGER','正常','','False','True','656'),(779,'1616119366000','1616119366000','87','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常','','True','True','656'),(780,'1616119366000','1616119366000','115','系统故障色温','SYSTEMFAILURECOLOR','INTEGER','正常','','False','True','656'),(781,'1616119366000','1616119366000','98','场景色温_4','SCENECOLORTEMPERATURE_4','INTEGER','正常','','True','True','656'),(782,'1616119366000','1616119366000','119','光照面积','IRRADIATIONAREA','FLOAT','正常','','False','True','656'),(817,'1617345456000','1617345456000','213','漏电动作值','ERRLEAKVALUE','INTEGER','正常','','False','True','673'),(818,'1617345456000','1617345456000','210','过压值','OVER','INTEGER','正常','','False','True','673'),(819,'1617345456000','1617345456000','209','欠压值','UNDER','INTEGER','正常','','False','True','673'),(820,'1617345456000','1617345456000','212','漏电预警值','LEAKVALUE','INTEGER','正常','','False','True','673'),(821,'1617345456000','1617345456000','211','最大电流','MAX','INTEGER','正常','','False','True','673'),(822,'1617345456000','1617345456000','214','禁用物理开关','ENABLESWITCH','BOOLEAN','正常','0','True','True','673'),(1248,'1618536738000','1618536738000','105','场景色温_11','SCENECOLORTEMPERATURE_11','INTEGER','正常','','True','True','705'),(1249,'1618536738000','1618538806000','120','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','True','True','705'),(1250,'1618536738000','1618536738000','110','上电功率等级','POWERONLEVEL','INTEGER','正常','','False','True','705'),(1251,'1618536738000','1618538806000','121','DTR','DTR','INTEGER','正常','0','True','True','705'),(1252,'1618536738000','1618536738000','63','分组_1','GROUP_1','BOOLEAN','正常','','True','True','705'),(1253,'1618536738000','1618536738000','87','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常','','True','True','705'),(1254,'1618536738000','1618536738000','96','场景色温_2','SCENECOLORTEMPERATURE_2','INTEGER','正常','','True','True','705'),(1255,'1618536738000','1618536738000','88','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常','','True','True','705'),(1256,'1618536738000','1618536738000','85','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常','','True','True','705'),(1257,'1618536738000','1618536738000','67','分组_5','GROUP_5','BOOLEAN','正常','','True','True','705'),(1258,'1618536738000','1618536738000','95','场景色温_1','SCENECOLORTEMPERATURE_1','INTEGER','正常','','True','True','705'),(1259,'1618536738000','1618536738000','89','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常','','True','True','705'),(1260,'1618536738000','1618536738000','114','上电色温','POWERONCOLOR','INTEGER','正常','','False','True','705'),(1261,'1618536738000','1618536738000','99','场景色温_5','SCENECOLORTEMPERATURE_5','INTEGER','正常','','True','True','705'),(1262,'1618536738000','1618536738000','106','场景色温_12','SCENECOLORTEMPERATURE_12','INTEGER','正常','','True','True','705'),(1263,'1618536738000','1618536738000','116','调光渐变速率','FADERATE','INTEGER','正常','','False','True','705'),(1264,'1618536738000','1618536738000','119','光照面积','IRRADIATIONAREA','FLOAT','正常','','False','True','705'),(1265,'1618536738000','1618536738000','86','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常','','True','True','705'),(1266,'1618536738000','1618536738000','111','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常','','False','True','705'),(1267,'1618536738000','1618536738000','68','分组_6','GROUP_6','BOOLEAN','正常','','True','True','705'),(1268,'1618536738000','1618538806000','122','随机地址','RANDOMADDRESS','STRING','正常','000000','True','True','705'),(1269,'1618536738000','1618536738000','104','场景色温_10','SCENECOLORTEMPERATURE_10','INTEGER','正常','','True','True','705'),(1270,'1618536738000','1618536738000','76','分组_14','GROUP_14','BOOLEAN','正常','','True','True','705'),(1271,'1618536738000','1618536738000','79','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常','','True','True','705'),(1272,'1618536738000','1618536738000','107','场景色温_13','SCENECOLORTEMPERATURE_13','INTEGER','正常','','True','True','705'),(1273,'1618536738000','1618536738000','83','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常','','True','True','705'),(1274,'1618536738000','1618536738000','69','分组_7','GROUP_7','BOOLEAN','正常','','True','True','705'),(1275,'1618536738000','1618536738000','113','最小功率','MINLEVEL','INTEGER','正常','','False','True','705'),(1276,'1618536738000','1618536738000','100','场景色温_6','SCENECOLORTEMPERATURE_6','INTEGER','正常','','True','True','705'),(1277,'1618536738000','1618536738000','91','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常','','True','True','705'),(1278,'1618536738000','1618536738000','73','分组_11','GROUP_11','BOOLEAN','正常','','True','True','705'),(1279,'1618536738000','1618536738000','102','场景色温_8','SCENECOLORTEMPERATURE_8','INTEGER','正常','','True','True','705'),(1280,'1618536738000','1618536738000','72','分组_10','GROUP_10','BOOLEAN','正常','','True','True','705'),(1281,'1618536738000','1618536738000','84','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常','','True','True','705'),(1282,'1618536738000','1618536738000','65','分组_3','GROUP_3','BOOLEAN','正常','','True','True','705'),(1283,'1618536738000','1618536738000','109','场景色温_15','SCENECOLORTEMPERATURE_15','INTEGER','正常','','True','True','705'),(1284,'1618536738000','1618536738000','74','分组_12','GROUP_12','BOOLEAN','正常','','True','True','705'),(1285,'1618536738000','1618536738000','71','分组_9','GROUP_9','BOOLEAN','正常','','True','True','705'),(1286,'1618536738000','1618536738000','115','系统故障色温','SYSTEMFAILURECOLOR','INTEGER','正常','','False','True','705'),(1287,'1618536738000','1618538806000','94','场景色温_0','SCENECOLORTEMPERATURE_0','INTEGER','正常','65535','True','True','705'),(1288,'1618536738000','1618536738000','66','分组_4','GROUP_4','BOOLEAN','正常','','True','True','705'),(1289,'1618536738000','1618536738000','101','场景色温_7','SCENECOLORTEMPERATURE_7','INTEGER','正常','','True','True','705'),(1290,'1618536738000','1618536738000','82','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常','','True','True','705'),(1291,'1618536738000','1618536738000','64','分组_2','GROUP_2','BOOLEAN','正常','','True','True','705'),(1292,'1618536738000','1618536738000','75','分组_13','GROUP_13','BOOLEAN','正常','','True','True','705'),(1293,'1618536738000','1618536738000','77','分组_15','GROUP_15','BOOLEAN','正常','','True','True','705'),(1294,'1618536738000','1618536738000','90','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常','','True','True','705'),(1295,'1618536738000','1618536738000','81','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常','','True','True','705'),(1296,'1618536738000','1618536738000','70','分组_8','GROUP_8','BOOLEAN','正常','','True','True','705'),(1297,'1618536738000','1618536738000','103','场景色温_9','SCENECOLORTEMPERATURE_9','INTEGER','正常','','True','True','705'),(1298,'1618536738000','1618539931000','78','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常','0','True','True','705'),(1299,'1618536738000','1618536738000','62','分组_0','GROUP_0','BOOLEAN','正常','','True','True','705'),(1300,'1618536738000','1618536738000','92','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常','','True','True','705'),(1301,'1618536738000','1618536738000','97','场景色温_3','SCENECOLORTEMPERATURE_3','INTEGER','正常','','True','True','705'),(1302,'1618536738000','1618536738000','80','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常','','True','True','705'),(1303,'1618536738000','1618536738000','118','光通量','LUMINOUSFLUX','INTEGER','正常','','False','True','705'),(1304,'1618536738000','1618536738000','108','场景色温_14','SCENECOLORTEMPERATURE_14','INTEGER','正常','','True','True','705'),(1305,'1618536738000','1618536738000','93','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常','','True','True','705'),(1306,'1618536738000','1618536738000','98','场景色温_4','SCENECOLORTEMPERATURE_4','INTEGER','正常','','True','True','705'),(1307,'1618536738000','1618536738000','112','最大功率','MAXLEVEL','INTEGER','正常','','False','True','705'),(1308,'1618536738000','1618536738000','117','功率及场景渐变时间','FADETIME','INTEGER','正常','','False','True','705'),(1309,'1618537436000','1618537436000','256','分组_1','GROUP_1','BOOLEAN','正常','','True','True','706'),(1310,'1618537436000','1618537436000','292','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','True','True','706'),(1311,'1618537436000','1618537436000','261','分组_6','GROUP_6','BOOLEAN','正常','','True','True','706'),(1312,'1618537436000','1618537436000','264','分组_9','GROUP_9','BOOLEAN','正常','','True','True','706'),(1313,'1618537436000','1618537436000','255','分组_0','GROUP_0','BOOLEAN','正常','','True','True','706'),(1314,'1618537436000','1618537436000','286','场景位置_15','SCENEPOSITION_15','INTEGER','正常','','True','True','706'),(1315,'1618537436000','1618537436000','285','场景位置_14','SCENEPOSITION_14','INTEGER','正常','','True','True','706'),(1316,'1618537436000','1618537436000','273','场景位置_2','SCENEPOSITION_2','INTEGER','正常','','True','True','706'),(1317,'1618537436000','1618537436000','258','分组_3','GROUP_3','BOOLEAN','正常','','True','True','706'),(1318,'1618537436000','1618537436000','257','分组_2','GROUP_2','BOOLEAN','正常','','True','True','706'),(1319,'1618537436000','1618537436000','260','分组_5','GROUP_5','BOOLEAN','正常','','True','True','706'),(1320,'1618537436000','1618537436000','284','场景位置_13','SCENEPOSITION_13','INTEGER','正常','','True','True','706'),(1321,'1618537436000','1618537436000','271','场景位置_0','SCENEPOSITION_0','INTEGER','正常','','True','True','706'),(1322,'1618537436000','1618537436000','269','分组_14','GROUP_14','BOOLEAN','正常','','True','True','706'),(1323,'1618537436000','1618537436000','277','场景位置_6','SCENEPOSITION_6','INTEGER','正常','','True','True','706'),(1324,'1618537436000','1618537436000','290','下行（关闭）时间','CLOSETIME','INTEGER','正常','','False','True','706'),(1325,'1618537436000','1618537436000','263','分组_8','GROUP_8','BOOLEAN','正常','','True','True','706'),(1326,'1618537436000','1618537436000','278','场景位置_7','SCENEPOSITION_7','INTEGER','正常','','True','True','706'),(1327,'1618537436000','1618537436000','279','场景位置_8','SCENEPOSITION_8','INTEGER','正常','','True','True','706'),(1328,'1618537436000','1618537436000','266','分组_11','GROUP_11','BOOLEAN','正常','','True','True','706'),(1329,'1618537436000','1618537436000','268','分组_13','GROUP_13','BOOLEAN','正常','','True','True','706'),(1330,'1618537436000','1618537436000','262','分组_7','GROUP_7','BOOLEAN','正常','','True','True','706'),(1331,'1618537436000','1618537436000','275','场景位置_4','SCENEPOSITION_4','INTEGER','正常','','True','True','706'),(1332,'1618537436000','1618537436000','291','上下行时间差','TIMEDIFFERENCEOFUPANDDOWN','INTEGER','正常','','False','True','706'),(1333,'1618537436000','1618537436000','294','随机地址','RANDOMADDRESS','STRING','正常','000000','True','True','706'),(1334,'1618537436000','1618537436000','272','场景位置_1','SCENEPOSITION_1','INTEGER','正常','','True','True','706'),(1335,'1618537436000','1618537436000','281','场景位置_10','SCENEPOSITION_10','INTEGER','正常','','True','True','706'),(1336,'1618537436000','1618537436000','280','场景位置_9','SCENEPOSITION_9','INTEGER','正常','','True','True','706'),(1337,'1618537436000','1618537436000','288','系统故障行程位置','SYSTEMFAILUREDISTANCE','INTEGER','正常','','False','True','706'),(1338,'1618537436000','1618537436000','259','分组_4','GROUP_4','BOOLEAN','正常','','True','True','706'),(1339,'1618537436000','1618537436000','293','DTR','DTR','INTEGER','正常','0','True','True','706'),(1340,'1618537436000','1618537436000','287','上电行程位置','POWERONDISTANCE','INTEGER','正常','','False','True','706'),(1341,'1618537436000','1618537436000','274','场景位置_3','SCENEPOSITION_3','INTEGER','正常','','True','True','706'),(1342,'1618537436000','1618537436000','289','单步形成/总行程','ONESTEP/TOTAL','INTEGER','正常','','False','True','706'),(1343,'1618537436000','1618537436000','283','场景位置_12','SCENEPOSITION_12','INTEGER','正常','','True','True','706'),(1344,'1618537436000','1618537436000','276','场景位置_5','SCENEPOSITION_5','INTEGER','正常','','True','True','706'),(1345,'1618537436000','1618537436000','282','场景位置_11','SCENEPOSITION_11','INTEGER','正常','','True','True','706'),(1346,'1618537436000','1618537436000','270','分组_15','GROUP_15','BOOLEAN','正常','','True','True','706'),(1347,'1618537436000','1618537436000','265','分组_10','GROUP_10','BOOLEAN','正常','','True','True','706'),(1348,'1618537436000','1618537436000','267','分组_12','GROUP_12','BOOLEAN','正常','','True','True','706'),(1353,'1618971650000','1619424946000','575','无人指令','NOBODYCOMMAND','STRING','正常','ALL##GoToScene2','False','True','711'),(1354,'1618971650000','1619424946000','574','移动指令','MOTIONCOMMAND','STRING','正常','ALL##GoToScene3','False','True','711'),(1355,'1619491491000','1619677813000','572','感应范围','SENSINGRANGE','INTEGER','正常','100','False','True','718'),(1356,'1619491491000','1619678582000','573','LED指示灯','LEDINDICATOR','BOOLEAN','正常','true','False','True','718');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertylibrary`
--

DROP TABLE IF EXISTS `propertylibrary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertylibrary` (
  `id` int(11) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `deviceLibraryId` varchar(255) DEFAULT NULL,
  `propertyDescription` varchar(255) DEFAULT NULL,
  `propertyName` varchar(255) DEFAULT NULL,
  `propertyType` varchar(255) DEFAULT NULL,
  `propertyState` varchar(255) DEFAULT NULL,
  `defaultValue` varchar(255) DEFAULT NULL,
  `hasDefault` varchar(255) DEFAULT NULL,
  `readOnly` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertylibrary`
--

LOCK TABLES `propertylibrary` WRITE;
/*!40000 ALTER TABLE `propertylibrary` DISABLE KEYS */;
INSERT INTO `propertylibrary` VALUES (1,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(2,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(3,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(4,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(5,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(6,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(7,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(8,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(9,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(10,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(11,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(12,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(13,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(14,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(15,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(16,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(17,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常',NULL,'False','True','True'),(18,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常',NULL,'False','True','True'),(19,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常',NULL,'False','True','True'),(20,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常',NULL,'False','True','True'),(21,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常',NULL,'False','True','True'),(22,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常',NULL,'False','True','True'),(23,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常',NULL,'False','True','True'),(24,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常',NULL,'False','True','True'),(25,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常',NULL,'False','True','True'),(26,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常',NULL,'False','True','True'),(27,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常',NULL,'False','True','True'),(28,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常',NULL,'False','True','True'),(29,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常',NULL,'False','True','True'),(30,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常',NULL,'False','True','True'),(31,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常',NULL,'False','True','True'),(32,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常',NULL,'False','True','True'),(33,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_0','SCENECOLORTEMPERATURE_0','INTEGER','正常',NULL,'False','True','True'),(34,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_1','SCENECOLORTEMPERATURE_1','INTEGER','正常',NULL,'False','True','True'),(35,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_2','SCENECOLORTEMPERATURE_2','INTEGER','正常',NULL,'False','True','True'),(36,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_3','SCENECOLORTEMPERATURE_3','INTEGER','正常',NULL,'False','True','True'),(37,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_4','SCENECOLORTEMPERATURE_4','INTEGER','正常',NULL,'False','True','True'),(38,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_5','SCENECOLORTEMPERATURE_5','INTEGER','正常',NULL,'False','True','True'),(39,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_6','SCENECOLORTEMPERATURE_6','INTEGER','正常',NULL,'False','True','True'),(40,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_7','SCENECOLORTEMPERATURE_7','INTEGER','正常',NULL,'False','True','True'),(41,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_8','SCENECOLORTEMPERATURE_8','INTEGER','正常',NULL,'False','True','True'),(42,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_9','SCENECOLORTEMPERATURE_9','INTEGER','正常',NULL,'False','True','True'),(43,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_10','SCENECOLORTEMPERATURE_10','INTEGER','正常',NULL,'False','True','True'),(44,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_11','SCENECOLORTEMPERATURE_11','INTEGER','正常',NULL,'False','True','True'),(45,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_12','SCENECOLORTEMPERATURE_12','INTEGER','正常',NULL,'False','True','True'),(46,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_13','SCENECOLORTEMPERATURE_13','INTEGER','正常',NULL,'False','True','True'),(47,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_14','SCENECOLORTEMPERATURE_14','INTEGER','正常',NULL,'False','True','True'),(48,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','场景色温_15','SCENECOLORTEMPERATURE_15','INTEGER','正常',NULL,'False','True','True'),(49,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','上电功率等级','POWERONLEVEL','INTEGER','正常',NULL,'False','True','True'),(50,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常',NULL,'False','True','True'),(51,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','最大功率','MAXLEVEL','INTEGER','正常',NULL,'False','True','True'),(52,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','最小功率','MINLEVEL','INTEGER','正常',NULL,'False','True','True'),(53,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','上电色温','POWERONCOLOR','INTEGER','正常',NULL,'False','True','True'),(54,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','系统故障色温','SYSTEMFAILURECOLOR','INTEGER','正常',NULL,'False','True','True'),(55,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','调光渐变速率','FADERATE','INTEGER','正常',NULL,'False','True','True'),(56,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','功率及场景渐变时间','FADETIME','INTEGER','正常',NULL,'False','True','True'),(57,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','光通量','LUMINOUSFLUX','INTEGER','正常',NULL,'False','True','True'),(58,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','光照面积','IRRADIATIONAREA','FLOAT','正常',NULL,'False','True','True'),(59,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(60,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','DTR','DTR','INTEGER','正常','0','False','True','True'),(61,'2021-02-23 14:05:57','2021-02-23 14:06:00','1','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(62,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(63,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(64,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(65,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(66,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(67,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(68,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(69,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(70,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(71,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(72,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(73,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(74,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(75,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(76,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(77,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(78,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常',NULL,'False','True','True'),(79,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常',NULL,'False','True','True'),(80,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常',NULL,'False','True','True'),(81,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常',NULL,'False','True','True'),(82,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常',NULL,'False','True','True'),(83,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常',NULL,'False','True','True'),(84,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常',NULL,'False','True','True'),(85,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常',NULL,'False','True','True'),(86,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常',NULL,'False','True','True'),(87,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常',NULL,'False','True','True'),(88,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常',NULL,'False','True','True'),(89,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常',NULL,'False','True','True'),(90,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常',NULL,'False','True','True'),(91,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常',NULL,'False','True','True'),(92,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常',NULL,'False','True','True'),(93,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常',NULL,'False','True','True'),(94,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_0','SCENECOLORTEMPERATURE_0','INTEGER','正常',NULL,'False','True','True'),(95,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_1','SCENECOLORTEMPERATURE_1','INTEGER','正常',NULL,'False','True','True'),(96,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_2','SCENECOLORTEMPERATURE_2','INTEGER','正常',NULL,'False','True','True'),(97,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_3','SCENECOLORTEMPERATURE_3','INTEGER','正常',NULL,'False','True','True'),(98,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_4','SCENECOLORTEMPERATURE_4','INTEGER','正常',NULL,'False','True','True'),(99,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_5','SCENECOLORTEMPERATURE_5','INTEGER','正常',NULL,'False','True','True'),(100,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_6','SCENECOLORTEMPERATURE_6','INTEGER','正常',NULL,'False','True','True'),(101,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_7','SCENECOLORTEMPERATURE_7','INTEGER','正常',NULL,'False','True','True'),(102,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_8','SCENECOLORTEMPERATURE_8','INTEGER','正常',NULL,'False','True','True'),(103,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_9','SCENECOLORTEMPERATURE_9','INTEGER','正常',NULL,'False','True','True'),(104,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_10','SCENECOLORTEMPERATURE_10','INTEGER','正常',NULL,'False','True','True'),(105,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_11','SCENECOLORTEMPERATURE_11','INTEGER','正常',NULL,'False','True','True'),(106,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_12','SCENECOLORTEMPERATURE_12','INTEGER','正常',NULL,'False','True','True'),(107,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_13','SCENECOLORTEMPERATURE_13','INTEGER','正常',NULL,'False','True','True'),(108,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_14','SCENECOLORTEMPERATURE_14','INTEGER','正常',NULL,'False','True','True'),(109,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','场景色温_15','SCENECOLORTEMPERATURE_15','INTEGER','正常',NULL,'False','True','True'),(110,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','上电功率等级','POWERONLEVEL','INTEGER','正常',NULL,'False','True','True'),(111,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常',NULL,'False','True','True'),(112,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','最大功率','MAXLEVEL','INTEGER','正常',NULL,'False','True','True'),(113,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','最小功率','MINLEVEL','INTEGER','正常',NULL,'False','True','True'),(114,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','上电色温','POWERONCOLOR','INTEGER','正常',NULL,'False','True','True'),(115,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','系统故障色温','SYSTEMFAILURECOLOR','INTEGER','正常',NULL,'False','True','True'),(116,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','调光渐变速率','FADERATE','INTEGER','正常',NULL,'False','True','True'),(117,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','功率及场景渐变时间','FADETIME','INTEGER','正常',NULL,'False','True','True'),(118,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','光通量','LUMINOUSFLUX','INTEGER','正常',NULL,'False','True','True'),(119,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','光照面积','IRRADIATIONAREA','FLOAT','正常',NULL,'False','True','True'),(120,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(121,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','DTR','DTR','INTEGER','正常','0','False','True','True'),(122,'2021-02-23 14:05:57','2021-02-23 14:06:00','2','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(123,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(124,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(125,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(126,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(127,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(128,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(129,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(130,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(131,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(132,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(133,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(134,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(135,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(136,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(137,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(138,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(139,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常',NULL,'False','True','True'),(140,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常',NULL,'False','True','True'),(141,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常',NULL,'False','True','True'),(142,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常',NULL,'False','True','True'),(143,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常',NULL,'False','True','True'),(144,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常',NULL,'False','True','True'),(145,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常',NULL,'False','True','True'),(146,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常',NULL,'False','True','True'),(147,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常',NULL,'False','True','True'),(148,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常',NULL,'False','True','True'),(149,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常',NULL,'False','True','True'),(150,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常',NULL,'False','True','True'),(151,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常',NULL,'False','True','True'),(152,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常',NULL,'False','True','True'),(153,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常',NULL,'False','True','True'),(154,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常',NULL,'False','True','True'),(155,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','上电功率等级','POWERONLEVEL','INTEGER','正常',NULL,'False','True','True'),(156,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常',NULL,'False','True','True'),(157,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','最大功率','MAXLEVEL','INTEGER','正常',NULL,'False','True','True'),(158,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','最小功率','MINLEVEL','INTEGER','正常',NULL,'False','True','True'),(159,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','调光渐变速率','FADERATE','INTEGER','正常',NULL,'False','True','True'),(160,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','功率及场景渐变时间','FADETIME','INTEGER','正常',NULL,'False','True','True'),(161,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','光通量','LUMINOUSFLUX','INTEGER','正常',NULL,'False','True','True'),(162,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','光照面积','IRRADIATIONAREA','FLOAT','正常',NULL,'False','True','True'),(163,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(164,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','DTR','DTR','INTEGER','正常','0','False','True','True'),(165,'2021-02-23 14:05:57','2021-02-23 14:06:00','3','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(166,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(167,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(168,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(169,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(170,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(171,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(172,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(173,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(174,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(175,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(176,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(177,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(178,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(179,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(180,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(181,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(182,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常',NULL,'False','True','True'),(183,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常',NULL,'False','True','True'),(184,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常',NULL,'False','True','True'),(185,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常',NULL,'False','True','True'),(186,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常',NULL,'False','True','True'),(187,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常',NULL,'False','True','True'),(188,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常',NULL,'False','True','True'),(189,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常',NULL,'False','True','True'),(190,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常',NULL,'False','True','True'),(191,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常',NULL,'False','True','True'),(192,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常',NULL,'False','True','True'),(193,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常',NULL,'False','True','True'),(194,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常',NULL,'False','True','True'),(195,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常',NULL,'False','True','True'),(196,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常',NULL,'False','True','True'),(197,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常',NULL,'False','True','True'),(198,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','上电功率等级','POWERONLEVEL','INTEGER','正常',NULL,'False','True','True'),(199,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常',NULL,'False','True','True'),(200,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','最大功率','MAXLEVEL','INTEGER','正常',NULL,'False','True','True'),(201,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','最小功率','MINLEVEL','INTEGER','正常',NULL,'False','True','True'),(202,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','调光渐变速率','FADERATE','INTEGER','正常',NULL,'False','True','True'),(203,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','功率及场景渐变时间','FADETIME','INTEGER','正常',NULL,'False','True','True'),(204,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','光通量','LUMINOUSFLUX','INTEGER','正常',NULL,'False','True','True'),(205,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','光照面积','IRRADIATIONAREA','FLOAT','正常',NULL,'False','True','True'),(206,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(207,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','DTR','DTR','INTEGER','正常','0','False','True','True'),(208,'2021-02-23 14:05:57','2021-02-23 14:06:00','4','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(209,'2021-02-23 14:05:57','2021-02-23 14:06:00','12','欠压值','UNDER','INTEGER','正常',NULL,'False','True','True'),(210,'2021-02-23 14:05:57','2021-02-23 14:06:00','12','过压值','OVER','INTEGER','正常',NULL,'False','True','True'),(211,'2021-02-23 14:05:57','2021-02-23 14:06:00','12','最大电流','MAX','INTEGER','正常',NULL,'False','True','True'),(212,'2021-02-23 14:05:57','2021-02-23 14:06:00','12','漏电预警值','LEAKVALUE','INTEGER','正常',NULL,'False','True','True'),(213,'2021-02-23 14:05:57','2021-02-23 14:06:00','12','漏电动作值','ERRLEAKVALUE','INTEGER','正常',NULL,'False','True','True'),(214,'2021-02-23 14:05:57','2021-02-23 14:06:00','12','禁用物理开关','ENABLESWITCH','BOOLEAN','正常','0','False','True','True'),(215,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(216,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(217,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(218,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(219,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(220,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(221,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(222,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(223,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(224,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(225,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(226,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(227,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(228,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(229,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(230,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(231,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_0','SCENEPOSITION_0','INTEGER','正常',NULL,'False','True','True'),(232,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_1','SCENEPOSITION_1','INTEGER','正常',NULL,'False','True','True'),(233,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_2','SCENEPOSITION_2','INTEGER','正常',NULL,'False','True','True'),(234,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_3','SCENEPOSITION_3','INTEGER','正常',NULL,'False','True','True'),(235,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_4','SCENEPOSITION_4','INTEGER','正常',NULL,'False','True','True'),(236,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_5','SCENEPOSITION_5','INTEGER','正常',NULL,'False','True','True'),(237,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_6','SCENEPOSITION_6','INTEGER','正常',NULL,'False','True','True'),(238,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_7','SCENEPOSITION_7','INTEGER','正常',NULL,'False','True','True'),(239,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_8','SCENEPOSITION_8','INTEGER','正常',NULL,'False','True','True'),(240,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_9','SCENEPOSITION_9','INTEGER','正常',NULL,'False','True','True'),(241,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_10','SCENEPOSITION_10','INTEGER','正常',NULL,'False','True','True'),(242,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_11','SCENEPOSITION_11','INTEGER','正常',NULL,'False','True','True'),(243,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_12','SCENEPOSITION_12','INTEGER','正常',NULL,'False','True','True'),(244,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_13','SCENEPOSITION_13','INTEGER','正常',NULL,'False','True','True'),(245,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_14','SCENEPOSITION_14','INTEGER','正常',NULL,'False','True','True'),(246,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','场景位置_15','SCENEPOSITION_15','INTEGER','正常',NULL,'False','True','True'),(247,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','上电行程位置','POWERONDISTANCE','INTEGER','正常',NULL,'False','True','True'),(248,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','系统故障行程位置','SYSTEMFAILUREDISTANCE','INTEGER','正常',NULL,'False','True','True'),(249,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','单步形成/总行程','ONESTEP/TOTAL','INTEGER','正常',NULL,'False','True','True'),(250,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','下行（关闭）时间','CLOSETIME','INTEGER','正常',NULL,'False','True','True'),(251,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','上下行时间差','TIMEDIFFERENCEOFUPANDDOWN','INTEGER','正常',NULL,'False','True','True'),(252,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(253,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','DTR','DTR','INTEGER','正常','0','False','True','True'),(254,'2021-02-23 14:05:57','2021-02-23 14:06:00','16','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(255,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(256,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(257,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(258,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(259,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(260,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(261,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(262,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(263,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(264,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(265,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(266,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(267,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(268,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(269,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(270,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(271,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_0','SCENEPOSITION_0','INTEGER','正常',NULL,'False','True','True'),(272,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_1','SCENEPOSITION_1','INTEGER','正常',NULL,'False','True','True'),(273,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_2','SCENEPOSITION_2','INTEGER','正常',NULL,'False','True','True'),(274,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_3','SCENEPOSITION_3','INTEGER','正常',NULL,'False','True','True'),(275,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_4','SCENEPOSITION_4','INTEGER','正常',NULL,'False','True','True'),(276,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_5','SCENEPOSITION_5','INTEGER','正常',NULL,'False','True','True'),(277,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_6','SCENEPOSITION_6','INTEGER','正常',NULL,'False','True','True'),(278,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_7','SCENEPOSITION_7','INTEGER','正常',NULL,'False','True','True'),(279,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_8','SCENEPOSITION_8','INTEGER','正常',NULL,'False','True','True'),(280,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_9','SCENEPOSITION_9','INTEGER','正常',NULL,'False','True','True'),(281,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_10','SCENEPOSITION_10','INTEGER','正常',NULL,'False','True','True'),(282,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_11','SCENEPOSITION_11','INTEGER','正常',NULL,'False','True','True'),(283,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_12','SCENEPOSITION_12','INTEGER','正常',NULL,'False','True','True'),(284,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_13','SCENEPOSITION_13','INTEGER','正常',NULL,'False','True','True'),(285,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_14','SCENEPOSITION_14','INTEGER','正常',NULL,'False','True','True'),(286,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','场景位置_15','SCENEPOSITION_15','INTEGER','正常',NULL,'False','True','True'),(287,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','上电行程位置','POWERONDISTANCE','INTEGER','正常',NULL,'False','True','True'),(288,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','系统故障行程位置','SYSTEMFAILUREDISTANCE','INTEGER','正常',NULL,'False','True','True'),(289,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','单步形成/总行程','ONESTEP/TOTAL','INTEGER','正常',NULL,'False','True','True'),(290,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','下行（关闭）时间','CLOSETIME','INTEGER','正常',NULL,'False','True','True'),(291,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','上下行时间差','TIMEDIFFERENCEOFUPANDDOWN','INTEGER','正常',NULL,'False','True','True'),(292,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(293,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','DTR','DTR','INTEGER','正常','0','False','True','True'),(294,'2021-02-23 14:05:57','2021-02-23 14:06:00','17','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(295,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(296,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(297,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(298,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(299,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(300,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(301,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(302,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(303,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(304,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(305,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(306,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(307,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(308,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(309,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(310,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(311,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_0','SCENEPOSITION_0','INTEGER','正常',NULL,'False','True','True'),(312,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_1','SCENEPOSITION_1','INTEGER','正常',NULL,'False','True','True'),(313,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_2','SCENEPOSITION_2','INTEGER','正常',NULL,'False','True','True'),(314,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_3','SCENEPOSITION_3','INTEGER','正常',NULL,'False','True','True'),(315,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_4','SCENEPOSITION_4','INTEGER','正常',NULL,'False','True','True'),(316,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_5','SCENEPOSITION_5','INTEGER','正常',NULL,'False','True','True'),(317,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_6','SCENEPOSITION_6','INTEGER','正常',NULL,'False','True','True'),(318,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_7','SCENEPOSITION_7','INTEGER','正常',NULL,'False','True','True'),(319,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_8','SCENEPOSITION_8','INTEGER','正常',NULL,'False','True','True'),(320,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_9','SCENEPOSITION_9','INTEGER','正常',NULL,'False','True','True'),(321,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_10','SCENEPOSITION_10','INTEGER','正常',NULL,'False','True','True'),(322,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_11','SCENEPOSITION_11','INTEGER','正常',NULL,'False','True','True'),(323,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_12','SCENEPOSITION_12','INTEGER','正常',NULL,'False','True','True'),(324,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_13','SCENEPOSITION_13','INTEGER','正常',NULL,'False','True','True'),(325,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_14','SCENEPOSITION_14','INTEGER','正常',NULL,'False','True','True'),(326,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','场景位置_15','SCENEPOSITION_15','INTEGER','正常',NULL,'False','True','True'),(327,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','上电行程位置','POWERONDISTANCE','INTEGER','正常',NULL,'False','True','True'),(328,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','系统故障行程位置','SYSTEMFAILUREDISTANCE','INTEGER','正常',NULL,'False','True','True'),(329,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','单步形成/总行程','ONESTEP/TOTAL','INTEGER','正常',NULL,'False','True','True'),(330,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','下行（关闭）时间','CLOSETIME','INTEGER','正常',NULL,'False','True','True'),(331,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','上下行时间差','TIMEDIFFERENCEOFUPANDDOWN','INTEGER','正常',NULL,'False','True','True'),(332,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(333,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','DTR','DTR','INTEGER','正常','0','False','True','True'),(334,'2021-02-23 14:05:57','2021-02-23 14:06:00','18','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(335,'2021-02-23 14:05:57','2021-02-23 14:06:00','22','告警声音模式','ALARMSOUNDMODE','INTEGER','正常',NULL,'False','True','True'),(336,'2021-02-23 14:05:57','2021-02-23 14:06:00','22','布撤防计划','DEFENCEPLAN','INTEGER','正常',NULL,'False','True','True'),(337,'2021-02-23 14:05:57','2021-02-23 14:06:00','22','视频加密','ENCRYPT','INTEGER','正常',NULL,'False','True','True'),(338,'2021-02-23 14:05:57','2021-02-23 14:06:00','22','全天录制','FULLDAYRECORD','INTEGER','正常',NULL,'False','True','True'),(339,'2021-02-23 14:05:57','2021-02-23 14:06:00','22','摄像机指示灯','LIGHT','INTEGER','正常',NULL,'False','True','True'),(340,'2021-02-23 14:05:57','2021-02-23 14:06:00','22','麦克风开关','MICROPHONE','INTEGER','正常',NULL,'False','True','True'),(341,'2021-02-23 14:05:57','2021-02-23 14:06:00','22','移动跟踪','MOBILE','INTEGER','正常',NULL,'False','True','True'),(342,'2021-02-23 14:05:57','2021-02-23 14:06:00','22','移动侦测灵敏度调节','SENSITIVE','INTEGER','正常',NULL,'False','True','True'),(343,'2021-02-23 14:05:57','2021-02-23 14:06:00','22','Wi-Fi配置/设备启动提示音','SOUND','INTEGER','正常',NULL,'False','True','True'),(344,'2021-02-23 14:05:57','2021-02-23 14:06:00','22','智能检测','INTELLIGENCE','INTEGER','正常',NULL,'False','True','True'),(345,'2021-02-23 14:05:57','2021-02-23 14:06:00','23','告警声音模式','ALARMSOUNDMODE','INTEGER','正常',NULL,'False','True','True'),(346,'2021-02-23 14:05:57','2021-02-23 14:06:00','23','布撤防计划','DEFENCEPLAN','INTEGER','正常',NULL,'False','True','True'),(347,'2021-02-23 14:05:57','2021-02-23 14:06:00','23','视频加密','ENCRYPT','INTEGER','正常',NULL,'False','True','True'),(348,'2021-02-23 14:05:57','2021-02-23 14:06:00','23','全天录制','FULLDAYRECORD','INTEGER','正常',NULL,'False','True','True'),(349,'2021-02-23 14:05:57','2021-02-23 14:06:00','23','摄像机指示灯','LIGHT','INTEGER','正常',NULL,'False','True','True'),(350,'2021-02-23 14:05:57','2021-02-23 14:06:00','23','麦克风开关','MICROPHONE','INTEGER','正常',NULL,'False','True','True'),(351,'2021-02-23 14:05:57','2021-02-23 14:06:00','23','移动侦测灵敏度调节','SENSITIVE','INTEGER','正常',NULL,'False','True','True'),(352,'2021-02-23 14:05:57','2021-02-23 14:06:00','23','智能检测','INTELLIGENCE','INTEGER','正常',NULL,'False','True','True'),(353,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(354,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(355,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(356,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(357,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(358,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(359,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(360,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(361,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(362,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(363,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(364,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(365,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(366,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(367,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(368,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(369,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常',NULL,'False','True','True'),(370,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常',NULL,'False','True','True'),(371,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常',NULL,'False','True','True'),(372,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常',NULL,'False','True','True'),(373,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常',NULL,'False','True','True'),(374,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常',NULL,'False','True','True'),(375,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常',NULL,'False','True','True'),(376,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常',NULL,'False','True','True'),(377,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常',NULL,'False','True','True'),(378,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常',NULL,'False','True','True'),(379,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常',NULL,'False','True','True'),(380,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常',NULL,'False','True','True'),(381,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常',NULL,'False','True','True'),(382,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常',NULL,'False','True','True'),(383,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常',NULL,'False','True','True'),(384,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常',NULL,'False','True','True'),(385,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','上电功率等级','POWERONLEVEL','INTEGER','正常',NULL,'False','True','True'),(386,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常',NULL,'False','True','True'),(387,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','最大功率','MAXLEVEL','INTEGER','正常',NULL,'False','True','True'),(388,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','最小功率','MINLEVEL','INTEGER','正常',NULL,'False','True','True'),(389,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','调光渐变速率','FADERATE','INTEGER','正常',NULL,'False','True','True'),(390,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','功率及场景渐变时间','FADETIME','INTEGER','正常',NULL,'False','True','True'),(391,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','光通量','LUMINOUSFLUX','INTEGER','正常',NULL,'False','True','True'),(392,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','光照面积','IRRADIATIONAREA','FLOAT','正常',NULL,'False','True','True'),(393,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(394,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','DTR','DTR','INTEGER','正常','0','False','True','True'),(395,'2021-02-23 14:05:57','2021-02-23 14:06:00','24','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(396,'2021-02-23 14:05:57','2021-02-23 14:06:00','25','高音','HIGHPITCH','INTEGER','正常',NULL,'False','True','True'),(397,'2021-02-23 14:05:57','2021-02-23 14:06:00','25','低音','BASS','INTEGER','正常',NULL,'False','True','True'),(398,'2021-02-23 14:05:57','2021-02-23 14:06:00','26','视频加密','ENCRYPT','INTEGER','正常',NULL,'False','True','True'),(399,'2021-02-23 14:05:57','2021-02-23 14:06:00','26','麦克风开关','MICROPHONE','INTEGER','正常',NULL,'False','True','True'),(400,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(401,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(402,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(403,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(404,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(405,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(406,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(407,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(408,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(409,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(410,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(411,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(412,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(413,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(414,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(415,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(416,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_0','SCENEPOSITION_0','INTEGER','正常',NULL,'False','True','True'),(417,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_1','SCENEPOSITION_1','INTEGER','正常',NULL,'False','True','True'),(418,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_2','SCENEPOSITION_2','INTEGER','正常',NULL,'False','True','True'),(419,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_3','SCENEPOSITION_3','INTEGER','正常',NULL,'False','True','True'),(420,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_4','SCENEPOSITION_4','INTEGER','正常',NULL,'False','True','True'),(421,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_5','SCENEPOSITION_5','INTEGER','正常',NULL,'False','True','True'),(422,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_6','SCENEPOSITION_6','INTEGER','正常',NULL,'False','True','True'),(423,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_7','SCENEPOSITION_7','INTEGER','正常',NULL,'False','True','True'),(424,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_8','SCENEPOSITION_8','INTEGER','正常',NULL,'False','True','True'),(425,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_9','SCENEPOSITION_9','INTEGER','正常',NULL,'False','True','True'),(426,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_10','SCENEPOSITION_10','INTEGER','正常',NULL,'False','True','True'),(427,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_11','SCENEPOSITION_11','INTEGER','正常',NULL,'False','True','True'),(428,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_12','SCENEPOSITION_12','INTEGER','正常',NULL,'False','True','True'),(429,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_13','SCENEPOSITION_13','INTEGER','正常',NULL,'False','True','True'),(430,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_14','SCENEPOSITION_14','INTEGER','正常',NULL,'False','True','True'),(431,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','场景位置_15','SCENEPOSITION_15','INTEGER','正常',NULL,'False','True','True'),(432,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','上电行程位置','POWERONDISTANCE','INTEGER','正常',NULL,'False','True','True'),(433,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','系统故障行程位置','SYSTEMFAILUREDISTANCE','INTEGER','正常',NULL,'False','True','True'),(434,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','单步形成/总行程','ONESTEP/TOTAL','INTEGER','正常',NULL,'False','True','True'),(435,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','下行（关闭）时间','CLOSETIME','INTEGER','正常',NULL,'False','True','True'),(436,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','上下行时间差','TIMEDIFFERENCEOFUPANDDOWN','INTEGER','正常',NULL,'False','True','True'),(437,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(438,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','DTR','DTR','INTEGER','正常','0','False','True','True'),(439,'2021-02-23 14:05:57','2021-02-23 14:06:00','29','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(440,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(441,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(442,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(443,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(444,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(445,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(446,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(447,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(448,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(449,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(450,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(451,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(452,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(453,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(454,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(455,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(456,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_0','SCENEPOSITION_0','INTEGER','正常',NULL,'False','True','True'),(457,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_1','SCENEPOSITION_1','INTEGER','正常',NULL,'False','True','True'),(458,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_2','SCENEPOSITION_2','INTEGER','正常',NULL,'False','True','True'),(459,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_3','SCENEPOSITION_3','INTEGER','正常',NULL,'False','True','True'),(460,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_4','SCENEPOSITION_4','INTEGER','正常',NULL,'False','True','True'),(461,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_5','SCENEPOSITION_5','INTEGER','正常',NULL,'False','True','True'),(462,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_6','SCENEPOSITION_6','INTEGER','正常',NULL,'False','True','True'),(463,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_7','SCENEPOSITION_7','INTEGER','正常',NULL,'False','True','True'),(464,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_8','SCENEPOSITION_8','INTEGER','正常',NULL,'False','True','True'),(465,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_9','SCENEPOSITION_9','INTEGER','正常',NULL,'False','True','True'),(466,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_10','SCENEPOSITION_10','INTEGER','正常',NULL,'False','True','True'),(467,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_11','SCENEPOSITION_11','INTEGER','正常',NULL,'False','True','True'),(468,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_12','SCENEPOSITION_12','INTEGER','正常',NULL,'False','True','True'),(469,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_13','SCENEPOSITION_13','INTEGER','正常',NULL,'False','True','True'),(470,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_14','SCENEPOSITION_14','INTEGER','正常',NULL,'False','True','True'),(471,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','场景位置_15','SCENEPOSITION_15','INTEGER','正常',NULL,'False','True','True'),(472,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','上电行程位置','POWERONDISTANCE','INTEGER','正常',NULL,'False','True','True'),(473,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','系统故障行程位置','SYSTEMFAILUREDISTANCE','INTEGER','正常',NULL,'False','True','True'),(474,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','单步形成/总行程','ONESTEP/TOTAL','INTEGER','正常',NULL,'False','True','True'),(475,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','下行（关闭）时间','CLOSETIME','INTEGER','正常',NULL,'False','True','True'),(476,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','上下行时间差','TIMEDIFFERENCEOFUPANDDOWN','INTEGER','正常',NULL,'False','True','True'),(477,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(478,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','DTR','DTR','INTEGER','正常','0','False','True','True'),(479,'2021-02-23 14:05:57','2021-02-23 14:06:00','30','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(480,'2021-02-23 14:05:57','2021-02-23 14:06:00','34','欠压值','UNDER','INTEGER','正常',NULL,'False','True','True'),(481,'2021-02-23 14:05:57','2021-02-23 14:06:00','34','过压值','OVER','INTEGER','正常',NULL,'False','True','True'),(482,'2021-02-23 14:05:57','2021-02-23 14:06:00','34','最大电流','MAX','INTEGER','正常',NULL,'False','True','True'),(483,'2021-02-23 14:05:57','2021-02-23 14:06:00','34','漏电预警值','LEAKVALUE','INTEGER','正常',NULL,'False','True','True'),(484,'2021-02-23 14:05:57','2021-02-23 14:06:00','34','漏电动作值','ERRLEAKVALUE','INTEGER','正常',NULL,'False','True','True'),(485,'2021-02-23 14:05:57','2021-02-23 14:06:00','34','禁用物理开关','ENABLESWITCH','BOOLEAN','正常','0','False','True','True'),(486,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(487,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(488,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(489,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(490,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(491,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(492,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(493,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(494,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(495,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(496,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(497,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(498,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(499,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(500,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(501,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(502,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常',NULL,'False','True','True'),(503,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常',NULL,'False','True','True'),(504,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常',NULL,'False','True','True'),(505,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常',NULL,'False','True','True'),(506,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常',NULL,'False','True','True'),(507,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常',NULL,'False','True','True'),(508,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常',NULL,'False','True','True'),(509,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常',NULL,'False','True','True'),(510,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常',NULL,'False','True','True'),(511,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常',NULL,'False','True','True'),(512,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常',NULL,'False','True','True'),(513,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常',NULL,'False','True','True'),(514,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常',NULL,'False','True','True'),(515,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常',NULL,'False','True','True'),(516,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常',NULL,'False','True','True'),(517,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常',NULL,'False','True','True'),(518,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','上电功率等级','POWERONLEVEL','INTEGER','正常',NULL,'False','True','True'),(519,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常',NULL,'False','True','True'),(520,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','最大功率','MAXLEVEL','INTEGER','正常',NULL,'False','True','True'),(521,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','最小功率','MINLEVEL','INTEGER','正常',NULL,'False','True','True'),(522,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','调光渐变速率','FADERATE','INTEGER','正常',NULL,'False','True','True'),(523,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','功率及场景渐变时间','FADETIME','INTEGER','正常',NULL,'False','True','True'),(524,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','光通量','LUMINOUSFLUX','INTEGER','正常',NULL,'False','True','True'),(525,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','光照面积','IRRADIATIONAREA','FLOAT','正常',NULL,'False','True','True'),(526,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(527,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','DTR','DTR','INTEGER','正常','0','False','True','True'),(528,'2021-02-23 14:05:57','2021-02-23 14:06:00','35','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(529,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_0','GROUP_0','BOOLEAN','正常',NULL,'False','True','True'),(530,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_1','GROUP_1','BOOLEAN','正常',NULL,'False','True','True'),(531,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_2','GROUP_2','BOOLEAN','正常',NULL,'False','True','True'),(532,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_3','GROUP_3','BOOLEAN','正常',NULL,'False','True','True'),(533,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_4','GROUP_4','BOOLEAN','正常',NULL,'False','True','True'),(534,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_5','GROUP_5','BOOLEAN','正常',NULL,'False','True','True'),(535,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_6','GROUP_6','BOOLEAN','正常',NULL,'False','True','True'),(536,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_7','GROUP_7','BOOLEAN','正常',NULL,'False','True','True'),(537,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_8','GROUP_8','BOOLEAN','正常',NULL,'False','True','True'),(538,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_9','GROUP_9','BOOLEAN','正常',NULL,'False','True','True'),(539,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_10','GROUP_10','BOOLEAN','正常',NULL,'False','True','True'),(540,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_11','GROUP_11','BOOLEAN','正常',NULL,'False','True','True'),(541,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_12','GROUP_12','BOOLEAN','正常',NULL,'False','True','True'),(542,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_13','GROUP_13','BOOLEAN','正常',NULL,'False','True','True'),(543,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_14','GROUP_14','BOOLEAN','正常',NULL,'False','True','True'),(544,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','分组_15','GROUP_15','BOOLEAN','正常',NULL,'False','True','True'),(545,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_0','SCENEBRIGHTNESS_0','INTEGER','正常',NULL,'False','True','True'),(546,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_1','SCENEBRIGHTNESS_1','INTEGER','正常',NULL,'False','True','True'),(547,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_2','SCENEBRIGHTNESS_2','INTEGER','正常',NULL,'False','True','True'),(548,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_3','SCENEBRIGHTNESS_3','INTEGER','正常',NULL,'False','True','True'),(549,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_4','SCENEBRIGHTNESS_4','INTEGER','正常',NULL,'False','True','True'),(550,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_5','SCENEBRIGHTNESS_5','INTEGER','正常',NULL,'False','True','True'),(551,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_6','SCENEBRIGHTNESS_6','INTEGER','正常',NULL,'False','True','True'),(552,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_7','SCENEBRIGHTNESS_7','INTEGER','正常',NULL,'False','True','True'),(553,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_8','SCENEBRIGHTNESS_8','INTEGER','正常',NULL,'False','True','True'),(554,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_9','SCENEBRIGHTNESS_9','INTEGER','正常',NULL,'False','True','True'),(555,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_10','SCENEBRIGHTNESS_10','INTEGER','正常',NULL,'False','True','True'),(556,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_11','SCENEBRIGHTNESS_11','INTEGER','正常',NULL,'False','True','True'),(557,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_12','SCENEBRIGHTNESS_12','INTEGER','正常',NULL,'False','True','True'),(558,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_13','SCENEBRIGHTNESS_13','INTEGER','正常',NULL,'False','True','True'),(559,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_14','SCENEBRIGHTNESS_14','INTEGER','正常',NULL,'False','True','True'),(560,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','场景亮度_15','SCENEBRIGHTNESS_15','INTEGER','正常',NULL,'False','True','True'),(561,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','上电功率等级','POWERONLEVEL','INTEGER','正常',NULL,'False','True','True'),(562,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','系统故障等级','SYSTEMFAILURELEVEL','INTEGER','正常',NULL,'False','True','True'),(563,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','最大功率','MAXLEVEL','INTEGER','正常',NULL,'False','True','True'),(564,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','最小功率','MINLEVEL','INTEGER','正常',NULL,'False','True','True'),(565,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','调光渐变速率','FADERATE','INTEGER','正常',NULL,'False','True','True'),(566,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','功率及场景渐变时间','FADETIME','INTEGER','正常',NULL,'False','True','True'),(567,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','光通量','LUMINOUSFLUX','INTEGER','正常',NULL,'False','True','True'),(568,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','光照面积','IRRADIATIONAREA','FLOAT','正常',NULL,'False','True','True'),(569,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','物理最小功率等级','PHYSICALMINLEVEL','INTEGER','正常','1','False','True','True'),(570,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','DTR','DTR','INTEGER','正常','0','False','True','True'),(571,'2021-02-23 14:05:57','2021-02-23 14:06:00','36','随机地址','RANDOMADDRESS','STRING','正常','000000','False','True','True'),(572,'2021-03-22 19:25:32','2021-03-22 19:25:35','39','感应范围','SENSINGRANGE','INTEGER','正常',NULL,'False','False','True'),(573,'2021-03-22 19:27:39','2021-03-22 19:27:41','39','LED指示灯','LEDINDICATOR','BOOLEAN','正常',NULL,'False','False','True'),(574,'2021-04-20 14:00:08','2021-04-20 14:00:10','37','移动指令','MOTIONCOMMAND','STRING','正常',NULL,'False','False','True'),(575,'2021-04-20 14:00:08','2021-04-20 14:00:10','37','无人指令','NOBODYCOMMAND','STRING','正常',NULL,'False','False','True'),(576,'2021-04-20 14:00:08','2021-04-20 14:00:10','38','存在指令','EXISTENCECOMMAND','STRING','正常',NULL,'False','False','True'),(577,'2021-04-20 14:00:08','2021-04-20 14:00:10','38','无人指令','NOBODYCOMMAND','STRING','正常',NULL,'False','False','True');
/*!40000 ALTER TABLE `propertylibrary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scene`
--

DROP TABLE IF EXISTS `scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scene` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `spaceId` varchar(255) DEFAULT NULL,
  `sceneName` varchar(255) DEFAULT NULL,
  `sceneDescription` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `sceneOrder` varchar(255) DEFAULT NULL,
  `sceneIconId` varchar(255) DEFAULT NULL,
  `sceneState` varchar(255) DEFAULT NULL,
  `sceneLightingId` varchar(255) DEFAULT NULL,
  `hasLight` varchar(255) DEFAULT NULL,
  `spaceScene` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `writeDriver` varchar(255) DEFAULT NULL,
  `gatewayType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scene`
--

LOCK TABLES `scene` WRITE;
/*!40000 ALTER TABLE `scene` DISABLE KEYS */;
INSERT INTO `scene` VALUES (131,'1618537465000','1618541118000','63','关','','',NULL,'1','正常','0','True',NULL,'True','True',''),(132,'1618797383000','1619060000000','63','节律','','',NULL,'1','正常','','False',NULL,'True','False',''),(145,'1618814220000','1618882917000','63','1','','',NULL,'1','正常','1','True',NULL,'True','True',''),(147,'1618883454000','1618884933000','63','2','','',NULL,'1','正常','','True',NULL,'True','False',''),(152,'1620886667000','1620886683000','63','3','','',NULL,'1','正常','','False',NULL,'True','False','');
/*!40000 ALTER TABLE `scene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenecommand`
--

DROP TABLE IF EXISTS `scenecommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenecommand` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `actionName` varchar(255) DEFAULT NULL,
  `actionParameter1Type` varchar(255) DEFAULT NULL,
  `actionParameter2Type` varchar(255) DEFAULT NULL,
  `actionParameter3Type` varchar(255) DEFAULT NULL,
  `actionDescription` varchar(255) DEFAULT NULL,
  `sceneCommandActionType` varchar(255) DEFAULT NULL,
  `targetNaturalCycleId` varchar(255) DEFAULT NULL,
  `targetSceneId` varchar(255) DEFAULT NULL,
  `supportedActionId` varchar(255) DEFAULT NULL,
  `supportedServiceId` varchar(255) DEFAULT NULL,
  `actionExecuteType` varchar(255) DEFAULT NULL,
  `actionTimeDelay` varchar(255) DEFAULT NULL,
  `actionOrder` varchar(255) DEFAULT NULL,
  `actionParameter1` varchar(255) DEFAULT NULL,
  `actionParameter2` varchar(255) DEFAULT NULL,
  `actionParameter3` varchar(255) DEFAULT NULL,
  `effectiveDay` varchar(255) DEFAULT NULL,
  `effectiveTime` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `deviceGroupList` varchar(255) DEFAULT NULL,
  `deviceList` varchar(255) DEFAULT NULL,
  `sceneId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenecommand`
--

LOCK TABLES `scenecommand` WRITE;
/*!40000 ALTER TABLE `scenecommand` DISABLE KEYS */;
INSERT INTO `scenecommand` VALUES (237,'1618539031000','1618539916000','','BRIGHTNESSSET','INTEGER','INTEGER','INTEGER','设置亮度','DEVICE',NULL,NULL,'3','1','REALTIME','','0','0','','','ALL','ALL','True','','705,646,647','131'),(238,'1618539031000','1618541118000','','SETCURTAINANGLE','INTEGER','INTEGER','INTEGER','设置窗帘角度','DEVICE',NULL,NULL,'36','3','REALTIME','','1','10','','','ALL','ALL','True','','706','131'),(239,'1618797393000','1619060000000','','','','','','','NATURALCYCLE','21',NULL,'','','REALTIME','','0','','','','ALL','ALL','True','','','132'),(297,'1618814325000','1618882751000','','COLORTEMPERATURESET','INTEGER','INTEGER','INTEGER','设置色温','DEVICE',NULL,NULL,'6','1','REALTIME','','1','6000','','','ALL','0900,1700','True','','651','145'),(298,'1618814325000','1618882751000','','BRIGHTNESSSET','INTEGER','INTEGER','INTEGER','设置亮度','DEVICE',NULL,NULL,'3','1','REALTIME','','0','0','','','ALL','0000,0800','True','','651','145'),(304,'1618883498000','1618884929000','','TURNONLIGHT','','','','开灯','DEVICE',NULL,NULL,'1','1','REALTIME','','1','','','','ALL','1000,1500','True','','646,705,647','147'),(305,'1618883498000','1618884339000','','','','','','','SCENE',NULL,'131','','','REALTIME','','0','','','','ALL','SUNRISE,1000','True','','','147'),(306,'1618884019000','1618884265000','','BRIGHTNESSSET','INTEGER','INTEGER','INTEGER','设置亮度','DEVICE',NULL,NULL,'3','1','REALTIME','','2','10','','','ALL','1500,SUNSET','True','','647,705,646','147'),(307,'1618884265000','1618884265000','','','','','','','SCENE',NULL,'131','','','REALTIME','','3','','','','ALL','SUNSET,0000','True','','','147'),(308,'1618884265000','1618884929000','','BRIGHTNESSMIN','','','','最小亮度','DEVICE',NULL,NULL,'13','1','REALTIME','','4','','','','ALL','0000,SUNRISE','True','','647,705,646','147'),(328,'1620886683000','1620886683000','','TURNONAIRCONDITION','','','','开空调','DEVICE',NULL,NULL,'39','5','REALTIME','','0','','','','ALL','ALL','True','','723','152');
/*!40000 ALTER TABLE `scenecommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `serviceType` varchar(255) DEFAULT NULL,
  `serviceDescription` varchar(255) DEFAULT NULL,
  `serviceLibraryId` varchar(255) DEFAULT NULL,
  `serviceName` varchar(255) DEFAULT NULL,
  `serviceAddress` varchar(255) DEFAULT NULL,
  `serviceState` varchar(255) DEFAULT NULL,
  `deviceId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (656,'1615794593000','1615794593000','LIGHTING','照明','2','','','正常',646),(657,'1615862377000','1615862377000','LIGHTING','照明','2','','','正常',647),(661,'1616054038000','1616054038000','LIGHTING','照明','2','','','正常',651),(662,'1616054106000','1616054106000','LIGHTING','照明','2','','','正常',652),(666,'1616119366000','1616119366000','LIGHTING','照明','2','','','正常',656),(683,'1617345456000','1617345456000','BREAKER','断路器','14','','','正常',673),(715,'1618536738000','1618536738000','LIGHTING','照明','2','','','正常',705),(716,'1618537436000','1618537436000','CURTAIN','窗帘','19','','','正常',706),(721,'1618971650000','1618971650000','SENSOR','传感器','39','','','正常',711),(728,'1619491491000','1619491491000','SENSOR','传感器','41','','','正常',718),(733,'1620269427000','1620269427000','AIRCONDITION','空调','16','','','正常',723);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space`
--

DROP TABLE IF EXISTS `space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `space` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `spaceName` varchar(255) DEFAULT NULL,
  `spaceDescription` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `spaceOrder` varchar(255) DEFAULT NULL,
  `spaceIconId` varchar(255) DEFAULT NULL,
  `spaceArea` varchar(255) DEFAULT NULL,
  `spacePeakPower` varchar(255) DEFAULT NULL,
  `spaceAlarmPower` varchar(255) DEFAULT NULL,
  `busyPeriodStart` varchar(255) DEFAULT NULL,
  `busyPeriodEnd` varchar(255) DEFAULT NULL,
  `busyCeilPower` varchar(255) DEFAULT NULL,
  `busyFloorPower` varchar(255) DEFAULT NULL,
  `idleCeilPower` varchar(255) DEFAULT NULL,
  `idleFloorPower` varchar(255) DEFAULT NULL,
  `annualConsumptionQuota` varchar(255) DEFAULT NULL,
  `monthlyConsumptionQuota` varchar(255) DEFAULT NULL,
  `dailyConsumptionQuota` varchar(255) DEFAULT NULL,
  `regionQuotaEnabled` varchar(255) DEFAULT NULL,
  `hasPhoto` varchar(255) DEFAULT NULL,
  `root` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space`
--

LOCK TABLES `space` WRITE;
/*!40000 ALTER TABLE `space` DISABLE KEYS */;
INSERT INTO `space` VALUES (19,'1564450181000','1615174357000','我的家','','',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'False','False','True','True'),(62,'1600306879000','1616662170000','aqara设备测试空间','','一楼','1',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'False','False','False','True'),(63,'1600306896000','1620886661000','DALI设备测试空间','','二楼','2',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'False','False','False','True');
/*!40000 ALTER TABLE `space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stateevent`
--

DROP TABLE IF EXISTS `stateevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stateevent` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `entityType` varchar(255) DEFAULT NULL,
  `entityId` varchar(255) DEFAULT NULL,
  `characteristicId` varchar(255) DEFAULT NULL,
  `stateEventName` varchar(255) DEFAULT NULL,
  `stateEventDescription` varchar(255) DEFAULT NULL,
  `stateEventValueType` varchar(255) DEFAULT NULL,
  `stateEventState` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stateevent`
--

LOCK TABLES `stateevent` WRITE;
/*!40000 ALTER TABLE `stateevent` DISABLE KEYS */;
INSERT INTO `stateevent` VALUES (488,'1564450828000','1564450828000','HUB','7','','HUBSTATE','主机状态改变','','正常','True'),(489,'1564451504000','1564451504000','GATEWAY','10','','GATEWAYSTATE','网关状态改变','','正常','True'),(490,'1564451504000','1564451504000','GATEWAY','10','','DALIDIRECTIVE','DALI总线指令','','正常','True'),(1133,'1574130577000','1574130577000','GATEWAY','22','','GATEWAYSTATE','网关状态改变','','正常','True'),(1633,'1583994810000','1583994810000','DEVICE','340','','DEVICESTATE','设备状态改变','','正常','True'),(1634,'1583994810000','1583994810000','DEVICE','340','1305','POWER','电源','BOOLEAN','正常','True'),(1635,'1583994810000','1583994810000','DEVICE','340','1302','LEAKTESTRESULT','漏电测试结果','BOOLEAN','正常','True'),(1636,'1583994810000','1583994810000','DEVICE','340','1301','LINETEMPERATURE','线路温度','FLOAT','正常','True'),(1637,'1583994810000','1583994810000','DEVICE','340','1303','LINELEAKAGE','线路漏电值','FLOAT','正常','True'),(1638,'1583994810000','1583994810000','DEVICE','340','1300','LINEENERGY','线路电量','FLOAT ','正常','True'),(1639,'1583994810000','1583994810000','DEVICE','340','1306','LINEVOLTAGE','线路电压','FLOAT','正常','True'),(1640,'1583994810000','1583994810000','DEVICE','340','1298','LINECURRENT','线路电流','FLOAT','正常','True'),(1641,'1583994810000','1583994810000','DEVICE','340','1304','LINEPOWER','线路功率','FLOAT','正常','True'),(2079,'1589938579000','1589938579000','GATEWAY','44','','GATEWAYSTATE','网关状态改变','','正常','True'),(2446,'1597902724000','1597902724000','GATEWAY','53','','GATEWAYSTATE','网关状态改变','','正常','True'),(2447,'1597902724000','1597902724000','GATEWAY','53','','DALIDIRECTIVE','DALI总线指令','','正常','True'),(2702,'1598512256000','1598512256000','GATEWAY','55','','GATEWAYSTATE','网关状态改变','','正常','True'),(2796,'1600847325000','1600847325000','GATEWAY','57','','GATEWAYSTATE','网关状态改变','','正常','True'),(3165,'1610414674000','1610414674000','GATEWAY','64','','GATEWAYSTATE','网关状态改变','','正常','True'),(3173,'1611900911000','1611900911000','GATEWAY','65','','GATEWAYSTATE','网关状态改变','','正常','True'),(3174,'1611900911000','1611900911000','GATEWAY','65','','DALIDIRECTIVE','DALI总线指令','','正常','True'),(3205,'1615794593000','1615794593000','DEVICE','646','','DEVICESTATE','设备状态改变','','正常','True'),(3206,'1615794593000','1615794593000','DEVICE','646','2836','POWER','电源','BOOLEAN','正常','True'),(3207,'1615794593000','1615794593000','DEVICE','646','2837','BRIGHTNESS','亮度','INTEGER','正常','True'),(3208,'1615794593000','1615794593000','DEVICE','646','2838','COLORTEMPERATURE','色温','INTEGER','正常','True'),(3209,'1615794593000','1615794593000','DEVICE','646','2840','LIGHTINGSCENE','照明场景','ENUM','正常','True'),(3210,'1615794593000','1615794593000','DEVICE','646','2839','ILLUMINATION','照度','FLOAT','正常','True'),(3211,'1615862377000','1615862377000','DEVICE','647','','DEVICESTATE','设备状态改变','','正常','True'),(3212,'1615862377000','1615862377000','DEVICE','647','2844','POWER','电源','BOOLEAN','正常','True'),(3213,'1615862377000','1615862377000','DEVICE','647','2845','BRIGHTNESS','亮度','INTEGER','正常','True'),(3214,'1615862377000','1615862377000','DEVICE','647','2841','COLORTEMPERATURE','色温','INTEGER','正常','True'),(3215,'1615862377000','1615862377000','DEVICE','647','2843','LIGHTINGSCENE','照明场景','ENUM','正常','True'),(3216,'1615862377000','1615862377000','DEVICE','647','2842','ILLUMINATION','照度','FLOAT','正常','True'),(3217,'1616032355000','1616032355000','DEVICE','648','','DEVICESTATE','设备状态改变','','正常','True'),(3218,'1616032355000','1616032355000','DEVICE','648','2849','POWER','电源','BOOLEAN','正常','True'),(3219,'1616032355000','1616032355000','DEVICE','648','2848','BRIGHTNESS','亮度','INTEGER','正常','True'),(3220,'1616032355000','1616032355000','DEVICE','648','2852','COLORTEMPERATURE','色温','INTEGER','正常','True'),(3221,'1616032355000','1616032355000','DEVICE','648','2851','LIGHTINGSCENE','照明场景','ENUM','正常','True'),(3222,'1616032355000','1616032355000','DEVICE','648','2847','ILLUMINATION','照度','FLOAT','正常','True'),(3223,'1616032560000','1616032560000','DEVICE','649','','DEVICESTATE','设备状态改变','','正常','True'),(3224,'1616032560000','1616032560000','DEVICE','649','2853','POWER','电源','BOOLEAN','正常','True'),(3225,'1616032560000','1616032560000','DEVICE','649','2856','BRIGHTNESS','亮度','INTEGER','正常','True'),(3226,'1616032560000','1616032560000','DEVICE','649','2858','COLORTEMPERATURE','色温','INTEGER','正常','True'),(3227,'1616032560000','1616032560000','DEVICE','649','2854','LIGHTINGSCENE','照明场景','ENUM','正常','True'),(3228,'1616032560000','1616032560000','DEVICE','649','2857','ILLUMINATION','照度','FLOAT','正常','True'),(3229,'1616034596000','1616034596000','DEVICE','650','','DEVICESTATE','设备状态改变','','正常','True'),(3230,'1616034596000','1616034596000','DEVICE','650','2861','POWER','电源','BOOLEAN','正常','True'),(3231,'1616034596000','1616034596000','DEVICE','650','2862','BRIGHTNESS','亮度','INTEGER','正常','True'),(3232,'1616034596000','1616034596000','DEVICE','650','2863','COLORTEMPERATURE','色温','INTEGER','正常','True'),(3233,'1616034596000','1616034596000','DEVICE','650','2860','LIGHTINGSCENE','照明场景','ENUM','正常','True'),(3234,'1616034596000','1616034596000','DEVICE','650','2864','ILLUMINATION','照度','FLOAT','正常','True'),(3235,'1616054038000','1616054038000','DEVICE','651','','DEVICESTATE','设备状态改变','','正常','True'),(3236,'1616054038000','1616054038000','DEVICE','651','2870','POWER','电源','BOOLEAN','正常','True'),(3237,'1616054038000','1616054038000','DEVICE','651','2868','BRIGHTNESS','亮度','INTEGER','正常','True'),(3238,'1616054038000','1616054038000','DEVICE','651','2866','COLORTEMPERATURE','色温','INTEGER','正常','True'),(3239,'1616054038000','1616054038000','DEVICE','651','2865','LIGHTINGSCENE','照明场景','ENUM','正常','True'),(3240,'1616054038000','1616054038000','DEVICE','651','2867','ILLUMINATION','照度','FLOAT','正常','True'),(3241,'1616054106000','1616054106000','DEVICE','652','','DEVICESTATE','设备状态改变','','正常','True'),(3242,'1616054106000','1616054106000','DEVICE','652','2872','POWER','电源','BOOLEAN','正常','True'),(3243,'1616054106000','1616054106000','DEVICE','652','2874','BRIGHTNESS','亮度','INTEGER','正常','True'),(3244,'1616054106000','1616054106000','DEVICE','652','2875','COLORTEMPERATURE','色温','INTEGER','正常','True'),(3245,'1616054106000','1616054106000','DEVICE','652','2871','LIGHTINGSCENE','照明场景','ENUM','正常','True'),(3246,'1616054106000','1616054106000','DEVICE','652','2876','ILLUMINATION','照度','FLOAT','正常','True'),(3263,'1616119366000','1616119366000','DEVICE','656','','DEVICESTATE','设备状态改变','','正常','True'),(3264,'1616119366000','1616119366000','DEVICE','656','2894','POWER','电源','BOOLEAN','正常','True'),(3265,'1616119366000','1616119366000','DEVICE','656','2897','BRIGHTNESS','亮度','INTEGER','正常','True'),(3266,'1616119366000','1616119366000','DEVICE','656','2896','COLORTEMPERATURE','色温','INTEGER','正常','True'),(3267,'1616119366000','1616119366000','DEVICE','656','2895','LIGHTINGSCENE','照明场景','ENUM','正常','True'),(3268,'1616119366000','1616119366000','DEVICE','656','2898','ILLUMINATION','照度','FLOAT','正常','True'),(3367,'1617345456000','1617345456000','DEVICE','673','','DEVICESTATE','设备状态改变','','正常','True'),(3368,'1617345456000','1617345456000','DEVICE','673','3018','POWER','电源','BOOLEAN','正常','True'),(3369,'1617345456000','1617345456000','DEVICE','673','3016','LINETEMPERATURE','线路温度','FLOAT','正常','True'),(3370,'1617345456000','1617345456000','DEVICE','673','3020','LINEENERGY','线路电量','FLOAT ','正常','True'),(3371,'1617345456000','1617345456000','DEVICE','673','3021','LINEVOLTAGE','线路电压','FLOAT','正常','True'),(3372,'1617345456000','1617345456000','DEVICE','673','3019','LINECURRENT','线路电流','FLOAT','正常','True'),(3373,'1617345456000','1617345456000','DEVICE','673','3017','LINEPOWER','线路功率','FLOAT','正常','True'),(3593,'1618536738000','1618536738000','DEVICE','705','','DEVICESTATE','设备状态改变','','正常','True'),(3594,'1618536738000','1618536738000','DEVICE','705','3215','POWER','电源','BOOLEAN','正常','True'),(3595,'1618536738000','1618536738000','DEVICE','705','3219','BRIGHTNESS','亮度','INTEGER','正常','True'),(3596,'1618536738000','1618536738000','DEVICE','705','3220','COLORTEMPERATURE','色温','INTEGER','正常','True'),(3597,'1618536738000','1618536738000','DEVICE','705','3216','LIGHTINGSCENE','照明场景','ENUM','正常','True'),(3598,'1618536738000','1618536738000','DEVICE','705','3218','ILLUMINATION','照度','FLOAT','正常','True'),(3599,'1618537436000','1618537436000','DEVICE','706','','DEVICESTATE','设备状态改变','','正常','True'),(3600,'1618537436000','1618537436000','DEVICE','706','3221','MOTORDRIVERPOSITION','电机驱动位置','INTEGER','正常','True'),(3610,'1618971650000','1618971650000','DEVICE','711','','DEVICESTATE','设备状态改变','','正常','True'),(3611,'1618971650000','1618971650000','DEVICE','711','3228','HUMANBODYSTATE','人体状态','STRING','正常','True'),(3659,'1619491491000','1619491491000','DEVICE','718','','DEVICESTATE','设备状态改变','','正常','True'),(3660,'1619491491000','1619491491000','DEVICE','718','3263','HUMANBODYSTATE','人体状态','STRING','正常','True'),(3661,'1619491491000','1619491491000','DEVICE','718','3264','ILLUMINATION','照度','FLOAT','正常','True'),(3692,'1620269379000','1620269379000','GATEWAY','81','','GATEWAYSTATE','网关状态改变','','正常','True'),(3693,'1620269427000','1620269427000','DEVICE','723','','DEVICESTATE','设备状态改变','','正常','True'),(3694,'1620269427000','1620269427000','DEVICE','723','3289','POWER','电源','BOOLEAN','正常','True'),(3695,'1620269427000','1620269427000','DEVICE','723','3291','TEMPERATURE','温度','FLOAT','正常','True'),(3696,'1620269427000','1620269427000','DEVICE','723','3287','SETTINGTEMPERATURE','设定温度','FLOAT','正常','True'),(3697,'1620269427000','1620269427000','DEVICE','723','3290','WORKMODE','工作模式','ENUM','正常','True'),(3698,'1620269427000','1620269427000','DEVICE','723','3288','WINDSPEED','风速','ENUM','正常','True');
/*!40000 ALTER TABLE `stateevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supportedaction`
--

DROP TABLE IF EXISTS `supportedaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supportedaction` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `supportedServiceId` varchar(255) DEFAULT NULL,
  `supportedCharacteristicId` varchar(255) DEFAULT NULL,
  `dataprotocolNamespace` varchar(255) DEFAULT NULL,
  `dataprotocolName` varchar(255) DEFAULT NULL,
  `actionName` varchar(255) DEFAULT NULL,
  `actionParameter0Type` varchar(255) DEFAULT NULL,
  `actionParameter1Type` varchar(255) DEFAULT NULL,
  `actionParameter2Type` varchar(255) DEFAULT NULL,
  `actionParameter3Type` varchar(255) DEFAULT NULL,
  `actionParameter0Description` varchar(255) DEFAULT NULL,
  `actionParameter1Description` varchar(255) DEFAULT NULL,
  `actionParameter2Description` varchar(255) DEFAULT NULL,
  `actionParameter3Description` varchar(255) DEFAULT NULL,
  `actionDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supportedaction`
--

LOCK TABLES `supportedaction` WRITE;
/*!40000 ALTER TABLE `supportedaction` DISABLE KEYS */;
INSERT INTO `supportedaction` VALUES (1,'1523871474000','1523871474000','1','1','POWERCONTROLLER','TURNON','TURNONLIGHT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'开灯'),(2,'1523871474000','1523871474000','1','1','POWERCONTROLLER','TURNOFF','TURNOFFLIGHT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关灯'),(3,'1523871474000','1523871474000','1','2','BRIGHTNESSCONTROLLER','SETBRIGHTNESS','BRIGHTNESSSET','INTEGER','INTEGER','INTEGER','INTEGER','亮度值','亮度最大值','亮度最小值','步长','设置亮度'),(4,'1523871474000','1523871474000','1','2','BRIGHTNESSCONTROLLER','ADJUSTBRIGHTNESS','BRIGHTNESSUP','INTEGER','INTEGER',NULL,NULL,'亮度偏移值','亮度偏移值',NULL,NULL,'调亮'),(5,'1523871474000','1523871474000','1','2','BRIGHTNESSCONTROLLER','ADJUSTBRIGHTNESS','BRIGHTNESSDOWN','INTEGER','INTEGER',NULL,NULL,'亮度偏移值','亮度偏移值',NULL,NULL,'调暗'),(6,'1523871474000','1523871474000','1','3','COLORTEMPERATURECONTROLLER','SETCOLORTEMPERATURE','COLORTEMPERATURESET','INTEGER','INTEGER','INTEGER','INTEGER','色温值','色温最大值','色温最小值','步长','设置色温'),(7,'1523871474000','1523871474000','1','3','COLORTEMPERATURECONTROLLER','ADJUSTCOLORTEMPERATURE','COLORTEMPERATUREUP','INTEGER','INTEGER',NULL,NULL,'色温偏移值','色温偏移值',NULL,NULL,'变冷'),(8,'1523871474000','1523871474000','1','3','COLORTEMPERATURECONTROLLER','ADJUSTCOLORTEMPERATURE','COLORTEMPERATUREDOWN','INTEGER','INTEGER',NULL,NULL,'色温偏移值','色温偏移值',NULL,NULL,'变暖'),(9,'1523871474000','1523871474000','1','5','LIGHTINGSCENECONTROLLER','ACTIVATELIGHTINGSCENE','ACTIVATELIGHTINGSCENE','ENUM','ENUM',NULL,NULL,'场景号','场景号',NULL,NULL,'激活照明场景'),(10,'1524057181000','1524057181000','1','2','BRIGHTNESSCONTROLLER','ADJUSTBRIGHTNESS','BRIGHTNESSUPABIT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'调亮一点'),(11,'1524057181000','1524057181000','1','2','BRIGHTNESSCONTROLLER','ADJUSTBRIGHTNESS','BRIGHTNESSDOWNABIT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'调暗一点'),(12,'1524057181000','1524057181000','1','2','BRIGHTNESSCONTROLLER','SETBRIGHTNESS','BRIGHTNESSMAX',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'最大亮度'),(13,'1524057181000','1524057181000','1','2','BRIGHTNESSCONTROLLER','SETBRIGHTNESS','BRIGHTNESSMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'最小亮度'),(14,'1524057181000','1524057181000','1','3','COLORTEMPERATURECONTROLLER','ADJUSTCOLORTEMPERATURE','COLORTEMPERATUREUPABIT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'变冷一点'),(15,'1524057181000','1524057181000','1','3','COLORTEMPERATURECONTROLLER','ADJUSTCOLORTEMPERATURE','COLORTEMPERATUREDOWNABIT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'变暖一点'),(16,'1524057181000','1524057181000','1','3','COLORTEMPERATURECONTROLLER','SETCOLORTEMPERATURE','COLORTEMPERATUREMAX',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'最冷色温'),(17,'1524057181000','1524057181000','1','3','COLORTEMPERATURECONTROLLER','SETCOLORTEMPERATURE','COLORTEMPERATUREMIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'最暖色温'),(18,'1536319801000','1536319801000','2','1','POWERCONTROLLER','CONTROLACTION','TURNONFAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'开风扇'),(19,'1536319801000','1536319801000','2','1','POWERCONTROLLER','CONTROLACTION','TURNOFFFAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关风扇'),(20,'1536319801000','1536319801000','2','6','WINDSPEEDCONTROLLER','SETWINDSPEED','SETWINDSPEED','ENUM','ENUM',NULL,NULL,'风速等级','风速等级',NULL,NULL,'设置风速'),(21,'1536319801000','1536319801000','3','1','CONTROLACTIONCONTROLLER','CONTROLACTION','TURNONCURTAIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'开窗帘'),(22,'1536319801000','1536319801000','3','1','CONTROLACTIONCONTROLLER','CONTROLACTION','TURNOFFCURTAIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关窗帘'),(23,'1536319801000','1536319801000','3','7','MOTORDRIVERPOSITIONCONTROLLER','SETMOTORDRIVERPOSITION','SETCURTAINPOSITION','INTEGER','INTEGER','INTEGER','INTEGER','窗帘位置','最大位置','最小位置','步长','设置窗帘位置'),(24,'1536319801000','1536319801000','3','7','CONTROLACTIONCONTROLLER','CONTROLACTION','CURTAINPOSITIVEROTATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'窗帘正转'),(25,'1536319801000','1536319801000','3','7','CONTROLACTIONCONTROLLER','CONTROLACTION','CURTAINREVERSEROTATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'窗帘反转'),(26,'1536319801000','1536319801000','3','7','MOTORDRIVERPOSITIONCONTROLLER','ADJUSTMOTORDRIVERPOSITION','CURTAINPOSITIONOPENABIT','INTEGER','INTEGER',NULL,NULL,'窗帘位置偏移值','窗帘位置偏移值',NULL,NULL,'窗帘打开一点'),(27,'1536319801000','1536319801000','3','7','MOTORDRIVERPOSITIONCONTROLLER','ADJUSTMOTORDRIVERPOSITION','CURTAINPOSITIONCLOSEABIT','INTEGER','INTEGER',NULL,NULL,'窗帘位置偏移值','窗帘位置偏移值',NULL,NULL,'窗帘关闭一点'),(28,'1536319801000','1536319801000','3','7','CONTROLACTIONCONTROLLER','CONTROLACTION','CURTAINSTOPACTION',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'停止窗帘动作'),(29,'1536319801000','1536319801000','7','1','POWERCONTROLLER','TURNON','TURNONOUTLET',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'开电源'),(30,'1536319801000','1536319801000','7','1','POWERCONTROLLER','TURNOFF','TURNOFFOUTLET',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关电源'),(31,'1536319801000','1536319801000','8','14','SWITCHCONTROLLER','CLICK','CLICK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'单击'),(32,'1536319801000','1536319801000','8','15','SWITCHCONTROLLER','DOUBLECLICK','DOUBLECLICK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'双击'),(33,'1536319801000','1536319801000','8','16','SWITCHCONTROLLER','LONGPRESS','LONGPRESS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'长按'),(34,'1536319801000','1536319801000','14','8','LOCKSTATECONTROLLER','LOCK','LOCK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'锁定'),(35,'1536319801000','1536319801000','14','8','LOCKSTATECONTROLLER','UNLOCK','UNLOCK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'解锁'),(36,'1536319801000','1536319801000','3','36','MOTORDRIVERANGLECONTROLLER','SETMOTORDRIVERANGLE','SETCURTAINANGLE','INTEGER','INTEGER','INTEGER','INTEGER','窗帘角度','最大角度','最小角度','步长','设置窗帘角度'),(37,'1536319801000','1536319801000','3','36','MOTORDRIVERANGLECONTROLLER','ADJUSTMOTORDRIVERANGLE','CURTAINPOSITIVEROTATEABIT','INTEGER','INTEGER',NULL,NULL,'窗帘角度偏移值','窗帘角度偏移值',NULL,NULL,'窗帘正转一点'),(38,'1536319801000','1536319801000','3','36','MOTORDRIVERANGLECONTROLLER','ADJUSTMOTORDRIVERANGLE','CURTAINREVERSEROTATEABIT','INTEGER','INTEGER',NULL,NULL,'窗帘角度偏移值','窗帘角度偏移值',NULL,NULL,'窗帘反转一点'),(39,'1536319801000','1536319801000','5','1','POWERCONTROLLER','TURNON','TURNONAIRCONDITION',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'开电源'),(40,'1536319801000','1536319801000','5','1','POWERCONTROLLER','TURNOFF','TURNOFFAIRCONDITION',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关电源'),(41,'1536319801000','1536319801000','5','31','TEMPERATURECONTROLLER','SETTEMPERATURE','SETTEMPERATURE','FLOAT','FLOAT','FLOAT','FLOAT','设置温度','最大温度','最小温度','步长','设置温度'),(42,'1536319801000','1536319801000','5','31','TEMPERATURECONTROLLER','ADJUSTTEMPERATURE','TEMPERATUREUP','FLOAT','FLOAT',NULL,NULL,'温度偏移值','温度偏移值',NULL,NULL,'调高温度'),(43,'1536319801000','1536319801000','5','31','TEMPERATURECONTROLLER','ADJUSTTEMPERATURE','TEMPERATUREDOWN','FLOAT','FLOAT',NULL,NULL,'温度偏移值','温度偏移值',NULL,NULL,'调低温度'),(44,'1536319801000','1536319801000','5','6','WINDSPEEDCONTROLLER','SETWINDSPEED','SETWINDSPEED','ENUM','ENUM',NULL,NULL,'风速等级','风速等级',NULL,NULL,'设置风速'),(45,'1536319801000','1536319801000','5','29','WORKMODECONTROLLER','SETWORKMODE','SETWORKMODE','ENUM','ENUM',NULL,NULL,'工作模式','工作模式',NULL,NULL,'设置工作模式'),(46,'1536319801000','1536319801000','5','32','COLDWATERVALVECONTROLLER','TURNON','TURNONCOLDWATERVALVE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'打开冷水阀'),(47,'1536319801000','1536319801000','5','32','COLDWATERVALVECONTROLLER','TURNOFF','TURNOFFCOLDWATERVALVE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关闭冷水阀'),(48,'1536319801000','1536319801000','5','33','HOTWATERVALVECONTROLLER','TURNON','TURNONHOTWATERVALVE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'打开热水阀'),(49,'1536319801000','1536319801000','5','33','HOTWATERVALVECONTROLLER','TURNOFF','TURNOFFHOTWATERVALVE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关闭热水阀'),(50,'1536319801000','1536319801000','19','29','WORKMODECONTROLLER','SETWORKMODE','SETWORKMODE','ENUM','ENUM',NULL,NULL,'工作模式','工作模式',NULL,NULL,'设置工作模式'),(51,'1536319801000','1536319801000','19','30','HUMIDIFICATIONCONTROLLER','TURNON','TURNONHUMIDIFICATION',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'开加湿'),(52,'1536319801000','1536319801000','19','30','HUMIDIFICATIONCONTROLLER','TURNOFF','TURNOFFHUMIDIFICATION',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关加湿'),(53,'1536319801000','1536319801000','19','6','WINDSPEEDCONTROLLER','SETWINDSPEED','SETWINDSPEED','ENUM','ENUM',NULL,NULL,'风速等级','风速等级',NULL,NULL,'设置风速'),(54,'1536319801000','1536319801000','18','1','POWERCONTROLLER','TURNON','TURNONBREAKER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'开电源'),(55,'1536319801000','1536319801000','18','1','POWERCONTROLLER','TURNOFF','TURNOFFBREAKER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关电源'),(56,'1536319801000','1536319801000','18','21','LEAKTESTCONTROLLER','LEAKTEST','LEAKTEST',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'漏电测试'),(57,'1578555849000','1578555849000','20','37','PLAYBACKSTATECONTROLLER','PLAY','PLAY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'播放'),(58,'1578555849000','1578555849000','20','37','PLAYBACKSTATECONTROLLER','PAUSE','PAUSE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'暂停'),(59,'1578555849000','1578555849000','20','38','PLAYMODECONTROLLER','SETPLAYMODE','SETPLAYMODE','ENUM','ENUM',NULL,NULL,'播放模式','播放模式',NULL,NULL,'设置播放模式'),(60,'1578555849000','1578555849000','20','39','TRACKCONTROLLER','SKIPTOPREVIOUSTRACK','SKIPTOPREVIOUSTRACK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'上一首'),(61,'1578555849000','1578555849000','20','39','TRACKCONTROLLER','SKIPTONEXTTRACK','SKIPTONEXTTRACK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'下一首'),(62,'1578555849000','1578555849000','20','40','VOLUMECONTROLLER','SETVOLUME','SETVOLUME','INTEGER','INTEGER','INTEGER','INTEGER','音量值','音量最大值','音量最小值','步长','设置音量'),(63,'1578555849000','1578555849000','20','40','VOLUMECONTROLLER','ADJUSTVOLUME','VOLUMEUP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'音量调高一点'),(64,'1578555849000','1578555849000','20','40','VOLUMECONTROLLER','ADJUSTVOLUME','VOLUMEDOWN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'音量调低一点'),(65,'1578555849000','1578555849000','20','41','MUTECONTROLLER','MUTE','MUTE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'静音'),(66,'1578555849000','1578555849000','20','41','MUTECONTROLLER','UNMUTE','UNMUTE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'取消静音'),(67,'1578555849000','1578555849000','20','42','PLAYLISTCONTROLLER','PLAYLIST','PLAYLIST','ENUMS','ENUMS',NULL,NULL,'播放列表','播放列表',NULL,NULL,'播放列表'),(68,'1578823069000','1578823069000','15','46','PTZCONTROLLER','UP','PTZUP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'云台向上'),(69,'1578823069000','1578823069000','15','46','PTZCONTROLLER','DOWN','PTZDOWN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'云台向下'),(70,'1578823069000','1578823069000','15','46','PTZCONTROLLER','LEFT','PTZLEFT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'云台向左'),(71,'1578823069000','1578823069000','15','46','PTZCONTROLLER','RIGHT','PTZRIGHT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'云台向右'),(72,'1578823069000','1578823069000','15','46','PTZCONTROLLER','VERTICALSTOP','PTZVERTICALSTOP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'云台停止上下动作'),(73,'1578823069000','1578823069000','15','47','CAPTURECONTROLLER','CAPTURE','CAPTURE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'抓拍'),(74,'1578823069000','1578823069000','15','48','LENSMASKINGCONTROLLER','TURNON','TURNONLENSMASKING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'镜头遮蔽开启'),(75,'1578823069000','1578823069000','15','48','LENSMASKINGCONTROLLER','TURNOFF','TURNOFFLENSMASKING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'镜头遮蔽关闭'),(76,'1578823069000','1578823069000','15','49','DEFENCECONTROLLER','TURNON','TURNONDEFENCE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'布防'),(77,'1578823069000','1578823069000','15','49','DEFENCECONTROLLER','TURNOFF','TURNOFFDEFENCE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'撤防'),(78,'1578823069000','1578823069000','15','50','MIRRORCONTROLLER','FLIPVERTICAL','FLIPVERTICAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'上下翻转'),(79,'1578823069000','1578823069000','15','50','MIRRORCONTROLLER','FLIPHORIZONTAL','FLIPHORIZONTAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'左右翻转'),(80,'1578823069000','1578823069000','15','50','MIRRORCONTROLLER','CENTERPEEL','CENTERPEEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'中心翻转'),(81,'1578823069000','1578823069000','15','46','PTZCONTROLLER','HORIZONTALSTOP','PTZHORIZONTALSTOP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'云台停止左右动作'),(82,'1578555849000','1578555849000','20','55','AUDIOSOURCECONTROLLER','SETAUDIOSOURCE','SETAUDIOSOURCE','ENUM','ENUM',NULL,NULL,'音源','音源',NULL,NULL,'设置音源'),(83,'1578555849000','1578555849000','8','64','SWITCHCONTROLLER','SHAKE','SHAKE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'摇一摇'),(84,'1578555849000','1578555849000','5','62','RELAYPOWERCONTROLLER','TURNON','TURNONRELAYPOWER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'打开插座电源'),(85,'1578555849000','1578555849000','5','62','RELAYPOWERCONTROLLER','TURNOFF','TURNOFFRELAYPOWER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关闭插座电源'),(86,'1578555849000','1578555849000','5','63','SWINGCONTROLLER','TURNON','TURNONSWING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'打开扫风'),(87,'1578555849000','1578555849000','5','63','SWINGCONTROLLER','TURNOFF','TURNOFFSWING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关闭扫风'),(88,'1578555849000','1578555849000','22','62','RELAYPOWERCONTROLLER','TURNON','TURNONRELAYPOWER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'打开电源'),(89,'1578555849000','1578555849000','22','62','RELAYPOWERCONTROLLER','TURNOFF','TURNOFFRELAYPOWER',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关闭电源'),(90,'1578555849000','1578555849000','19','74','POWERSETTINGCONTROLLER','SETPOWERSETTING','SETPOWERSETTING','ENUM','ENUM',NULL,NULL,'开关机设置','开关机设置',NULL,NULL,'开关机设置'),(91,'1578555849000','1578555849000','19','76','CYCLICMODECONTROLLER','SETCYCLICMODE','SETCYCLICMODE','ENUM','ENUM',NULL,NULL,'循环模式','循环模式',NULL,NULL,'设置循环模式'),(92,'1578555849000','1578555849000','24','77','FEEDCONTROLLER','TURNON','TURNONFEED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'启动加料'),(93,'1578555849000','1578555849000','24','77','FEEDCONTROLLER','TURNOFF','TURNOFFFEED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'停止加料'),(94,'1578555849000','1578555849000','24','1','POWERCONTROLLER','TURNON','TURNONATOMIZINGFIREPLACE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'打开雾化壁炉'),(95,'1578555849000','1578555849000','24','1','POWERCONTROLLER','TURNOFF','TURNOFFATOMIZINGFIREPLACE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关闭雾化壁炉'),(96,'1578555849000','1578555849000','24','6','WINDSPEEDCONTROLLER','SETWINDSPEED','SETWINDSPEED','ENUM','ENUM',NULL,NULL,'热风调节','热风调节',NULL,NULL,'热风调节'),(97,'1578555849000','1578555849000','24','78','FLAMESIZECONTROLLER','SETFLAMESIZE','SETFLAMESIZE','ENUM','ENUM',NULL,NULL,'火焰大小','火焰大小',NULL,NULL,'设置火焰大小'),(98,'1578555849000','1578555849000','24','79','FLAMESTATECONTROLLER','SETFLAMESTATE','SETFLAMESTATE','ENUM','ENUM',NULL,NULL,'火焰状态','火焰状态',NULL,NULL,'设置火焰状态'),(99,'1578555849000','1578555849000','24','80','MUSICCONTROLLER','TURNON','TURNONMUSIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'打开音乐'),(100,'1578555849000','1578555849000','24','80','MUSICCONTROLLER','TURNOFF','TURNOFFMUSIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关闭音乐'),(101,'1578555849000','1578555849000','24','81','VOICECONTROLLER','TURNON','TURNONVOICE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'打开语音'),(102,'1578555849000','1578555849000','24','81','VOICECONTROLLER','TURNOFF','TURNOFFVOICE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关闭语音'),(103,'1578555849000','1578555849000','23','29','WORKMODECONTROLLER','SETWORKMODE','SETWORKMODE','ENUM','ENUM',NULL,NULL,'工作模式','工作模式',NULL,NULL,'设置工作模式');
/*!40000 ALTER TABLE `supportedaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supportedservice`
--

DROP TABLE IF EXISTS `supportedservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supportedservice` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `serviceType` varchar(255) DEFAULT NULL,
  `serviceDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supportedservice`
--

LOCK TABLES `supportedservice` WRITE;
/*!40000 ALTER TABLE `supportedservice` DISABLE KEYS */;
INSERT INTO `supportedservice` VALUES (1,'2018-04-12 22:50:09','2018-04-12 22:50:12','LIGHTING','照明'),(2,'2018-04-12 22:51:04','2018-04-12 22:51:07','FAN','风扇'),(3,'2018-06-10 21:07:08','2018-06-10 21:07:10','CURTAIN','窗帘'),(4,'2018-06-12 16:39:22','2018-06-12 16:39:25','TELEVISION','电视'),(5,'2018-06-12 16:39:22','2018-06-12 16:39:25','AIRCONDITION','空调'),(6,'2018-06-12 16:39:22','2018-06-12 16:39:25','AIRPURIFIER','空气净化器'),(7,'2018-06-12 16:39:22','2018-06-12 16:39:25','OUTLET','插座'),(8,'2018-06-12 16:39:22','2018-06-12 16:39:25','SWITCH','开关'),(9,'2018-06-12 16:39:22','2018-06-12 16:39:25','ROBOTICVACUUM','扫地机器人'),(10,'2018-06-12 16:39:22','2018-06-12 16:39:25','HUMIDIFIER','加湿器'),(11,'2018-06-12 16:39:22','2018-06-12 16:39:25','WATERHEATER','热水器'),(12,'2018-06-12 16:39:22','2018-06-12 16:39:25','SENSOR','传感器'),(13,'2018-06-12 16:39:22','2018-06-12 16:39:25','DOORLOCK','门锁'),(14,'2018-06-12 16:39:22','2018-06-12 16:39:25','FRIDGE','冰箱'),(15,'2018-06-12 16:39:22','2018-06-12 16:39:25','CAMERA','摄像头'),(16,'2018-06-12 16:39:22','2018-06-12 16:39:25','KITCHENVENTILATOR','抽油烟机'),(17,'2018-06-12 16:43:15','2018-06-12 16:43:13','COOKER','电饭煲'),(18,'2019-11-06 15:02:41','2019-11-06 15:02:44','BREAKER','断路器'),(19,'2019-11-06 21:59:43','2019-11-06 21:59:45','VENTILATION','新风'),(20,'2020-01-09 11:57:48','2020-01-09 11:57:50','LOUDSPEAKERBOX','音箱'),(21,'2020-05-30 17:50:53','2020-05-30 17:50:55','VIDEODOORBELL','可视门铃'),(22,'2021-02-04 15:59:13','2021-02-04 15:59:15','RELAYDEVICE','继电器设备'),(23,'2018-06-12 16:39:22','2018-06-12 16:39:25','DOOR','门'),(24,'2021-04-30 20:18:40','2021-04-30 20:18:42','ATOMIZINGFIREPLACE','雾化壁炉');
/*!40000 ALTER TABLE `supportedservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timedtask`
--

DROP TABLE IF EXISTS `timedtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timedtask` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `timeEventId` varchar(255) DEFAULT NULL,
  `timedTaskType` varchar(255) DEFAULT NULL,
  `timedTaskName` varchar(255) DEFAULT NULL,
  `timedTaskDescription` varchar(255) DEFAULT NULL,
  `timedTaskState` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timedtask`
--

LOCK TABLES `timedtask` WRITE;
/*!40000 ALTER TABLE `timedtask` DISABLE KEYS */;
INSERT INTO `timedtask` VALUES (19,'1616576475000','1616637285000','20','ONCE','1','','正常','True');
/*!40000 ALTER TABLE `timedtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timedtaskaction`
--

DROP TABLE IF EXISTS `timedtaskaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timedtaskaction` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `timedTaskActionType` varchar(255) DEFAULT NULL,
  `targetSceneId` varchar(255) DEFAULT NULL,
  `supportedActionId` varchar(255) DEFAULT NULL,
  `supportedServiceId` varchar(255) DEFAULT NULL,
  `actionName` varchar(255) DEFAULT NULL,
  `actionExecuteType` varchar(255) DEFAULT NULL,
  `actionTimeDelay` varchar(255) DEFAULT NULL,
  `actionOrder` varchar(255) DEFAULT NULL,
  `actionParameter1Type` varchar(255) DEFAULT NULL,
  `actionParameter2Type` varchar(255) DEFAULT NULL,
  `actionParameter3Type` varchar(255) DEFAULT NULL,
  `actionParameter1` varchar(255) DEFAULT NULL,
  `actionParameter2` varchar(255) DEFAULT NULL,
  `actionParameter3` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `timedTaskId` varchar(255) DEFAULT NULL,
  `actionDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timedtaskaction`
--

LOCK TABLES `timedtaskaction` WRITE;
/*!40000 ALTER TABLE `timedtaskaction` DISABLE KEYS */;
INSERT INTO `timedtaskaction` VALUES (20,'1616576475000','1616576604000','DEVICE',NULL,'12','1','BRIGHTNESSMAX','REALTIME','','0','','','','','','','True','19','最大亮度');
/*!40000 ALTER TABLE `timedtaskaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timedtaskactiontarget`
--

DROP TABLE IF EXISTS `timedtaskactiontarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timedtaskactiontarget` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `timedTaskActionTargetId` varchar(255) DEFAULT NULL,
  `timedTaskActionTargetType` varchar(255) DEFAULT NULL,
  `timedTaskActionId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timedtaskactiontarget`
--

LOCK TABLES `timedtaskactiontarget` WRITE;
/*!40000 ALTER TABLE `timedtaskactiontarget` DISABLE KEYS */;
INSERT INTO `timedtaskactiontarget` VALUES (69,'1616576604000','1616576604000','651','DEVICE','20'),(70,'1616576604000','1616576604000','652','DEVICE','20');
/*!40000 ALTER TABLE `timedtaskactiontarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeevent`
--

DROP TABLE IF EXISTS `timeevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeevent` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` varchar(255) DEFAULT NULL,
  `gmtUpdate` varchar(255) DEFAULT NULL,
  `timeEventType` varchar(255) DEFAULT NULL,
  `startDate` varchar(255) DEFAULT NULL,
  `triggerTime` varchar(255) DEFAULT NULL,
  `dateFreq` varchar(255) DEFAULT NULL,
  `dateUntil` varchar(255) DEFAULT NULL,
  `dateCount` varchar(255) DEFAULT NULL,
  `dateInterval` varchar(255) DEFAULT NULL,
  `dateByday` varchar(255) DEFAULT NULL,
  `dateBymonthday` varchar(255) DEFAULT NULL,
  `dateByyearday` varchar(255) DEFAULT NULL,
  `dateBymonth` varchar(255) DEFAULT NULL,
  `timeType` varchar(255) DEFAULT NULL,
  `sunEvent` varchar(255) DEFAULT NULL,
  `timeOffset` varchar(255) DEFAULT NULL,
  `timeEventState` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeevent`
--

LOCK TABLES `timeevent` WRITE;
/*!40000 ALTER TABLE `timeevent` DISABLE KEYS */;
INSERT INTO `timeevent` VALUES (20,'1616576475000','1616637285000','ONCE','2021-03-25','09:55:50','','','1','1','','','','','','','','正常','True');
/*!40000 ALTER TABLE `timeevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track` (
  `id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `album` varchar(255) DEFAULT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `serviceName` varchar(255) DEFAULT NULL,
  `playlistId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` VALUES (1,'邵夷贝 - 镜心之歌.mp3','','','','','','5'),(2,'魏新雨 - 恋人心.mp3','','','','','','5'),(3,'徐薇 - 夜空中最亮的星.mp3','','','','','','5'),(4,'薛晓枫 - 最后一次.mp3','','','','','','5'),(5,'音阙诗听 - 红昭愿.mp3','','','','','','5'),(6,'房东的猫 - 秋酿.mp3','','','','','','5'),(7,'锦零 - 豆花之歌.mp3','','','','','','5'),(8,'李翊君 - 雨蝶.mp3','','','','','','5'),(9,'励阳、徐君 - 我知道你.mp3','','','','','','5'),(10,'卢恒宇、李姝洁 - 写给父亲.mp3','','','','','','5'),(11,'阿森 - 空蝉变奏曲.mp3','','','','','','5'),(12,'陈慧娴 - 月半小夜曲 (原版伴奏).mp3','','','','','','5'),(13,'陈小希 - 80000.mp3','','','','','','5'),(14,'纯音乐 - 背景音乐.mp3','','','','','','5'),(15,'纯音乐 - 火影忍者超抒情背景音乐.mp3','','','','','','5'),(16,'Joel Adams - Please Don\'t Go.mp3','','','','','','5'),(17,'Lenka - Blue Skies.mp3','','','','','','5'),(18,'Twinbed - Trouble I\'m In.mp3','','','','','','5'),(19,'Vexento - Anesthesia.mp3','','','','','','5'),(20,'Xandria - Eversleeping.mp3','','','','','','5'),(21,'Delacey - Dream It Possible.mp3','','','','','','5'),(22,'Tonya Mitchell - Stay.mp3','','','','','','5'),(23,'Git Fresh - Booty Music.mp3','','','','','','5'),(24,'Ina Wroldsen - I Wanted You.mp3','','','','','','5'),(25,'Jason Derulo、Maude - Trumpets.mp3','','','','','','5'),(26,'Beyonce、Lady Gaga - Telephone.mp3','','','','','','5'),(27,'Blue - One Love.mp3','','','','','','5'),(28,'Cascada - Night Nurse.mp3','','','','','','5'),(29,'Charlie Puth - How Long (x Attention Mashup Remix).mp3','','','','','','5'),(30,'DEAMN - Drive My Car.mp3','','','','','','5'),(31,'Sara Groves、Joel Hanson - Traveling Light.mp3','','','','','','5'),(32,'SING-许诗茵 - 白衣少年.mp3','','','','','','5'),(33,'T-ara - DAY BY DAY (Japanese ver.).mp3','','','','','','5'),(34,'Alan Walker - Fade.mp3','','','','','','5'),(35,'beFour - comsic ride.mp3','','','','','','5'),(36,'Marit Larsen - If A Song Could Get Me You.mp3','','','','','','5'),(37,'Maxwell - It\'s Ok.mp3','','','','','','5'),(38,'Megan Nicole - Escape.mp3','','','','','','5'),(39,'Megan Nicole - Glad You Came.mp3','','','','','','5'),(40,'Paula DeAnda - Why Would I Ever.mp3','','','','','','5'),(41,'Lovestoned - Bye Bye Bye.mp3','','','','','','5'),(42,'周深 - 来不及勇敢.mp3','','','','','','5'),(43,'Lovestoned - Rising Girl.mp3','','','','','','5'),(44,'Madilyn Bailey - Maps.mp3','','','','','','5'),(45,'Madilyn Bailey - Titanium.mp3','','','','','','5'),(46,'/','','','','','','5'),(47,'闹铃/','','','','','','5'),(1,'Gemie - Roller Coaster.mp3','','','','','','6'),(2,'Tielle - Cage.mp3','','','','','','6'),(3,'Uru - Binary Star.mp3','','','','','','6'),(4,'Yosh - Barricades (Movie ver.).mp3','','','','','','6'),(5,'Alive _ Do As Infinity feat. Hiroyuki Sawano.mp3','','','','','','6'),(1,'祝词舞.mp3','','','','','','7'),(2,'Good Old Memories.mp3','','','','','','7'),(3,'天狗.mp3','','','','','','7'),(4,'烂漫.mp3','','','','','','7'),(5,'寂寥蛍.mp3','','','','','','7'),(6,'始祖.mp3','','','','','','7'),(7,'雅舞.mp3','','','','','','7'),(8,'秋祠舞.mp3','','','','','','7'),(9,'神乐舞.mp3','','','','','','7'),(10,'慕情.mp3','','','','','','7'),(1,'Opposite World.mp3','','','','','','8'),(2,'此叶隐.mp3','','','','','','8'),(3,'鸟居莳绘.mp3','','','','','','8'),(4,'繁花终落.mp3','','','','','','8'),(5,'瞳中幻想.mp3','','','','','','8'),(6,'三千世界.mp3','','','','','','8'),(7,'丛云伴月风拂花.mp3','','','','','','8'),(8,'花鸟风月.mp3','','','','','','8'),(9,'圣人的调律.mp3','','','','','','8'),(10,'彷徨之冥.mp3','','','','','','8');
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploaddelete`
--

DROP TABLE IF EXISTS `uploaddelete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uploaddelete` (
  `parameter` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploaddelete`
--

LOCK TABLES `uploaddelete` WRITE;
/*!40000 ALTER TABLE `uploaddelete` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploaddelete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather` (
  `id` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `temperature` varchar(255) DEFAULT NULL,
  `feelsLike` varchar(255) DEFAULT NULL,
  `pressure` varchar(255) DEFAULT NULL,
  `humidity` varchar(255) DEFAULT NULL,
  `visibility` varchar(255) DEFAULT NULL,
  `windDirection` varchar(255) DEFAULT NULL,
  `windDirectionDegree` varchar(255) DEFAULT NULL,
  `windSpeed` varchar(255) DEFAULT NULL,
  `windScale` varchar(255) DEFAULT NULL,
  `clouds` varchar(255) DEFAULT NULL,
  `dewPoint` varchar(255) DEFAULT NULL,
  `updateTime` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
INSERT INTO `weather` VALUES ('WS08H58U92R8','阴','9','31','31','1003','65','30','南','175','9','2','90','','2021-05-13 15:05:00');
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-14 10:04:10
