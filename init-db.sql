-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Nov 06, 2025 at 04:43 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
CREATE SCHEMA IF NOT EXISTS `quizzapp`;
USE `quizzapp`;
--
-- Database: `quizzapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` varchar(255) NOT NULL,
  `correct` bit(1) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `question_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `correct`, `text`, `question_id`) VALUES
('01295261-e196-49e8-82ad-f6112b5511eb', b'0', 'Sviluppo incrementale e rilascio anticipato', '90e62210-3ac2-435e-956e-4edfa519581f'),
('02ae2ca9-8355-4901-9c30-ddc36ce7c5df', b'0', 'MainComponent', '9153b5b8-f5ef-4547-8cb7-346da796cf3a'),
('02da6bbd-6a3e-40c8-b033-baba83f82144', b'0', 'Model-View-Service', 'ecf9fe5a-5379-486c-b177-866af2bc58ef'),
('03252c2b-a70f-45ac-a8a5-8fe3b6ffe6e9', b'0', 'Condurre test di accettazione con il cliente', '1d679231-9be8-4907-b864-357e011ec0fd'),
('05fa62d8-1b01-4900-90eb-0305178e139e', b'1', 'Scrivere i test prima di scrivere il codice', '1d679231-9be8-4907-b864-357e011ec0fd'),
('060ad4d1-1e31-445e-aac7-e5f9e60893f0', b'0', 'ng new service', '66c4279a-ddc1-445a-817d-d990bc9c887c'),
('08388be4-55a5-4e52-9b6a-e094a10a5238', b'1', 'Un\'area nel template in cui viene inserito il contenuto fornito dal componente genitore', 'ab9203c2-6f9b-4511-a0a5-bc1b60ef413b'),
('0a7a547c-f4cd-431f-aae4-43510b497de9', b'1', 'ng generate module', 'ff17044b-fd51-496d-99a5-c65308053b8b'),
('0b0db75a-efea-4409-9ae1-5f52f8e32b0b', b'0', 'Un\'interfaccia per la comunicazione tra componenti', 'e77518ca-2332-4c58-bedc-b5c4732b5076'),
('0c29aa33-0bcb-4356-b201-7d882075dd18', b'0', 'Adaptive, Goal-oriented, Innovative, Learning, Efficient', '2da08db6-38f0-45df-8480-315f6730468a'),
('100d55e0-c02f-4f3e-b0f7-97664b4315b3', b'0', 'La comunicazione tra componenti genitore e figlio', '65a4bb18-1744-465a-9bd0-b7556bd929fa'),
('1095c72a-a515-48fd-adbc-7e3049d792f4', b'1', 'La quantità di lavoro completato dal team in un singolo sprint', 'fba4fc9e-1621-4b33-8c43-b791ad99d590'),
('122e6501-4272-41f5-94b5-579a74a0ea00', b'1', 'ng test', '1efd2fcc-3692-430a-ac8b-245ff3746f1c'),
('138feb28-76fa-473f-8292-c8fa42087d57', b'0', 'Un\'interfaccia per la comunicazione tra componenti', 'b2ea9a2c-9cba-4f08-8b6e-d136cdff6048'),
('13a10638-41dd-47d5-b2ea-0d5f7d484e30', b'1', 'La quantità di lavoro completato dal team in un singolo sprint', 'ce66ba84-a36e-43a1-b81b-d86bb3ee028e'),
('143f7cc5-542a-4345-b1a3-0528c071a977', b'1', 'Condividere lo stato di avanzamento del lavoro e identificare eventuali ostacoli', 'f7a0a0ec-d7b3-4827-8fb3-6b9c12e7128c'),
('14581def-11d3-4f9d-bdf5-03e3841542b0', b'0', 'Una classe per la creazione di modelli', 'ab9203c2-6f9b-4511-a0a5-bc1b60ef413b'),
('15011d4a-aaf5-45ab-91e1-77b333d4f714', b'0', 'ng new module', 'ff17044b-fd51-496d-99a5-c65308053b8b'),
('18b49e51-76b8-4b99-b233-c2061b161d6c', b'0', 'Stabilisce le date di rilascio e gestisce il budget', '297b0851-72e9-47da-b2f0-39dd19978c55'),
('1c2d0168-7bf7-4ff5-9d50-0fe710c8b18d', b'0', 'La validazione dei dati inseriti in un form', '665167be-1f85-4539-9305-b2e68a95cfd1'),
('1c9ebdc9-aa2a-4a18-ad23-73ad0c4f531d', b'1', 'AppComponent', '9153b5b8-f5ef-4547-8cb7-346da796cf3a'),
('1daf03b5-280c-4d26-ab13-dbd131a8e915', b'0', 'Definire i requisiti del sistema e pianificare le attività', 'e65e7a8c-3819-4e90-89f5-57f505e18301'),
('1e346ac5-0f9d-4bd3-a7b7-69f119986cae', b'0', 'Un insieme di metodi per la manipolazione del DOM', 'd6e12a50-2d9b-46f9-924a-6bf39d7d3a73'),
('1eaa1891-3e1a-4696-a54a-56ba5d1d7535', b'0', 'Model-View-Container', 'ecf9fe5a-5379-486c-b177-866af2bc58ef'),
('1f94f8b1-6a71-4196-a58c-bdaac89e12c4', b'0', 'package.json', '69c11422-a5c4-44f0-ae73-3cb2babfc061'),
('2157e2a9-2ff9-4117-ab49-2415302e08b2', b'0', 'Stabilire le priorità del progetto', 'f5ab69b0-a4d2-4b18-a466-223bf8886b4a'),
('21bfe461-e719-4af5-a8be-c7a8cc979ebe', b'1', 'Garantisce l\'applicazione corretta dei principi AGILE e rimuove gli ostacoli', 'aa12f646-412a-4dce-9fd4-477d1adad7ec'),
('22885dca-be2a-4905-97d2-013632d22e03', b'0', 'Java', 'abcfb7d6-c455-47a5-b5e2-51e022f15085'),
('23066b74-9895-4f96-b2cc-cbe77fe3fef0', b'0', 'ng create component --style=css', '4e82a97e-ab79-442a-8727-daf7b3a13bbd'),
('247a980f-7eff-4c33-9f3d-1ea262ba39d1', b'0', 'Una classe per la manipolazione dei dati', 'f2d77ee3-cc6c-4758-8250-7373e32fa279'),
('2812d9d8-e8ae-41e6-9c38-131d668f450f', b'0', 'ng install --prod', '2374ff4e-656f-44af-b1d5-9c287bebce96'),
('29582a60-19d3-439c-8c53-1a9249dfb0f9', b'0', 'Rivedere e approvare i documenti di specifica', 'f7a0a0ec-d7b3-4827-8fb3-6b9c12e7128c'),
('2b2b4ea8-5c6f-437a-bf93-d786e173312c', b'0', 'ng serve --prod', '2374ff4e-656f-44af-b1d5-9c287bebce96'),
('2b367a59-bdff-4b8c-aa99-018bf0e5c947', b'0', 'Un insieme di metodi per la validazione dei form', 'e77518ca-2332-4c58-bedc-b5c4732b5076'),
('2bd672e6-0014-4ff9-a3d5-f749712e5fac', b'0', 'C#', 'abcfb7d6-c455-47a5-b5e2-51e022f15085'),
('2bd9d402-bf54-4406-a53c-2f1ad915668b', b'0', 'Pianificare le attività per l\'intera durata del progetto', 'f7a0a0ec-d7b3-4827-8fb3-6b9c12e7128c'),
('2c9d75f1-7bf3-4f66-9193-7f475263538d', b'0', 'Coordina il lavoro del team e rimuove gli ostacoli', '0925a22a-8929-4c15-9ee0-81a978e18c23'),
('2dbe9d84-fb41-49e5-972e-42a54ce16765', b'1', 'Semprissimo', '697eea3e-ace6-41e2-b174-de1493172c0a'),
('2e3daa73-60d6-486d-9111-6300cb215045', b'0', 'Pianificazione dettagliata e documentazione approfondita', '90e62210-3ac2-435e-956e-4edfa519581f'),
('2ebc13de-3b1d-4439-b82b-76aaa9891b07', b'1', 'ng generate component --style=css', '4e82a97e-ab79-442a-8727-daf7b3a13bbd'),
('2fad5b2a-dcca-46de-aa5e-8d5cfcb72dab', b'0', 'Sviluppa il codice e conduce i test', '297b0851-72e9-47da-b2f0-39dd19978c55'),
('2ff5bad3-a611-408e-9c7d-9fca06730c87', b'0', 'Una classe per la gestione dei dati', 'e2f883dd-5c90-4b7a-82a4-d3bce7ce4cc3'),
('3115e561-1798-4612-97e5-8a4a6118e0aa', b'1', 'Un periodo di tempo fisso in cui viene sviluppato un insieme di funzionalità', '98b62da2-97ac-41a0-a616-733cb194ba97'),
('31360191-87b7-4603-b7f4-53b96c874bbb', b'0', 'Il tempo richiesto per completare una singola user story', 'fba4fc9e-1621-4b33-8c43-b791ad99d590'),
('31666599-c145-411e-893b-c6a5643bee4f', b'1', 'Una breve descrizione delle funzionalità dal punto di vista dell\'utente', '0a9ca29d-c41e-4134-b7f1-55580439b41f'),
('31e4c1dd-788d-49a4-acbe-fad9504d6dbe', b'0', 'Sviluppa il codice e conduce i test', 'f57f1648-3a9f-40aa-90ea-7efb33f7e166'),
('32facc07-b097-4045-8bce-ca0efdc889d9', b'0', 'Automatizzare il processo di testing', 'e5823248-335a-4522-af08-3cb188162dfa'),
('33ec05cc-04e8-4301-a4bd-f1966e538ad3', b'0', 'Un documento che descrive le specifiche tecniche del sistema', '98b62da2-97ac-41a0-a616-733cb194ba97'),
('35df4489-1e50-4592-a8a5-5ad520a8a0a3', b'0', 'ng build service', '66c4279a-ddc1-445a-817d-d990bc9c887c'),
('36303a16-161c-4458-8127-c86246f6551b', b'0', 'Una classe per la creazione di modelli', '41558306-8650-485f-86bf-1f5899ce7577'),
('36581de3-deca-4b72-b4b1-a6e7a8c6f5be', b'1', 'La gestione degli eventi generati da un elemento HTML', '1652afa4-ff8c-4fa4-a177-8ba54ff9f505'),
('37119881-808b-44b2-bd53-d98691999ef6', b'1', 'Un costrutto per estendere il comportamento degli elementi HTML', 'c6c8b629-715b-4f63-a4fb-0d75754c3d7a'),
('38fa734a-b498-430f-9c5c-71f3e98621db', b'0', 'Un\'attività per misurare l\'efficienza del team', '98b62da2-97ac-41a0-a616-733cb194ba97'),
('39b3270f-490a-4f54-9d62-9663b1c5f6e0', b'0', 'Stabilisce le date di rilascio e gestisce il budget', '0925a22a-8929-4c15-9ee0-81a978e18c23'),
('39fe5026-ac84-46e6-b7c3-9f6227a6c2af', b'0', 'ng build module', 'ff17044b-fd51-496d-99a5-c65308053b8b'),
('3a7477b1-6318-47cd-9126-fa688c54cb48', b'0', 'Automatizzare il processo di testing', '1d679231-9be8-4907-b864-357e011ec0fd'),
('3b5ce62a-8f6c-42a8-8b19-da500c98c26c', b'0', 'Un insieme di metodi per la manipolazione del DOM', '41558306-8650-485f-86bf-1f5899ce7577'),
('3ba9ebb5-e309-4c6d-93c1-3dd4e605d7a5', b'0', 'Una classe per la creazione di modelli', '253388d7-db45-4b44-940e-a80c50d95837'),
('3d0290c3-b36b-4425-ad89-e384f1fba5b5', b'1', 'Garantisce l\'applicazione corretta dei principi AGILE e rimuove gli ostacoli', 'f57f1648-3a9f-40aa-90ea-7efb33f7e166'),
('3dd93f2d-d067-457f-ac38-ddb123beca24', b'0', 'Stabilisce le date di rilascio e gestisce il budget', 'f57f1648-3a9f-40aa-90ea-7efb33f7e166'),
('3e31536e-4e91-460d-82f2-59d12643a81d', b'0', 'Un insieme di metodi per la validazione dei form', 'b2ea9a2c-9cba-4f08-8b6e-d136cdff6048'),
('3e561dcb-6087-4cc3-8741-9149593cbc23', b'0', 'Un\'interfaccia per la comunicazione tra componenti', 'e2f883dd-5c90-4b7a-82a4-d3bce7ce4cc3'),
('3f939ac4-3fea-41b2-97eb-6942f91581d4', b'0', 'Stabilire i requisiti del sistema e definire le milestone', 'f7a0a0ec-d7b3-4827-8fb3-6b9c12e7128c'),
('40b5bd22-252d-4b3e-9a1d-2dd90ca0e25e', b'0', 'JavaScript', 'abcfb7d6-c455-47a5-b5e2-51e022f15085'),
('40f94f8f-cedd-49f1-93d6-ce036844996c', b'0', 'Sviluppa il codice e conduce i test', '0925a22a-8929-4c15-9ee0-81a978e18c23'),
('42af748f-36ff-4931-992c-3115024c766b', b'0', 'Effettuare i test solo alla fine dello sviluppo', '1d679231-9be8-4907-b864-357e011ec0fd'),
('432c695a-3d72-4c95-8918-a0286d1b8bc8', b'0', 'Una metrica per misurare la qualità del codice', '0a9ca29d-c41e-4134-b7f1-55580439b41f'),
('436ff589-9df3-41f1-a5b2-d0428cc16fa4', b'0', 'Un\'interfaccia per la comunicazione tra componenti', 'ab9203c2-6f9b-4511-a0a5-bc1b60ef413b'),
('46d4752a-11b2-49f8-8d4d-ebbc26bc9b34', b'0', 'ng create module', 'ff17044b-fd51-496d-99a5-c65308053b8b'),
('47b6e6b0-ba44-4961-95a1-81e0b116a52e', b'0', 'Una classe per la manipolazione dei dati', 'e77518ca-2332-4c58-bedc-b5c4732b5076'),
('48e5214d-cbba-4654-9d14-3552f4ca7b12', b'1', 'AppModule', '38afcfb1-5353-412a-bc97-a5310b7acf84'),
('4c7a7b35-a34d-4944-82d5-4f6f3819ed34', b'1', 'Valutare il lavoro svolto durante lo sprint e identificare gli aspetti da migliorare', 'f5ab69b0-a4d2-4b18-a466-223bf8886b4a'),
('4cf8bba9-4cd9-4550-ade7-80c41204eefb', b'0', 'ng run', 'd9ed1660-d2f1-424c-bc0d-6023db8ac2c0'),
('4eaef17c-e8b4-42f7-8fea-9819bc7e4176', b'0', 'CoreModule', '38afcfb1-5353-412a-bc97-a5310b7acf84'),
('55030d2d-09b2-445d-a1ca-478a0caa6629', b'0', 'Un documento che descrive le specifiche tecniche del sistema', 'c2601089-f4be-4fa6-9e49-513731fd26d9'),
('55361f3e-6cf6-4487-84e4-236966bcaae7', b'1', 'ng generate component --style=sass', '0ae30610-a5e1-481e-9418-993b7dc79305'),
('5780cbbf-d25b-4a99-8879-0d2b5c45fdca', b'0', 'L\'accesso a database relazionali', '301fcd0e-bb53-44c2-bd63-ca45f22eeffc'),
('58eb25e8-54ef-4dca-a9b8-ef9cd3fa5b2e', b'0', 'La comunicazione tra componenti padre e figlio', 'aee238e1-5a9f-43ee-b993-23f47b61cc3a'),
('5978efdc-476b-425e-b825-65bf9140e34a', b'0', 'ng build component', '999908ea-3ba2-421a-861d-9af40301dcc8'),
('5f62869c-1800-4709-9fa2-2006603ec927', b'0', 'Standardizzazione dei processi e controllo rigoroso', '90e62210-3ac2-435e-956e-4edfa519581f'),
('5f92ce1d-a6ba-4b4a-9fca-640bd62015b5', b'0', 'Adaptive, Goal-oriented, Innovative, Learning, Efficient', '9bef80f8-e226-496e-8ef2-1ddbbd37bce7'),
('5f9e4fbd-886e-4ed7-80fe-4f5384fb3676', b'1', 'La possibilità di fornire le dipendenze a un componente', '665167be-1f85-4539-9305-b2e68a95cfd1'),
('618af6ee-16d6-4db8-aa19-0b9fee20d36b', b'0', 'La validazione dei dati inseriti in un form', '65a4bb18-1744-465a-9bd0-b7556bd929fa'),
('66b6f57c-e043-44dd-ae91-39749a2865dc', b'0', 'La creazione di componenti personalizzati', '665167be-1f85-4539-9305-b2e68a95cfd1'),
('66cff901-947d-4aa1-821b-a343bba88dcb', b'0', 'Un\'interfaccia per la comunicazione tra componenti', 'a1ff29a3-7803-43e3-97a6-07717f0e5d53'),
('67eb1afe-5874-413f-ba61-47983f8b1c72', b'0', 'Effettuare i test solo alla fine dello sviluppo', 'e5823248-335a-4522-af08-3cb188162dfa'),
('6cb8fa3d-b6cd-4e4d-a8f7-54bb53a81dd2', b'0', 'L\'organizzazione dei file di un progetto', '301fcd0e-bb53-44c2-bd63-ca45f22eeffc'),
('6e8754cc-856c-4413-ba11-f466373bea59', b'0', 'Un diagramma che mostra le relazioni tra le classi di un sistema', 'dbd309b3-0734-4cc0-a4f0-9f28340715d0'),
('6fcb0994-b2db-44bf-b9bc-41043df0ea5f', b'0', 'ng serve test', '1efd2fcc-3692-430a-ac8b-245ff3746f1c'),
('70631357-f779-4ba7-98eb-5152ddb31147', b'0', 'MainModule', '38afcfb1-5353-412a-bc97-a5310b7acf84'),
('7076cec1-4777-4cef-a26b-0e55979556d9', b'0', 'ng new component --style=sass', '0ae30610-a5e1-481e-9418-993b7dc79305'),
('70a17550-6227-4b96-8b08-29ace453daf6', b'1', 'npm install', 'b3ce9b62-ac92-4e9c-a5cb-5dec914b9dc2'),
('71d3c4a6-7d7b-4b2a-a63d-d8f4708094d9', b'0', 'La velocità massima di connessione alla rete', 'ce66ba84-a36e-43a1-b81b-d86bb3ee028e'),
('73fa2697-b6e5-45f7-8920-fee8fc3ca4f1', b'1', 'La sincronizzazione bidirezionale tra il modello e la vista', 'aee238e1-5a9f-43ee-b993-23f47b61cc3a'),
('7507643b-7ae3-4288-941e-8c6fe49a93c8', b'0', 'ng create component', '999908ea-3ba2-421a-861d-9af40301dcc8'),
('7a730670-83b1-4377-8737-c94a2d0a7c34', b'1', 'Valutare il lavoro svolto durante lo sprint e identificare gli aspetti da migliorare', 'e65e7a8c-3819-4e90-89f5-57f505e18301'),
('7aea9249-662c-4516-8384-c402ad8a207c', b'0', 'ng run test', '1efd2fcc-3692-430a-ac8b-245ff3746f1c'),
('7ee1afd4-a36d-474e-a3f2-8417e288abe8', b'1', 'Un periodo di tempo fisso in cui viene sviluppato un insieme di funzionalità', 'c2601089-f4be-4fa6-9e49-513731fd26d9'),
('8193db4c-2bbf-4d65-8aeb-7897eceeb3cd', b'0', 'ng new component', '999908ea-3ba2-421a-861d-9af40301dcc8'),
('829d96a7-7a8d-429f-a8e7-0278c316d3e8', b'0', 'npm update', 'b3ce9b62-ac92-4e9c-a5cb-5dec914b9dc2'),
('8336ad63-5bac-4582-955b-2a16a774e893', b'0', 'Sviluppa il codice e conduce i test', 'aa12f646-412a-4dce-9fd4-477d1adad7ec'),
('852f47de-d49b-495e-9c69-be124c0fbe96', b'0', 'Un\'interfaccia per la comunicazione tra componenti', '41558306-8650-485f-86bf-1f5899ce7577'),
('85f80a7c-818d-473d-93ba-f4288620d60d', b'0', 'Valutare la qualità del codice prodotto', 'f5ab69b0-a4d2-4b18-a466-223bf8886b4a'),
('862feef0-1ac8-40bb-aac1-53daca135ab3', b'0', 'ng update', 'b3ce9b62-ac92-4e9c-a5cb-5dec914b9dc2'),
('8648f215-7d20-4fd8-bbbf-8944d98cf740', b'0', 'Condurre test di accettazione con il cliente', 'e5823248-335a-4522-af08-3cb188162dfa'),
('876f657d-37e3-4ad7-a255-9e04f5f86cd6', b'0', 'Il tempo richiesto per completare una singola user story', 'ce66ba84-a36e-43a1-b81b-d86bb3ee028e'),
('88ccc8e3-35be-4bec-bf46-3f38a938ccf8', b'0', 'Un\'analisi dei rischi del progetto', '98b62da2-97ac-41a0-a616-733cb194ba97'),
('89f08ad4-4a8a-4bb2-b182-98504aa3d7ca', b'1', 'La creazione di applicazioni web single-page', '301fcd0e-bb53-44c2-bd63-ca45f22eeffc'),
('8a47db34-5790-4cf2-8ebc-efed0cf8ede8', b'0', 'La gestione degli errori nel codice', '1652afa4-ff8c-4fa4-a177-8ba54ff9f505'),
('8a550985-4dea-4490-aedb-90749078b973', b'0', 'Un\'interfaccia per la comunicazione tra componenti', 'b1709440-0e2b-416f-ae4f-885ad765b0ee'),
('8b3bbf64-3869-4126-b353-7e05e3d0f194', b'1', 'Una pagina o uno stato specifico dell\'applicazione', 'e77518ca-2332-4c58-bedc-b5c4732b5076'),
('8e1f7e54-6741-4471-9101-4334438eca95', b'0', 'Stabilire i requisiti del sistema e definire le milestone', 'bb9334e4-b3ed-4d57-ac5a-309ee2fb53dc'),
('9178a97d-c09b-44c2-9392-f02e6ec847f3', b'1', 'ng serve', 'd9ed1660-d2f1-424c-bc0d-6023db8ac2c0'),
('926eb3e9-67cd-422b-b0ab-3dbf7f52636b', b'1', 'Una breve descrizione delle funzionalità dal punto di vista dell\'utente', 'dbd309b3-0734-4cc0-a4f0-9f28340715d0'),
('92b0d357-6ba1-4842-80bd-9a9bfe7fc52b', b'1', 'Scrivere i test prima di scrivere il codice', 'e5823248-335a-4522-af08-3cb188162dfa'),
('92dbfcc2-f50c-43be-a5b1-d0b3a8104ecf', b'0', 'Una direttiva per la creazione di iterazioni in un template HTML', 'd6e12a50-2d9b-46f9-924a-6bf39d7d3a73'),
('9302bea4-318c-4b8d-acff-0d1a54d91c29', b'0', 'ng new component --style=css', '4e82a97e-ab79-442a-8727-daf7b3a13bbd'),
('94578184-2352-494f-9331-be40b5bf32f0', b'0', 'Adaptive, Guided, Integrated, Lightweight, Efficient', '2da08db6-38f0-45df-8480-315f6730468a'),
('94ecc012-dc2f-469f-a5a4-b7ef7848909c', b'0', 'La creazione di componenti personalizzati', 'aee238e1-5a9f-43ee-b993-23f47b61cc3a'),
('951a687f-42f1-48d2-9834-8208ecf4d188', b'0', 'Adaptive, Guided, Iterative, Learning, Efficient', '9bef80f8-e226-496e-8ef2-1ddbbd37bce7'),
('977e32a6-6518-498b-9b9c-87a5e682a5b2', b'0', 'Una classe per la creazione di modelli', 'a1ff29a3-7803-43e3-97a6-07717f0e5d53'),
('9bb35255-2fcd-4621-b27d-7330b4700bd8', b'0', 'RootModule', '38afcfb1-5353-412a-bc97-a5310b7acf84'),
('9ebb0407-3675-4239-b5d9-fb76071f67af', b'1', 'Una direttiva per la gestione degli stili CSS in un elemento HTML', '253388d7-db45-4b44-940e-a80c50d95837'),
('9ebef643-98c3-4e00-9cb7-eb2229c5200b', b'0', 'La capacità di adattarsi al cambiamento', 'fba4fc9e-1621-4b33-8c43-b791ad99d590'),
('9ec20c3d-3aad-490f-8f09-6821288d8630', b'1', 'ng generate component --style=less', 'b09c9812-70c7-463c-a662-e4979bcf391b'),
('9eecc7e5-1427-4c10-ab99-2ee90e8a00f5', b'0', 'Una classe per la manipolazione dei dati', 'b1709440-0e2b-416f-ae4f-885ad765b0ee'),
('9fdf3d72-4ef7-443a-a606-f27c40f676d1', b'0', 'Adaptive, Guided, Iterative, Learning, Efficient', '2da08db6-38f0-45df-8480-315f6730468a'),
('a583c162-25c9-48b5-87bc-f3b07f239230', b'0', 'index.html', '69c11422-a5c4-44f0-ae73-3cb2babfc061'),
('a67379c9-8d6c-406b-84f6-c349edb2ba82', b'0', 'Una classe per la gestione dei dati', 'b2ea9a2c-9cba-4f08-8b6e-d136cdff6048'),
('a7005222-6397-4d8e-9c74-a635f1b47dc1', b'0', 'ng create component --style=sass', '0ae30610-a5e1-481e-9418-993b7dc79305'),
('a74ed71f-ca3e-4525-a413-f3ad4970cae1', b'1', 'angular.json', '69c11422-a5c4-44f0-ae73-3cb2babfc061'),
('aa64a1e8-383f-41e6-901d-8dc1e2c53c62', b'1', 'Sempre', '697eea3e-ace6-41e2-b174-de1493172c0a'),
('ad6da967-b1ba-4550-b13b-f5facaa04571', b'0', 'Un insieme di metodi per la manipolazione del DOM', 'e2f883dd-5c90-4b7a-82a4-d3bce7ce4cc3'),
('af3238b0-e1f7-4e14-ba39-7b4ca465b68f', b'1', 'Collaborazione con il cliente e risposta al cambiamento', '90e62210-3ac2-435e-956e-4edfa519581f'),
('af8e57a3-776e-4225-9671-0e4ce7b4488b', b'1', 'TypeScript', 'abcfb7d6-c455-47a5-b5e2-51e022f15085'),
('b09dfbeb-f30d-49aa-a2a7-0b614a2306c5', b'1', 'ng build --prod', '2374ff4e-656f-44af-b1d5-9c287bebce96'),
('b2547380-d06d-4a54-b7e8-d5eef69f4107', b'0', 'main.ts', '69c11422-a5c4-44f0-ae73-3cb2babfc061'),
('b344d925-afb9-4aba-b436-bb0552908902', b'1', 'Una direttiva per la gestione delle classi CSS in un elemento HTML', 'a1ff29a3-7803-43e3-97a6-07717f0e5d53'),
('b3ab9085-2d6e-4464-b2e8-c1cfec629338', b'0', 'ng run --prod', '2374ff4e-656f-44af-b1d5-9c287bebce96'),
('b6079901-fd19-448d-8e8d-bd40a3f8c369', b'0', 'ng create component --style=less', 'b09c9812-70c7-463c-a662-e4979bcf391b'),
('b67d0e68-14ad-4997-98ed-548b3abcaded', b'1', 'Un evento che viene generato quando viene inviato un form', 'd6e12a50-2d9b-46f9-924a-6bf39d7d3a73'),
('b74afb9f-0edc-4072-95c2-b74e40cc7b74', b'1', 'Una direttiva per la creazione di iterazioni in un template HTML', 'b1709440-0e2b-416f-ae4f-885ad765b0ee'),
('b7f74343-4a75-4ac3-895a-0dc099863b0d', b'0', 'Stabilisce le priorità del prodotto e coordina le attività', 'aa12f646-412a-4dce-9fd4-477d1adad7ec'),
('b90f1146-1b73-426f-a981-056a5027c9e5', b'0', 'La capacità di adattarsi al cambiamento', 'ce66ba84-a36e-43a1-b81b-d86bb3ee028e'),
('b9ef0f73-c579-4a1d-b9c4-91e0352cae74', b'0', 'Un\'interfaccia per la comunicazione tra componenti', 'd6e12a50-2d9b-46f9-924a-6bf39d7d3a73'),
('bb0c118e-1209-4397-bff7-270d45245762', b'0', 'Pianificazione dettagliata e documentazione approfondita', '315377c6-b473-4d55-b8c4-04451d9315e9'),
('bb3b240a-5c26-4bc4-a89a-0bc0a6ad803f', b'1', 'Una direttiva per la gestione condizionale degli elementi HTML', '41558306-8650-485f-86bf-1f5899ce7577'),
('bbc5fa00-f5df-4417-a13e-4448219e98c9', b'0', 'Un diagramma che mostra le relazioni tra le classi di un sistema', '0a9ca29d-c41e-4134-b7f1-55580439b41f'),
('bce363e7-eba0-469f-932d-c21dd45799f3', b'0', 'ng create service', '66c4279a-ddc1-445a-817d-d990bc9c887c'),
('be00ccbc-fe1e-479d-82ac-2a4d13a0b28d', b'1', 'ng generate service', '66c4279a-ddc1-445a-817d-d990bc9c887c'),
('be7090af-272f-421e-8f9c-c10cf656797f', b'0', 'Sviluppo incrementale e rilascio anticipato', '315377c6-b473-4d55-b8c4-04451d9315e9'),
('bf538db9-3aba-4df0-8521-3f915af0a6f6', b'0', 'Un insieme di metodi per la manipolazione del DOM', '253388d7-db45-4b44-940e-a80c50d95837'),
('bfb9d45a-479e-485c-b4d6-1fbbf6e94415', b'0', 'Un\'interfaccia per la comunicazione tra componenti', 'f2d77ee3-cc6c-4758-8250-7373e32fa279'),
('c02feb08-1e01-4d31-8849-fd23301c328d', b'1', 'Adaptive, Goal-oriented, Iterative, Lean, Efficient', '9bef80f8-e226-496e-8ef2-1ddbbd37bce7'),
('c1fc62b1-a2bd-4a6e-a853-300f7ef56872', b'1', 'Model-View-Controller', 'ecf9fe5a-5379-486c-b177-866af2bc58ef'),
('c44b0cc7-3dad-4481-bc10-7277646bd6ed', b'0', 'Un insieme di metodi per la manipolazione del DOM', 'c6c8b629-715b-4f63-a4fb-0d75754c3d7a'),
('c514711b-27dd-40a9-a44c-08391fb373c2', b'0', 'Un insieme di metodi per la manipolazione del DOM', 'a1ff29a3-7803-43e3-97a6-07717f0e5d53'),
('c52d5429-9a7b-416c-a2bc-26683b98f7e2', b'0', 'Valutare la qualità del codice prodotto', 'e65e7a8c-3819-4e90-89f5-57f505e18301'),
('c6532f13-0ec6-4b05-9c0d-dabb5a5c30c8', b'0', 'ng start', 'd9ed1660-d2f1-424c-bc0d-6023db8ac2c0'),
('c80f2f85-5ba4-4fbb-afbf-bd0a556d09f9', b'0', 'ng build component --style=less', 'b09c9812-70c7-463c-a662-e4979bcf391b'),
('c9bcb0cd-89de-4b14-97b4-f434dd630069', b'1', 'Condividere lo stato di avanzamento del lavoro e identificare eventuali ostacoli', 'bb9334e4-b3ed-4d57-ac5a-309ee2fb53dc'),
('cab40254-9092-4158-a865-24e72aecadd5', b'0', 'La manipolazione del DOM in modo dinamico', '301fcd0e-bb53-44c2-bd63-ca45f22eeffc'),
('cb5dff40-f624-4442-a97f-2d923a976477', b'0', 'Definire i requisiti del sistema e pianificare le attività', 'f5ab69b0-a4d2-4b18-a466-223bf8886b4a'),
('cc1b3e8d-afff-4de7-84db-a8cc2afac5c8', b'0', 'Una metrica per misurare la qualità del codice', 'dbd309b3-0734-4cc0-a4f0-9f28340715d0'),
('cdb5b169-8e06-4806-a16a-a8344e0274b4', b'0', 'AppModule', '9153b5b8-f5ef-4547-8cb7-346da796cf3a'),
('d113d166-3bde-4328-98bc-6654f23c44c3', b'0', 'Coordina il lavoro del team e rimuove gli ostacoli', '297b0851-72e9-47da-b2f0-39dd19978c55'),
('d30d34ac-3c97-400c-844c-e35b3175d66a', b'0', 'Pianificare le attività per l\'intera durata del progetto', 'bb9334e4-b3ed-4d57-ac5a-309ee2fb53dc'),
('d41323ee-adfd-49c3-a4e2-cb67ab9089f0', b'1', 'Adaptive, Goal-oriented, Iterative, Lean, Efficient', '2da08db6-38f0-45df-8480-315f6730468a'),
('d44f6e4a-df9e-4c5a-bf25-b865090ba996', b'1', 'Un\'area nel template in cui viene visualizzato il contenuto dinamico delle diverse route', 'e2f883dd-5c90-4b7a-82a4-d3bce7ce4cc3'),
('d45038c2-50b5-46ac-8141-f23e64d2af41', b'0', 'Rivedere e approvare i documenti di specifica', 'bb9334e4-b3ed-4d57-ac5a-309ee2fb53dc'),
('d58487cd-807b-4904-bd5b-aac60c349c36', b'0', 'Un\'unità di test per verificare il corretto funzionamento del codice', 'c6c8b629-715b-4f63-a4fb-0d75754c3d7a'),
('d6644fe7-c1cd-4e73-a245-f5664356221b', b'0', 'Un insieme di metodi per la validazione dei form', 'f2d77ee3-cc6c-4758-8250-7373e32fa279'),
('d80700d0-a8ea-451a-b017-6c68102af325', b'0', 'La creazione di un form reattivo', '1652afa4-ff8c-4fa4-a177-8ba54ff9f505'),
('d909ccef-e71d-4730-8934-ca221f3cc000', b'1', 'Collaborazione con il cliente e risposta al cambiamento', '315377c6-b473-4d55-b8c4-04451d9315e9'),
('d915d250-8315-4a92-928b-87d86cf6d34b', b'0', 'Stabilisce le priorità del prodotto e coordina le attività', 'f57f1648-3a9f-40aa-90ea-7efb33f7e166'),
('dabe69fe-9750-4182-9705-ac4c862f3039', b'1', 'Rappresenta il cliente e definisce le priorità del prodotto', '297b0851-72e9-47da-b2f0-39dd19978c55'),
('dc6d3ef3-8714-4488-986f-d28b95aea163', b'0', 'Una tecnica per gestire i rischi nel progetto', 'dbd309b3-0734-4cc0-a4f0-9f28340715d0'),
('dc79b127-1d49-41eb-bf38-0a815ad2ee64', b'0', 'Un\'interfaccia per la comunicazione tra componenti', 'c6c8b629-715b-4f63-a4fb-0d75754c3d7a'),
('dca911d8-a62c-4a07-baab-13a83e3067e3', b'0', 'ng build test', '1efd2fcc-3692-430a-ac8b-245ff3746f1c'),
('deba9d9f-79bf-47f8-a420-f87b0dbb6a68', b'1', 'Un\'interfaccia a linea di comando per lo sviluppo di applicazioni Angular', 'b2ea9a2c-9cba-4f08-8b6e-d136cdff6048'),
('df7e8d8b-4889-4edb-bd56-c2a70761e199', b'0', 'Un\'interfaccia per la comunicazione tra componenti', '253388d7-db45-4b44-940e-a80c50d95837'),
('e1e18b18-c633-480a-8044-025deb2b1e6f', b'0', 'Adaptive, Guided, Integrated, Lightweight, Efficient', '9bef80f8-e226-496e-8ef2-1ddbbd37bce7'),
('e1f56967-9c37-4947-a33e-34e90eee6f4c', b'0', 'Stabilisce le date di rilascio e gestisce il budget', 'aa12f646-412a-4dce-9fd4-477d1adad7ec'),
('e2ca7a9f-8ee6-4ed5-9a76-f990c4e5df19', b'0', 'ng install', 'b3ce9b62-ac92-4e9c-a5cb-5dec914b9dc2'),
('e3fe2875-5a29-4c7b-bb51-15b8947cd898', b'0', 'ng new component --style=less', 'b09c9812-70c7-463c-a662-e4979bcf391b'),
('e4c89919-0274-45d1-ac74-79684c15bcb6', b'0', 'La comunicazione tra componenti fratelli', '665167be-1f85-4539-9305-b2e68a95cfd1'),
('e4fdbf6b-9f09-4a37-a409-a0992ecef1f5', b'0', 'RootComponent', '9153b5b8-f5ef-4547-8cb7-346da796cf3a'),
('e505ac6d-9751-4e2d-8f7a-228e5b7b3fcd', b'0', 'Standardizzazione dei processi e controllo rigoroso', '315377c6-b473-4d55-b8c4-04451d9315e9'),
('e5328a2b-acca-4423-b0ec-62b7ea70dd23', b'0', 'La velocità massima di connessione alla rete', 'fba4fc9e-1621-4b33-8c43-b791ad99d590'),
('e5d83a2e-11b7-4af5-9d52-085467f5bf55', b'1', 'La sincronizzazione tra il modello e la vista', '65a4bb18-1744-465a-9bd0-b7556bd929fa'),
('e70ca6c0-d594-4be4-bb67-cd1c26df6134', b'0', 'ng build', 'd9ed1660-d2f1-424c-bc0d-6023db8ac2c0'),
('e71284cb-f3c8-463e-8bf6-875fde78dbc8', b'0', 'Stabilire le priorità del progetto', 'e65e7a8c-3819-4e90-89f5-57f505e18301'),
('e7f5b443-0e82-44e2-86ab-aea90eaa9d36', b'0', 'Una tecnica per gestire i rischi nel progetto', '0a9ca29d-c41e-4134-b7f1-55580439b41f'),
('e9c4d93f-5810-41bc-b5d7-aa19b4e34329', b'1', 'Rappresenta il cliente e definisce le priorità del prodotto', '0925a22a-8929-4c15-9ee0-81a978e18c23'),
('e9e07c85-195a-4c11-b4b3-4b5cb962b096', b'1', 'ng generate component', '999908ea-3ba2-421a-861d-9af40301dcc8'),
('ea51a7f7-e6a6-4216-a7d0-52b5605d9c53', b'0', 'Un insieme di metodi per la validazione dei form', 'b1709440-0e2b-416f-ae4f-885ad765b0ee'),
('ed46bb14-2f00-465a-a59d-359bd52fc798', b'1', 'Una direttiva per la creazione di due-way data binding', 'f2d77ee3-cc6c-4758-8250-7373e32fa279'),
('ee94fe96-3275-493f-b32b-2f30f9172e46', b'0', 'La comunicazione tra componenti fratello', '1652afa4-ff8c-4fa4-a177-8ba54ff9f505'),
('ef05780e-c405-4039-a3df-6d483c3c756b', b'0', 'ng build component --style=css', '4e82a97e-ab79-442a-8727-daf7b3a13bbd'),
('f73df3b6-0c36-4170-8279-8ee589c19d6c', b'0', 'Un\'attività per misurare l\'efficienza del team', 'c2601089-f4be-4fa6-9e49-513731fd26d9'),
('f8d47467-fb15-4c2f-8a0f-e54f3cd8aa66', b'0', 'Un insieme di metodi per la manipolazione del DOM', 'ab9203c2-6f9b-4511-a0a5-bc1b60ef413b'),
('f93f776a-f9c6-4b96-9629-69795736f0b7', b'0', 'Model-View-Component', 'ecf9fe5a-5379-486c-b177-866af2bc58ef'),
('faa6240c-8d1e-4878-93bc-c344e97254e6', b'0', 'Un\'analisi dei rischi del progetto', 'c2601089-f4be-4fa6-9e49-513731fd26d9'),
('fc260e75-e0ed-4646-beae-d58fd5dfeb91', b'0', 'La validazione dei dati inseriti in un form', 'aee238e1-5a9f-43ee-b993-23f47b61cc3a'),
('feed88e6-8f6d-45a4-9842-db3e38926615', b'0', 'ng build component --style=sass', '0ae30610-a5e1-481e-9418-993b7dc79305'),
('fef261ba-b73b-4f7a-866e-3ef68ae9270d', b'0', 'La creazione di componenti personalizzati', '65a4bb18-1744-465a-9bd0-b7556bd929fa');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `quiz_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `title`, `quiz_id`) VALUES
('0925a22a-8929-4c15-9ee0-81a978e18c23', 'Qual è il ruolo del \\\"Product Owner\\\" nel framework AGILE?', '2508aaf1-e291-4a87-987a-a7a3410a05f3'),
('0a9ca29d-c41e-4134-b7f1-55580439b41f', 'Cosa rappresenta il concetto di \\\"user story\\\" nell\'AGILE?', 'b2972eff-22f2-41b6-90e3-daf8367d6a36'),
('0ae30610-a5e1-481e-9418-993b7dc79305', 'Qual è il comando per generare un componente con un file di stile SASS in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('1652afa4-ff8c-4fa4-a177-8ba54ff9f505', 'Cosa rappresenta il concetto di \\\"event binding\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('1d679231-9be8-4907-b864-357e011ec0fd', 'Qual è il concetto di base del \\\"test-driven development\\\" (TDD) nel framework AGILE?', '2508aaf1-e291-4a87-987a-a7a3410a05f3'),
('1efd2fcc-3692-430a-ac8b-245ff3746f1c', 'Qual è il comando per avviare i test unitari di un\'applicazione Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('2374ff4e-656f-44af-b1d5-9c287bebce96', 'Qual è il comando per effettuare il build di un\'applicazione Angular per la produzione?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('253388d7-db45-4b44-940e-a80c50d95837', 'Cosa rappresenta il concetto di \\\"ngStyle\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('297b0851-72e9-47da-b2f0-39dd19978c55', 'Qual è il ruolo del \\\"Product Owner\\\" nel framework AGILE?', 'b2972eff-22f2-41b6-90e3-daf8367d6a36'),
('2da08db6-38f0-45df-8480-315f6730468a', 'Cosa rappresenta l\'acronimo ‘AGILE’?', 'b2972eff-22f2-41b6-90e3-daf8367d6a36'),
('301fcd0e-bb53-44c2-bd63-ca45f22eeffc', 'Qual è il concetto principale di Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('315377c6-b473-4d55-b8c4-04451d9315e9', 'Qual è il principio chiave dello sviluppo AGILE?', '2508aaf1-e291-4a87-987a-a7a3410a05f3'),
('38afcfb1-5353-412a-bc97-a5310b7acf84', 'Qual è il modulo principale di Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('41558306-8650-485f-86bf-1f5899ce7577', 'Cosa rappresenta il concetto di \\\"ngIf\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('4e82a97e-ab79-442a-8727-daf7b3a13bbd', 'Qual è il comando per generare un componente con un file di stile separato in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('65a4bb18-1744-465a-9bd0-b7556bd929fa', 'Cosa rappresenta il concetto di \\\"data binding\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('665167be-1f85-4539-9305-b2e68a95cfd1', 'Cosa rappresenta il concetto di \\\"dependency injection\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('66c4279a-ddc1-445a-817d-d990bc9c887c', 'Qual è il comando per generare un servizio in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('697eea3e-ace6-41e2-b174-de1493172c0a', 'Forza milan', '5c35f299-e88b-4c43-886c-116c1a035f1c'),
('69c11422-a5c4-44f0-ae73-3cb2babfc061', 'Qual è il file principale di configurazione di un progetto Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('90e62210-3ac2-435e-956e-4edfa519581f', 'Qual è il principio chiave dello sviluppo AGILE?', 'b2972eff-22f2-41b6-90e3-daf8367d6a36'),
('9153b5b8-f5ef-4547-8cb7-346da796cf3a', 'Qual è il componente radice di un\'applicazione Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('98b62da2-97ac-41a0-a616-733cb194ba97', 'Cosa rappresenta il concetto di \\\"sprint\\\" nel framework AGILE?', '2508aaf1-e291-4a87-987a-a7a3410a05f3'),
('999908ea-3ba2-421a-861d-9af40301dcc8', 'Qual è il comando per creare un nuovo componente in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('9bef80f8-e226-496e-8ef2-1ddbbd37bce7', 'Cosa rappresenta l\'acronimo ‘AGILE’?', '2508aaf1-e291-4a87-987a-a7a3410a05f3'),
('a1ff29a3-7803-43e3-97a6-07717f0e5d53', 'Cosa rappresenta il concetto di \\\"ngClass\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('aa12f646-412a-4dce-9fd4-477d1adad7ec', 'Qual è il ruolo del \\\"Scrum Master\\\" nel framework AGILE?', 'b2972eff-22f2-41b6-90e3-daf8367d6a36'),
('ab9203c2-6f9b-4511-a0a5-bc1b60ef413b', 'Cosa rappresenta il concetto di \\\"ngContent\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('abcfb7d6-c455-47a5-b5e2-51e022f15085', 'Qual è il linguaggio di programmazione principale utilizzato in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('aee238e1-5a9f-43ee-b993-23f47b61cc3a', 'Cosa rappresenta il concetto di \\\"two-way data binding\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('b09c9812-70c7-463c-a662-e4979bcf391b', 'Qual è il comando per generare un componente con un file di stile LESS in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('b1709440-0e2b-416f-ae4f-885ad765b0ee', 'Cosa rappresenta il concetto di \\\"ngFor\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('b2ea9a2c-9cba-4f08-8b6e-d136cdff6048', 'Cosa rappresenta il concetto di \\\"Angular CLI\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('b3ce9b62-ac92-4e9c-a5cb-5dec914b9dc2', 'Qual è il comando per installare le dipendenze di un progetto Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('bb9334e4-b3ed-4d57-ac5a-309ee2fb53dc', 'Qual è l\'obiettivo principale delle riunioni giornaliere nel framework AGILE?', 'b2972eff-22f2-41b6-90e3-daf8367d6a36'),
('c2601089-f4be-4fa6-9e49-513731fd26d9', 'Cosa rappresenta il concetto di \\\"sprint\\\" nel framework AGILE?', 'b2972eff-22f2-41b6-90e3-daf8367d6a36'),
('c6c8b629-715b-4f63-a4fb-0d75754c3d7a', 'Cosa rappresenta il concetto di \\\"directive\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('ce66ba84-a36e-43a1-b81b-d86bb3ee028e', 'Cosa rappresenta il concetto di \\\"velocity\\\" nel framework AGILE?', '2508aaf1-e291-4a87-987a-a7a3410a05f3'),
('d6e12a50-2d9b-46f9-924a-6bf39d7d3a73', 'Cosa rappresenta il concetto di \\\"ngSubmit\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('d9ed1660-d2f1-424c-bc0d-6023db8ac2c0', 'Qual è il comando per avviare un\'applicazione Angular in locale?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('dbd309b3-0734-4cc0-a4f0-9f28340715d0', 'Cosa rappresenta il concetto di \\\"user story\\\" nell\'AGILE?', '2508aaf1-e291-4a87-987a-a7a3410a05f3'),
('e2f883dd-5c90-4b7a-82a4-d3bce7ce4cc3', 'Cosa rappresenta il concetto di \\\"router outlet\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('e5823248-335a-4522-af08-3cb188162dfa', 'Qual è il concetto di base del \\\"test-driven development\\\" (TDD) nel framework AGILE?', 'b2972eff-22f2-41b6-90e3-daf8367d6a36'),
('e65e7a8c-3819-4e90-89f5-57f505e18301', 'Qual è l\'obiettivo principale della \\\"retrospective\\\" nel framework AGILE?', '2508aaf1-e291-4a87-987a-a7a3410a05f3'),
('e77518ca-2332-4c58-bedc-b5c4732b5076', 'Cosa rappresenta il concetto di \\\"route\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('ecf9fe5a-5379-486c-b177-866af2bc58ef', 'Qual è il significato dell\'acronimo MVC?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('f2d77ee3-cc6c-4758-8250-7373e32fa279', 'Cosa rappresenta il concetto di \\\"ngModel\\\" in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be'),
('f57f1648-3a9f-40aa-90ea-7efb33f7e166', 'Qual è il ruolo del \\\"Scrum Master\\\" nel framework AGILE?', '2508aaf1-e291-4a87-987a-a7a3410a05f3'),
('f5ab69b0-a4d2-4b18-a466-223bf8886b4a', 'Qual è l\'obiettivo principale della \\\"retrospective\\\" nel framework AGILE?', 'b2972eff-22f2-41b6-90e3-daf8367d6a36'),
('f7a0a0ec-d7b3-4827-8fb3-6b9c12e7128c', 'Qual è l\'obiettivo principale delle riunioni giornaliere nel framework AGILE?', '2508aaf1-e291-4a87-987a-a7a3410a05f3'),
('fba4fc9e-1621-4b33-8c43-b791ad99d590', 'Cosa rappresenta il concetto di \\\"velocity\\\" nel framework AGILE?', 'b2972eff-22f2-41b6-90e3-daf8367d6a36'),
('ff17044b-fd51-496d-99a5-c65308053b8b', 'Qual è il comando per generare un modulo in Angular?', '84fe0f55-7444-41f2-8335-c4165648b4be');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `description`, `published`, `title`, `user_id`) VALUES
('2508aaf1-e291-4a87-987a-a7a3410a05f3', 'quiz', 0, 'quiz', '0388395c-3f19-4dd2-b0cf-1a3ed26f5697'),
('5c35f299-e88b-4c43-886c-116c1a035f1c', 'CiaA', 0, 'Bello', '7d9594c1-0cd9-46fe-9ef2-9c17394df362'),
('84fe0f55-7444-41f2-8335-c4165648b4be', 'Angular quiz', 1, 'Test angular', '0388395c-3f19-4dd2-b0cf-1a3ed26f5697'),
('b2972eff-22f2-41b6-90e3-daf8367d6a36', 'descirzione', 0, 'Quiz a caso', '0388395c-3f19-4dd2-b0cf-1a3ed26f5697');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_result`
--

CREATE TABLE `quiz_result` (
  `id` varchar(255) NOT NULL,
  `correct_question` double DEFAULT NULL,
  `correction` text,
  `quiz_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz_result`
--

INSERT INTO `quiz_result` (`id`, `correct_question`, `correction`, `quiz_id`, `user_id`) VALUES
('be8f79e0-c381-40b4-b0e8-54e39fea584f', 25, '{\"questions\":[{\"answers\":[{\"htmlReference\":\"0-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"0-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"0-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"0-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"1-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"1-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"1-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"1-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"2-0\",\"answerStatus\":\"rightAnswers\"},{\"htmlReference\":\"2-1\",\"answerStatus\":\"userSelectedWrong\"},{\"htmlReference\":\"2-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"2-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"3-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"3-1\",\"answerStatus\":\"userSelectedWrong\"},{\"htmlReference\":\"3-2\",\"answerStatus\":\"rightAnswers\"},{\"htmlReference\":\"3-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"4-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"4-1\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"4-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"4-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"5-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"5-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"5-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"5-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"6-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"6-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"6-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"6-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"7-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"7-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"7-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"7-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"8-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"8-1\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"8-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"8-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"9-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"9-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"9-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"9-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"10-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"10-1\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"10-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"10-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"11-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"11-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"11-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"11-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"12-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"12-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"12-2\",\"answerStatus\":\"rightAnswers\"},{\"htmlReference\":\"12-3\",\"answerStatus\":\"userSelectedWrong\"}]},{\"answers\":[{\"htmlReference\":\"13-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"13-1\",\"answerStatus\":\"rightAnswers\"},{\"htmlReference\":\"13-2\",\"answerStatus\":\"userSelectedWrong\"},{\"htmlReference\":\"13-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"14-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"14-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"14-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"14-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"15-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"15-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"15-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"15-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"16-0\",\"answerStatus\":\"rightAnswers\"},{\"htmlReference\":\"16-1\",\"answerStatus\":\"userSelectedWrong\"},{\"htmlReference\":\"16-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"16-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"17-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"17-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"17-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"17-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"18-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"18-1\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"18-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"18-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"19-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"19-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"19-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"19-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"20-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"20-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"20-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"20-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"21-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"21-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"21-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"21-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"22-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"22-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"22-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"22-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"23-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"23-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"23-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"23-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"24-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"24-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"24-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"24-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"25-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"25-1\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"25-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"25-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"26-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"26-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"26-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"26-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"27-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"27-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"27-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"27-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"28-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"28-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"28-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"28-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"29-0\",\"answerStatus\":\"userSelectedWrong\"},{\"htmlReference\":\"29-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"29-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"29-3\",\"answerStatus\":\"rightAnswers\"}]},{\"answers\":[{\"htmlReference\":\"30-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"30-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"30-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"30-3\",\"answerStatus\":\"null\"}]}]}', '84fe0f55-7444-41f2-8335-c4165648b4be', 'd763cf17-74a4-4e86-93c6-cd0acefa05ab'),
('f2564d50-10bf-4852-8beb-7bc50ba08a70', 29, '{\"questions\":[{\"answers\":[{\"htmlReference\":\"0-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"0-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"0-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"0-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"1-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"1-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"1-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"1-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"2-0\",\"answerStatus\":\"rightAnswers\"},{\"htmlReference\":\"2-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"2-2\",\"answerStatus\":\"userSelectedWrong\"},{\"htmlReference\":\"2-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"3-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"3-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"3-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"3-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"4-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"4-1\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"4-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"4-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"5-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"5-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"5-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"5-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"6-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"6-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"6-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"6-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"7-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"7-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"7-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"7-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"8-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"8-1\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"8-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"8-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"9-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"9-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"9-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"9-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"10-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"10-1\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"10-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"10-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"11-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"11-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"11-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"11-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"12-0\",\"answerStatus\":\"userSelectedWrong\"},{\"htmlReference\":\"12-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"12-2\",\"answerStatus\":\"rightAnswers\"},{\"htmlReference\":\"12-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"13-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"13-1\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"13-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"13-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"14-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"14-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"14-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"14-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"15-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"15-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"15-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"15-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"16-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"16-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"16-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"16-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"17-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"17-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"17-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"17-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"18-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"18-1\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"18-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"18-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"19-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"19-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"19-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"19-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"20-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"20-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"20-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"20-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"21-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"21-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"21-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"21-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"22-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"22-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"22-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"22-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"23-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"23-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"23-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"23-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"24-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"24-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"24-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"24-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"25-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"25-1\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"25-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"25-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"26-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"26-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"26-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"26-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"27-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"27-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"27-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"27-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"28-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"28-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"28-2\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"28-3\",\"answerStatus\":\"null\"}]},{\"answers\":[{\"htmlReference\":\"29-0\",\"answerStatus\":\"null\"},{\"htmlReference\":\"29-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"29-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"29-3\",\"answerStatus\":\"userSelectedCorrect\"}]},{\"answers\":[{\"htmlReference\":\"30-0\",\"answerStatus\":\"userSelectedCorrect\"},{\"htmlReference\":\"30-1\",\"answerStatus\":\"null\"},{\"htmlReference\":\"30-2\",\"answerStatus\":\"null\"},{\"htmlReference\":\"30-3\",\"answerStatus\":\"null\"}]}]}', '84fe0f55-7444-41f2-8335-c4165648b4be', '3b17f3a9-24cb-49ff-8eaa-ee77b70eb372');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int NOT NULL,
  `expired` bit(1) NOT NULL,
  `revoked` bit(1) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_type` enum('BEARER') DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `token` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `active`, `email`, `name`, `password`, `token`) VALUES
('0388395c-3f19-4dd2-b0cf-1a3ed26f5697', b'1', 'simo.marca002@gmail.com', 'simone marcandalli', '$2a$12$NXhtSSCCxO4QNZf9qTUuTeWOf96WRJWaQe6fNKNZqna85D4I9kqPO', '909DD4265A4098ABF268E8D8B23257D8FAAB6C81E26CEA249020E20CA8B71DAED0600886003FF6A0472A95DBD2F5FE71CA6866C23DDCD5316C0E938526BF539F8C595E742636271E23FB0068F42FB3793A70A4B5D09B5C9B50F00891AA9C0F0940F652EA68FA351063EF81C55104E1DA7AE94BA1EA6698739D8764CAFDDE96FD0150EB97A7A807F66269BE96B41B4091F9E1E41D138A831C677E27D464CD4AEBFCB39F3D2AC8A19AEA6821E6221D5B56CDF744937C7A7994A242B85A308F310727E30370AEE054CFC225249BE6DFA57A2896FC26884F32091067AE133C19E2DE998B62B098702A13360DFD5FB4059CFBA290F6389E74771A31A529CFA6439BC60536C09444139BBECC808855EE947D52462D5E3F31AB131F75BD98FCBDB235ADA42EB10D5A91FD2D0F2BEA9906B1C2905F7B17A772C678378A6BD9D7F97E46734A5EBE0B7B48FDCFA00C24F74C516B4F0D7AB9216977FC24BE2B0563A6AA81104C7545713D57FF176411B57C2D0916D5'),
('3b17f3a9-24cb-49ff-8eaa-ee77b70eb372', b'1', 'linriccardo98@gmail.com', 'Riccardo', '$2a$12$kwyKwOjXQ3cOMOfrSjjGRuL/7.mfenF6QY1jG4mSMdJhukul9/D8i', '4BA8307EFFBDE298EE1F4B368CC744597C7719CD93A26FF0D060D8E8A6189247ABB6B32BD020A5FA3C7AC35D49ED17C5EEF038D8A7FB83D0E886D68DEAF2BE8E0B18BD37736AF0F48FAA343BFECFBE5A876510725877EF3A0454C0EC27FFA596F5C736622B4EE62DF6E1CA81E0715258A21FED77590376CE5B77270A7EF5384EECEDDCC6250BABADDC014277A48D545B16BBDC11221A5C6E2BF3F5C33FBD761FBD2F65CE3A118D3118163E792D2A994E822B10571F391F38EACD5E939EB6F4369570564CB7F8765287D89AEEF4AC947393202B84341C6DDE21646A1252BD35BA00E97E395AE60FC2ACA5DE50BD99A7CDC0433391CFF124093EA5F33FEFA52CFBF8B5E23471356C9E71BCC63EDDF0C31E0FC4477CE44C6FF570153280F12A3E33427F0EC118282DD823A589CFC3B67B6CE573533F2DFEEC707DA0CCBC9B7CCC2A117D969C035110FFB5197CF9E26D0569846321B9ADFE482E3FA1AB55586298C6E922F0DF5FD147D07B055FA94B8C4321'),
('6df79052-022f-4593-87e5-538348fc9a19', b'1', 'foienibg@gmail.com', 'Chiara?', '$2a$12$a2rIpBPHPAc8Ic1/1dMMre.FkruKLUUX5onmjcmBUi7A3/BMAacki', 'C9B10FCC36BB0E71CB1EB0838C6836DC42D8E700A53F569FBE52E87AD3BE17E7993163FCD3D21673ADE3212E598F4341E7D937945E1D0F0709EF70399EB91F4972529017871F0F8D31AD38BFAF59E91BD8D09BD9897627D1A38395267841E1262CE560243D80E23DD27F732F92E5DA3FC8F0CD15127B0F8BCE49CE0860BC638C424151690A2BBE3827922BC554A426D5721575A8D94679202E005C542EC6AABB07BCFCE8A7F87DE68CCC044F0953564277D1716029A8F33F7214DFDC51D16B6194B38BFE529F733209EED8C5F28D14BF9A1973D1C75093BF170CDDE5709550FF15F830B4014702A9D497B5832EBBF70AE0C83FA341D8D7D2069E5006115DCE47F2A21E4BB3E150D43DAAD4ED2EA0A0F3CBF78CEFBFD2FA138600FD3C3C6E77F4DF202B4A59C7AE3A66F9F66C21EEB07A776F5DF862A9763A66EA799A0B0D97320C921F8AD61C6C5BC8D3C09EF8FBAA3F6EF6AFCAF62F027332AF5D49C42D51F2'),
('7d9594c1-0cd9-46fe-9ef2-9c17394df362', b'1', 'deejaymarca@gmail.com', 'Simone ', '$2a$12$qTNftO.yMl7y06cmRPa1R.VdnFsIumdr8N9NizdYvEYieYsAIgKGa', 'C9B10FCC36BB0E71CB1EB0838C6836DC42D8E700A53F569FBE52E87AD3BE17E7993163FCD3D21673ADE3212E598F4341E7D937945E1D0F0709EF70399EB91F49EC86B399A094044D532C79D20D9387411B76363E8C99698E04E7013FE11ACF59C948926F6FCD472820B709BCD4B1760F1939C2231B466C330BBC56AFB08E7BC7408624FB4E1145C93BC8BEABA997CCE0B622DDE16E57E29475F9E7B03A81A671C89903312BE89D26D5C4A029C06B3721232152043FCF0732F391B9841E8ED48D286898D78406BFCD1DCFF5C2219D5E12F9C01DA6E5E8F09A5374F0994F03BD47A41995D9B684E9F316E41DF05EA8D384882B59A4291025671A48A520CC8BABA4DB498C2661765979D1AF8A5F7A5A09F1FCC4FD4D02909729731542298B6B6A9F92DA65C8AA3AB1C0616D0D56816CEDA773E53BCC5028EE89959DA90E00941A39452E7DE6ABFDB7BDEE9A5E66660B8F3AB17CFC85A736525E2B14B9358FCCF3F4C63CFF14A919D2591B1611D1EA8E17CD'),
('d763cf17-74a4-4e86-93c6-cd0acefa05ab', b'1', 'bass56drake@gmail.com', 'robert', '$2a$12$LKta669ycS9m8qq31cZuTeMM0wU2eWGCypwHxShtwXNicXQKgzQfa', '4BA8307EFFBDE298EE1F4B368CC744597C7719CD93A26FF0D060D8E8A6189247ABB6B32BD020A5FA3C7AC35D49ED17C5EEF038D8A7FB83D0E886D68DEAF2BE8E9AD496A365A833E7B323AE47CBD1B6F125437500389E2FABF7489F0245B30D91651B57D9B320B593E6C9C563EF702CB6232252309954585F688054D624D12D5D2F0FBD3F7158C7B92F354288A02F8C418122F623B366BCE45F326A51D14F764709C911172A5ED5A7ECC5854D8B603C81BB3289594504BF872EC1A7F72CF44162044F1596E02BA484A27CA230AD62DCE361FC0AD892B80148844BDA48C179A673AA8DE39AF4B7948F0A8E8383E66B0F3863E4558A14629A28489CAC3EBCC1292691833A91C48861839FCFAFABBEB29AE9B3535FD3042D6F226CA2B1488C59C3BD3D8A3C9054533298F07D30E5D4EEE682F2D9F4F23FCCA40EFC2872FA074BAA1612770190DE298EDAE5EAEF9ED679C69C6EF39D0DD4551DF25673A7DD56FBF244E3926CD891BFC9F76E1939273B63AF8B');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_details`
--

CREATE TABLE `users_details` (
  `user_id` bigint NOT NULL,
  `banned_until` datetime(6) DEFAULT NULL,
  `credentials_expired` bit(1) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `deletion_date` datetime(6) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `expired` bit(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `last_login_attempts` datetime(6) DEFAULT NULL,
  `last_token` varchar(2000) DEFAULT NULL,
  `locked` bit(1) NOT NULL,
  `logins_attempts` int NOT NULL,
  `registration_confirm_date` datetime(6) DEFAULT NULL,
  `registration_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8frr4bcabmmeyyu60qt7iiblo` (`question_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKb0yh0c1qaxfwlcnwo9dms2txf` (`quiz_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1tofsm1qynhakggx7ttqh8ihu` (`user_id`);

--
-- Indexes for table `quiz_result`
--
ALTER TABLE `quiz_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKd49de4d3rwgtndq0n51w1isbx` (`quiz_id`),
  ADD KEY `FK724trb6ambqx6fd1sqpp9rfxg` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_pddrhgwxnms2aceeku9s2ewy5` (`token`),
  ADD KEY `FKj8rfw4x0wjjyibfqq566j4qng` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- Indexes for table `users_details`
--
ALTER TABLE `users_details`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `FK8frr4bcabmmeyyu60qt7iiblo` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FKb0yh0c1qaxfwlcnwo9dms2txf` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `FK1tofsm1qynhakggx7ttqh8ihu` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `quiz_result`
--
ALTER TABLE `quiz_result`
  ADD CONSTRAINT `FK724trb6ambqx6fd1sqpp9rfxg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKd49de4d3rwgtndq0n51w1isbx` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `FKj8rfw4x0wjjyibfqq566j4qng` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_details`
--
ALTER TABLE `users_details`
  ADD CONSTRAINT `FKdsdvybgotfuw6xs6ygbwj740l` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
