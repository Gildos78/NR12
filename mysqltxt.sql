-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema nr12
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema nr12
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nr12` DEFAULT CHARACTER SET utf8 ;
USE `nr12` ;

-- -----------------------------------------------------
-- Table `nr12`.`capacitacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`capacitacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `endereco` VARCHAR(60) NULL DEFAULT NULL,
  `numero` INT NULL DEFAULT NULL,
  `cidade` VARCHAR(45) NULL DEFAULT NULL,
  `estado` VARCHAR(2) NULL DEFAULT NULL,
  `cep` VARCHAR(8) NULL DEFAULT NULL,
  `telefone` VARCHAR(11) NULL DEFAULT NULL,
  `email` VARCHAR(60) NULL DEFAULT NULL,
  `imagem` VARCHAR(60) NULL DEFAULT NULL,
  `bairro` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`configuracoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`configuracoes` (
  `id` INT NOT NULL,
  `portaria` LONGTEXT NULL DEFAULT NULL,
  `dispositivos` LONGTEXT NULL DEFAULT NULL,
  `resptecnica` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`tipodispositivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`tipodispositivo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`tipomaquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`tipomaquina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` LONGTEXT NOT NULL,
  `descricao` LONGTEXT NULL DEFAULT NULL,
  `capacitacaoId` INT NULL DEFAULT NULL,
  `introducao_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tipomaquina_capacitacao1_idx` (`capacitacaoId` ASC) VISIBLE,
  CONSTRAINT `fk_tipomaquina_capacitacao1`
    FOREIGN KEY (`capacitacaoId`)
    REFERENCES `nr12`.`capacitacao` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`maquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`maquina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clienteId` INT NOT NULL,
  `tipomaquinaId` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NULL DEFAULT NULL,
  `numeroserie` VARCHAR(45) NULL DEFAULT NULL,
  `numeropatrimonio` VARCHAR(45) NULL DEFAULT NULL,
  `capacidade` VARCHAR(15) NULL DEFAULT NULL,
  `ano` INT NULL DEFAULT NULL,
  `fabricante` VARCHAR(45) NULL DEFAULT NULL,
  `setor` VARCHAR(45) NULL DEFAULT NULL,
  `fotofront` VARCHAR(100) NULL DEFAULT NULL,
  `fotole` VARCHAR(100) NULL DEFAULT NULL,
  `fotold` VARCHAR(100) NULL DEFAULT NULL,
  `fotopost` VARCHAR(100) NULL DEFAULT NULL,
  `genero` CHAR(1) NOT NULL DEFAULT 'a',
  PRIMARY KEY (`id`),
  INDEX `fk_Maquina_TipoMaquina1_idx` (`tipomaquinaId` ASC) VISIBLE,
  INDEX `fk_maquinas_cliente1_idx` (`clienteId` ASC) VISIBLE,
  CONSTRAINT `fk_Maquina_TipoMaquina1`
    FOREIGN KEY (`tipomaquinaId`)
    REFERENCES `nr12`.`tipomaquina` (`id`),
  CONSTRAINT `fk_maquinas_cliente1`
    FOREIGN KEY (`clienteId`)
    REFERENCES `nr12`.`cliente` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(20) NOT NULL,
  `habilitacao` VARCHAR(45) NULL DEFAULT NULL,
  `crea` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`laudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`laudo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(20) NULL DEFAULT NULL,
  `usuarioId` INT NOT NULL,
  `maquinaId` INT NOT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `data_inicial` DATE NULL DEFAULT NULL,
  `data_final` DATE NULL DEFAULT NULL,
  `limitesMaquina` LONGTEXT NULL DEFAULT NULL,
  `imagem` VARCHAR(100) NULL DEFAULT NULL,
  `responsavelId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Laudos_Usuarios_idx` (`usuarioId` ASC) VISIBLE,
  INDEX `fk_Laudos_Maquina1_idx` (`maquinaId` ASC) VISIBLE,
  INDEX `fk_Laudos_UsuarioResponsavel_idx` (`responsavelId` ASC) VISIBLE,
  CONSTRAINT `fk_Laudos_Maquina1`
    FOREIGN KEY (`maquinaId`)
    REFERENCES `nr12`.`maquina` (`id`),
  CONSTRAINT `fk_Laudos_UsuarioResponsavel`
    FOREIGN KEY (`responsavelId`)
    REFERENCES `nr12`.`usuario` (`id`),
  CONSTRAINT `fk_Laudos_Usuarios`
    FOREIGN KEY (`usuarioId`)
    REFERENCES `nr12`.`usuario` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 80
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`dispositivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`dispositivo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `laudoId` INT NOT NULL,
  `tipoDispositivoId` INT NOT NULL,
  `dispositivo` VARCHAR(45) NULL DEFAULT NULL,
  `face` VARCHAR(45) NULL DEFAULT NULL,
  `analiseProtecao` LONGTEXT NULL DEFAULT NULL,
  `indicacaoSolucao` LONGTEXT NULL DEFAULT NULL,
  `imagem` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_dispositivosemergencia_laudos1_idx` (`laudoId` ASC) VISIBLE,
  INDEX `fk_dispositivos_tipodispositivo1_idx` (`tipoDispositivoId` ASC) VISIBLE,
  CONSTRAINT `fk_dispositivos_tipodispositivo1`
    FOREIGN KEY (`tipoDispositivoId`)
    REFERENCES `nr12`.`tipodispositivo` (`id`),
  CONSTRAINT `fk_dispositivosemergencia_laudos1`
    FOREIGN KEY (`laudoId`)
    REFERENCES `nr12`.`laudo` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`instalacoesdispeletrico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`instalacoesdispeletrico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(10000) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`instalacoesdispeletricolaudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`instalacoesdispeletricolaudo` (
  `laudoId` INT NOT NULL,
  `instalacoesdispeletricoId` INT NOT NULL,
  PRIMARY KEY (`laudoId`, `instalacoesdispeletricoId`),
  INDEX `fk_instalacoesdispeletricolaudo_instalacoesdispeletrico1_idx` (`instalacoesdispeletricoId` ASC) VISIBLE,
  CONSTRAINT `fk_instalacoesdispeletricolaudo_instalacoesdispeletrico1`
    FOREIGN KEY (`instalacoesdispeletricoId`)
    REFERENCES `nr12`.`instalacoesdispeletrico` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_instalacoesdispeletricolaudo_laudo1`
    FOREIGN KEY (`laudoId`)
    REFERENCES `nr12`.`laudo` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`intervencao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`intervencao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `intervencao` VARCHAR(100) NOT NULL,
  `laudoId` INT NOT NULL,
  `fotoit01` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_intervencao_laudo1_idx` (`laudoId` ASC) VISIBLE,
  CONSTRAINT `fk_intervencao_laudo1`
    FOREIGN KEY (`laudoId`)
    REFERENCES `nr12`.`laudo` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 75
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`limitemaquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`limitemaquina` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`manual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`manual` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(10000) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`manuallaudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`manuallaudo` (
  `manualId` INT NOT NULL,
  `laudoId` INT NOT NULL,
  PRIMARY KEY (`manualId`, `laudoId`),
  INDEX `fk_manuallaudo_laudo1_idx` (`laudoId` ASC) VISIBLE,
  CONSTRAINT `fk_manuallaudo_laudo1`
    FOREIGN KEY (`laudoId`)
    REFERENCES `nr12`.`laudo` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_manuallaudo_manual1`
    FOREIGN KEY (`manualId`)
    REFERENCES `nr12`.`manual` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`miparl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`miparl` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`miparl61`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`miparl61` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`miparl61intervencao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`miparl61intervencao` (
  `miparl61Id` INT NOT NULL,
  `intervencaoId` INT NOT NULL,
  PRIMARY KEY (`miparl61Id`, `intervencaoId`),
  INDEX `fk_miparl61intervencao_intervencao1_idx` (`intervencaoId` ASC) VISIBLE,
  CONSTRAINT `fk_miparl61intervencao_intervencao1`
    FOREIGN KEY (`intervencaoId`)
    REFERENCES `nr12`.`intervencao` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_miparl61intervencao_miparl611`
    FOREIGN KEY (`miparl61Id`)
    REFERENCES `nr12`.`miparl61` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`miparlintervencao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`miparlintervencao` (
  `miparlId` INT NOT NULL,
  `intervencaoId` INT NOT NULL,
  PRIMARY KEY (`miparlId`, `intervencaoId`),
  INDEX `fk_miparlintervencao_intervencao1_idx` (`intervencaoId` ASC) VISIBLE,
  CONSTRAINT `fk_miparlintervencao_intervencao1`
    FOREIGN KEY (`intervencaoId`)
    REFERENCES `nr12`.`intervencao` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_miparlintervencao_miparl1`
    FOREIGN KEY (`miparlId`)
    REFERENCES `nr12`.`miparl` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`normaregulamentadora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`normaregulamentadora` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item` VARCHAR(10) NOT NULL,
  `norma` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`normadispositivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`normadispositivo` (
  `normaId` INT NOT NULL,
  `dispositivoId` INT NOT NULL,
  PRIMARY KEY (`normaId`, `dispositivoId`),
  INDEX `fk_norma_regulamentadora_has_dispositivo_dispositivo1_idx` (`dispositivoId` ASC) VISIBLE,
  INDEX `fk_norma_regulamentadora_has_dispositivo_norma_regulamentad_idx` (`normaId` ASC) VISIBLE,
  CONSTRAINT `fk_norma_regulamentadora_has_dispositivo_dispositivo1`
    FOREIGN KEY (`dispositivoId`)
    REFERENCES `nr12`.`dispositivo` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_norma_regulamentadora_has_dispositivo_norma_regulamentadora1`
    FOREIGN KEY (`normaId`)
    REFERENCES `nr12`.`normaregulamentadora` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`perigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`perigo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`normaperigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`normaperigo` (
  `perigoId` INT NOT NULL,
  `normaId` INT NOT NULL,
  PRIMARY KEY (`perigoId`, `normaId`),
  INDEX `fk_perigos_has_normas_normas1_idx` (`normaId` ASC) VISIBLE,
  INDEX `fk_perigos_has_normas_perigos1_idx` (`perigoId` ASC) VISIBLE,
  CONSTRAINT `fk_perigos_has_normas_normas1`
    FOREIGN KEY (`normaId`)
    REFERENCES `nr12`.`normaregulamentadora` (`id`),
  CONSTRAINT `fk_perigos_has_normas_perigos1`
    FOREIGN KEY (`perigoId`)
    REFERENCES `nr12`.`perigo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`sistemaseguranca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`sistemaseguranca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`pontoperigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`pontoperigo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `laudoId` INT NOT NULL,
  `pontoPerigo` VARCHAR(100) NOT NULL,
  `face` VARCHAR(45) NOT NULL,
  `sistemasegurancaId` INT NULL DEFAULT NULL,
  `anexo1` CHAR(1) NULL DEFAULT NULL,
  `nbr14153` CHAR(1) NULL DEFAULT NULL,
  `severidade` VARCHAR(2) NULL DEFAULT NULL,
  `frequencia` VARCHAR(2) NULL DEFAULT NULL,
  `possibilidade` VARCHAR(2) NULL DEFAULT NULL,
  `pe` VARCHAR(3) NULL DEFAULT NULL,
  `fe` VARCHAR(3) NULL DEFAULT NULL,
  `pmp` VARCHAR(3) NULL DEFAULT NULL,
  `np` VARCHAR(3) NULL DEFAULT NULL,
  `nivelrisco` FLOAT NULL DEFAULT NULL,
  `analiseProtecao` LONGTEXT NULL DEFAULT NULL,
  `indicacaoSolucao` LONGTEXT NULL DEFAULT NULL,
  `fotopp01` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pontodeperigo_Laudos1_idx` (`laudoId` ASC) VISIBLE,
  INDEX `fk_pontoperigo_sistemaseguranca1_idx` (`sistemasegurancaId` ASC) VISIBLE,
  CONSTRAINT `fk_pontodeperigo_Laudos1`
    FOREIGN KEY (`laudoId`)
    REFERENCES `nr12`.`laudo` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_pontoperigo_sistemaseguranca1`
    FOREIGN KEY (`sistemasegurancaId`)
    REFERENCES `nr12`.`sistemaseguranca` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`normapontoperigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`normapontoperigo` (
  `normaId` INT NOT NULL,
  `pontoperigoId` INT NOT NULL,
  PRIMARY KEY (`normaId`, `pontoperigoId`),
  INDEX `fk_normas_has_pontoperigo_pontoperigo1_idx` (`pontoperigoId` ASC) VISIBLE,
  INDEX `fk_normas_has_pontoperigo_normas1_idx` (`normaId` ASC) VISIBLE,
  CONSTRAINT `fk_normas_has_pontoperigo_normas1`
    FOREIGN KEY (`normaId`)
    REFERENCES `nr12`.`normaregulamentadora` (`id`),
  CONSTRAINT `fk_normas_has_pontoperigo_pontoperigo1`
    FOREIGN KEY (`pontoperigoId`)
    REFERENCES `nr12`.`pontoperigo` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`normatecnica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`normatecnica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  `tipo` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`normatecnicalaudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`normatecnicalaudo` (
  `normaTecnicaId` INT NOT NULL,
  `laudoId` INT NOT NULL,
  PRIMARY KEY (`normaTecnicaId`, `laudoId`),
  INDEX `fk_normastecnicas_has_laudos_laudos1_idx` (`laudoId` ASC) VISIBLE,
  INDEX `fk_normastecnicas_has_laudos_normastecnicas1_idx` (`normaTecnicaId` ASC) VISIBLE,
  CONSTRAINT `fk_normastecnicas_has_laudos_laudos1`
    FOREIGN KEY (`laudoId`)
    REFERENCES `nr12`.`laudo` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_normastecnicas_has_laudos_normastecnicas1`
    FOREIGN KEY (`normaTecnicaId`)
    REFERENCES `nr12`.`normatecnica` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`resposta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`resposta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `resposta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`pergunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`pergunta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pergunta` VARCHAR(55) NOT NULL,
  `tipodispositivoId` INT NOT NULL,
  `respostaCorreta` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_perguntas_tipodispositivo1_idx` (`tipodispositivoId` ASC) VISIBLE,
  INDEX `fk_pergunta_resposta1_idx` (`respostaCorreta` ASC) VISIBLE,
  CONSTRAINT `fk_pergunta_resposta1`
    FOREIGN KEY (`respostaCorreta`)
    REFERENCES `nr12`.`resposta` (`id`),
  CONSTRAINT `fk_perguntas_tipodispositivo1`
    FOREIGN KEY (`tipodispositivoId`)
    REFERENCES `nr12`.`tipodispositivo` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`perguntaresposta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`perguntaresposta` (
  `perguntaId` INT NOT NULL,
  `respostaId` INT NOT NULL,
  PRIMARY KEY (`perguntaId`, `respostaId`),
  INDEX `fk_perguntas_has_respostas_respostas1_idx` (`respostaId` ASC) VISIBLE,
  INDEX `fk_perguntas_has_respostas_perguntas1_idx` (`perguntaId` ASC) VISIBLE,
  CONSTRAINT `fk_perguntas_has_respostas_perguntas1`
    FOREIGN KEY (`perguntaId`)
    REFERENCES `nr12`.`pergunta` (`id`),
  CONSTRAINT `fk_perguntas_has_respostas_respostas1`
    FOREIGN KEY (`respostaId`)
    REFERENCES `nr12`.`resposta` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`perigointervencao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`perigointervencao` (
  `perigoId` INT NOT NULL,
  `intervencaoId` INT NOT NULL,
  PRIMARY KEY (`perigoId`, `intervencaoId`),
  INDEX `fk_Perigos_has_pontodeperigo_Perigos1_idx` (`perigoId` ASC) VISIBLE,
  INDEX `fk_perigointervencao_intervencao1_idx` (`intervencaoId` ASC) VISIBLE,
  CONSTRAINT `fk_perigointervencao_intervencao1`
    FOREIGN KEY (`intervencaoId`)
    REFERENCES `nr12`.`intervencao` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Perigos_has_pontodeperigo_Perigos10`
    FOREIGN KEY (`perigoId`)
    REFERENCES `nr12`.`perigo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`perigopontoperigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`perigopontoperigo` (
  `perigoId` INT NOT NULL,
  `pontoperigoId` INT NOT NULL,
  PRIMARY KEY (`perigoId`, `pontoperigoId`),
  INDEX `fk_Perigos_has_pontodeperigo_pontodeperigo1_idx` (`pontoperigoId` ASC) VISIBLE,
  INDEX `fk_Perigos_has_pontodeperigo_Perigos1_idx` (`perigoId` ASC) VISIBLE,
  CONSTRAINT `fk_Perigos_has_pontodeperigo_Perigos1`
    FOREIGN KEY (`perigoId`)
    REFERENCES `nr12`.`perigo` (`id`),
  CONSTRAINT `fk_Perigos_has_pontodeperigo_pontodeperigo1`
    FOREIGN KEY (`pontoperigoId`)
    REFERENCES `nr12`.`pontoperigo` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`risco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`risco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`perigorisco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`perigorisco` (
  `perigo` INT NOT NULL,
  `risco` INT NOT NULL,
  PRIMARY KEY (`perigo`, `risco`),
  INDEX `fk_perigos_has_riscos_riscos1_idx` (`risco` ASC) VISIBLE,
  INDEX `fk_perigos_has_riscos_perigos1_idx` (`perigo` ASC) VISIBLE,
  CONSTRAINT `fk_perigos_has_riscos_perigos1`
    FOREIGN KEY (`perigo`)
    REFERENCES `nr12`.`perigo` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_perigos_has_riscos_riscos1`
    FOREIGN KEY (`risco`)
    REFERENCES `nr12`.`risco` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`perigostipomaquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`perigostipomaquina` (
  `perigos_id` INT NOT NULL,
  `tipomaquina_id` INT NOT NULL,
  PRIMARY KEY (`perigos_id`, `tipomaquina_id`),
  INDEX `fk_perigos_has_tipomaquina_tipomaquina1_idx` (`tipomaquina_id` ASC) VISIBLE,
  INDEX `fk_perigos_has_tipomaquina_perigos1_idx` (`perigos_id` ASC) VISIBLE,
  CONSTRAINT `fk_perigos_has_tipomaquina_perigos1`
    FOREIGN KEY (`perigos_id`)
    REFERENCES `nr12`.`perigo` (`id`),
  CONSTRAINT `fk_perigos_has_tipomaquina_tipomaquina1`
    FOREIGN KEY (`tipomaquina_id`)
    REFERENCES `nr12`.`tipomaquina` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`respostadispositivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`respostadispositivo` (
  `dispositivoId` INT NOT NULL,
  `perguntaId` INT NOT NULL,
  `respostaId` INT NOT NULL,
  PRIMARY KEY (`dispositivoId`, `perguntaId`),
  INDEX `fk_dispositivosemergencia_has_perguntas_perguntas1_idx` (`perguntaId` ASC) VISIBLE,
  INDEX `fk_dispositivosemergencia_has_perguntas_dispositivosemergen_idx` (`dispositivoId` ASC) VISIBLE,
  INDEX `fk_resposta_dispositivo_resposta1_idx` (`respostaId` ASC) VISIBLE,
  CONSTRAINT `fk_dispositivosemergencia_has_perguntas_dispositivosemergencia1`
    FOREIGN KEY (`dispositivoId`)
    REFERENCES `nr12`.`dispositivo` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_dispositivosemergencia_has_perguntas_perguntas1`
    FOREIGN KEY (`perguntaId`)
    REFERENCES `nr12`.`pergunta` (`id`),
  CONSTRAINT `fk_resposta_dispositivo_resposta1`
    FOREIGN KEY (`respostaId`)
    REFERENCES `nr12`.`resposta` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`riscointervencao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`riscointervencao` (
  `riscoId` INT NOT NULL,
  `intervencaoId` INT NOT NULL,
  PRIMARY KEY (`riscoId`, `intervencaoId`),
  INDEX `fk_riscointervencao_risco1_idx` (`riscoId` ASC) VISIBLE,
  INDEX `fk_riscointervencao_intervencao1` (`intervencaoId` ASC) VISIBLE,
  CONSTRAINT `fk_riscointervencao_intervencao1`
    FOREIGN KEY (`intervencaoId`)
    REFERENCES `nr12`.`intervencao` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_riscointervencao_risco1`
    FOREIGN KEY (`riscoId`)
    REFERENCES `nr12`.`risco` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`riscopontoperigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`riscopontoperigo` (
  `riscoId` INT NOT NULL,
  `pontoperigoId` INT NOT NULL,
  PRIMARY KEY (`riscoId`, `pontoperigoId`),
  INDEX `fk_riscos_has_pontoperigo_pontoperigo1_idx` (`pontoperigoId` ASC) VISIBLE,
  INDEX `fk_riscos_has_pontoperigo_riscos1_idx` (`riscoId` ASC) VISIBLE,
  CONSTRAINT `fk_riscos_has_pontoperigo_pontoperigo1`
    FOREIGN KEY (`pontoperigoId`)
    REFERENCES `nr12`.`pontoperigo` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_riscos_has_pontoperigo_riscos1`
    FOREIGN KEY (`riscoId`)
    REFERENCES `nr12`.`risco` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`sistemaseguranca2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`sistemaseguranca2` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`sistemaseguranca2intervencao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`sistemaseguranca2intervencao` (
  `sistemaseguranca2Id` INT NOT NULL,
  `intervencaoId` INT NOT NULL,
  PRIMARY KEY (`intervencaoId`, `sistemaseguranca2Id`),
  INDEX `fk_sistemaseguranca2intervencao_sistemaseguranca21_idx` (`sistemaseguranca2Id` ASC) VISIBLE,
  INDEX `fk_sistemaseguranca2intervencao_intervencao1` (`intervencaoId` ASC) VISIBLE,
  CONSTRAINT `fk_sistemaseguranca2intervencao_intervencao1`
    FOREIGN KEY (`intervencaoId`)
    REFERENCES `nr12`.`intervencao` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_sistemaseguranca2intervencao_sistemaseguranca21`
    FOREIGN KEY (`sistemaseguranca2Id`)
    REFERENCES `nr12`.`sistemaseguranca2` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`sistemasegurancaintervencao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`sistemasegurancaintervencao` (
  `sistemasegurancaId` INT NOT NULL,
  `intervencaoId` INT NOT NULL,
  PRIMARY KEY (`sistemasegurancaId`, `intervencaoId`),
  INDEX `fk_sistemasegurancaintervencao_sistemaseguranca1_idx` (`sistemasegurancaId` ASC) VISIBLE,
  INDEX `fk_sistemasegurancaintervencao_intervencao1` (`intervencaoId` ASC) VISIBLE,
  CONSTRAINT `fk_sistemasegurancaintervencao_intervencao1`
    FOREIGN KEY (`intervencaoId`)
    REFERENCES `nr12`.`intervencao` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_sistemasegurancaintervencao_sistemaseguranca1`
    FOREIGN KEY (`sistemasegurancaId`)
    REFERENCES `nr12`.`sistemaseguranca` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`disposicoesfinais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`disposicoesfinais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nr12`.`disposicoesfinaislaudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nr12`.`disposicoesfinaislaudo` (
  `disposicoesfinaisId` INT NOT NULL,
  `laudoId` INT NOT NULL,
  PRIMARY KEY (`disposicoesfinaisId`, `laudoId`),
  INDEX `fk_disposicoesfinaislaudo_laudo1_idx` (`laudoId` ASC) VISIBLE,
  CONSTRAINT `fk_disposicoesfinaislaudo_disposicoesfinais1`
    FOREIGN KEY (`disposicoesfinaisId`)
    REFERENCES `nr12`.`disposicoesfinais` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_disposicoesfinaislaudo_laudo1`
    FOREIGN KEY (`laudoId`)
    REFERENCES `nr12`.`laudo` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb3;

USE `nr12`;

DELIMITER $$
USE `nr12`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nr12`.`sistemaseguranca_AFTER_DELETE`
AFTER DELETE ON `nr12`.`sistemaseguranca`
FOR EACH ROW
BEGIN
	DELETE FROM sistemaseguranca2 WHERE sistemaseguranca2.id = OLD.id;
END$$

USE `nr12`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nr12`.`sistemaseguranca_AFTER_INSERT`
AFTER INSERT ON `nr12`.`sistemaseguranca`
FOR EACH ROW
BEGIN
  INSERT INTO nr12.sistemaseguranca2 (nome, descricao) SELECT nome, descricao FROM nr12.sistemaseguranca ORDER BY id DESC LIMIT 1;
END$$

USE `nr12`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nr12`.`sistemaseguranca_AFTER_UPDATE`
AFTER UPDATE ON `nr12`.`sistemaseguranca`
FOR EACH ROW
BEGIN
	UPDATE sistemaseguranca2 SET sistemaseguranca2.nome = NEW.nome, sistemaseguranca2.descricao = NEW.descricao WHERE sistemaseguranca2.id = OLD.id;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
