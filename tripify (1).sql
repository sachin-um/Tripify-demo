-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: Nov 06, 2022 at 02:38 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tripify`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `AdminID` int(10) NOT NULL,
  `AssignedArea` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `beds`
--

CREATE TABLE `beds` (
  `bedID` int(11) NOT NULL,
  `bedscol` varchar(45) DEFAULT NULL,
  `RoomID` int(10) NOT NULL,
  `HotelID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `ComplaintID` int(11) NOT NULL,
  `BookingID` varchar(45) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Status` varchar(45) NOT NULL,
  `TravelerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guide ads`
--

CREATE TABLE `guide ads` (
  `AdID` varchar(15) NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Location` varchar(25) NOT NULL,
  `GuideID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guide bookings`
--

CREATE TABLE `guide bookings` (
  `Traveler_TravelerID` int(10) NOT NULL,
  `Guides_GuideID` int(10) NOT NULL,
  `BookingID` varchar(15) NOT NULL,
  `DateAdded` date NOT NULL,
  `ReservedDate` date NOT NULL,
  `StartingTime` time NOT NULL,
  `FinishingTime` time NOT NULL,
  `PaymentStatus` varchar(15) NOT NULL,
  `PaymentMethod` varchar(45) NOT NULL,
  `Price` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guide offers`
--

CREATE TABLE `guide offers` (
  `GuideID` int(10) NOT NULL,
  `RequestsID` varchar(15) NOT NULL,
  `OfferID` varchar(15) NOT NULL,
  `Date` date NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guide requests`
--

CREATE TABLE `guide requests` (
  `RequestsID` varchar(15) NOT NULL,
  `ServiceType` varchar(45) NOT NULL,
  `Location` varchar(25) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `TravelerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guides`
--

CREATE TABLE `guides` (
  `GuideID` int(10) NOT NULL,
  `Rate` decimal(1,0) NOT NULL,
  `NIC` varchar(20) NOT NULL,
  `Area` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hotelreservation`
--

CREATE TABLE `hotelreservation` (
  `HotelID` int(10) NOT NULL,
  `TravelerID` int(10) NOT NULL,
  `PaidDate` date NOT NULL,
  `Price` decimal(2,0) NOT NULL,
  `PaymentMethod` varchar(25) NOT NULL,
  `PaymentStatus` varchar(15) NOT NULL,
  `DateAdded` date NOT NULL,
  `ReservationID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hotel review`
--

CREATE TABLE `hotel review` (
  `TravelerID` int(10) NOT NULL,
  `HotelID` int(10) NOT NULL,
  `Rating` decimal(1,0) NOT NULL,
  `Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `HotelID` int(10) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `PropertyCatagory` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `MessageID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Message` varchar(100) NOT NULL,
  `TravelerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `ReviewID` varchar(15) NOT NULL,
  `Guides_GuideID` int(10) NOT NULL,
  `Traveler_TravelerID` int(10) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Rating` decimal(1,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `BedID` int(10) NOT NULL,
  `RoomID` int(10) NOT NULL,
  `NoofBeds` int(11) NOT NULL,
  `RoomType` varchar(20) NOT NULL,
  `NoofGuests` varchar(45) NOT NULL,
  `RoomSize` varchar(15) NOT NULL,
  `PricePerNight` decimal(2,0) NOT NULL,
  `HotelID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxi ads`
--

CREATE TABLE `taxi ads` (
  `AdID` varchar(15) NOT NULL,
  `VehicleID` varchar(15) NOT NULL,
  `PricePerKm` decimal(2,0) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `AvailableArea` varchar(45) NOT NULL,
  `TaxiOwner_OwnerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxi drivers`
--

CREATE TABLE `taxi drivers` (
  `TaxiDriverID` varchar(15) NOT NULL,
  `Age` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `LicenseNo` int(11) NOT NULL,
  `OwnerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxi offers`
--

CREATE TABLE `taxi offers` (
  `OwnerID` int(10) NOT NULL,
  `RequestID` varchar(15) NOT NULL,
  `OfferID` varchar(15) NOT NULL,
  `VehicleType` varchar(45) NOT NULL,
  `PaymentMethod` varchar(45) NOT NULL,
  `PricePerKm` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxiowner`
--

CREATE TABLE `taxiowner` (
  `OwnerID` int(10) NOT NULL,
  `NoOfVehicles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxi request`
--

CREATE TABLE `taxi request` (
  `RequestID` varchar(15) NOT NULL,
  `Date` date NOT NULL,
  `StartingTime` time NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `TravelerID` int(10) NOT NULL,
  `PickupLocation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxi reservation`
--

CREATE TABLE `taxi reservation` (
  `Traveler_TravelerID` int(10) NOT NULL,
  `Vehicles_VehicleID` varchar(15) NOT NULL,
  `ReservationID` varchar(15) NOT NULL,
  `Price` decimal(2,0) NOT NULL,
  `PaymentStatus` varchar(20) NOT NULL,
  `PaymentMethod` varchar(45) NOT NULL,
  `DateAdded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxi review`
--

CREATE TABLE `taxi review` (
  `TravelerID` int(10) NOT NULL,
  `ReservationID` varchar(15) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Review` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tour bookings`
--

CREATE TABLE `tour bookings` (
  `TourPlanID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tour plans`
--

CREATE TABLE `tour plans` (
  `TourPlanID` varchar(15) NOT NULL,
  `TravelerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `traveler`
--

CREATE TABLE `traveler` (
  `TravelerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(10) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `ContactNo` int(11) DEFAULT NULL,
  `UserType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Email`, `Password`, `Name`, `ContactNo`, `UserType`) VALUES
(1, 'sachinumayangana@gmail.com', '$2y$10$tkbIlTOp5TLDXQ55wRN.9eq4pk8zTnE88/3NtgAd5kdBK2YK58M5i', 'Sachin', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `VehicleID` varchar(15) NOT NULL,
  `Model` varchar(45) NOT NULL,
  `VehicleType` varchar(45) NOT NULL,
  `YearOfProduction` int(11) NOT NULL,
  `OwnerID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`bedID`,`RoomID`,`HotelID`),
  ADD KEY `room` (`HotelID`,`RoomID`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`ComplaintID`,`TravelerID`),
  ADD KEY `fk_Complaint_Traveler1_idx` (`TravelerID`);

--
-- Indexes for table `guide ads`
--
ALTER TABLE `guide ads`
  ADD PRIMARY KEY (`AdID`,`GuideID`),
  ADD KEY `fk_Guide Ads_Guides1_idx` (`GuideID`);

--
-- Indexes for table `guide bookings`
--
ALTER TABLE `guide bookings`
  ADD PRIMARY KEY (`Traveler_TravelerID`,`Guides_GuideID`,`BookingID`),
  ADD KEY `fk_Traveler_has_Guides_Guides1_idx` (`Guides_GuideID`),
  ADD KEY `fk_Traveler_has_Guides_Traveler1_idx` (`Traveler_TravelerID`);

--
-- Indexes for table `guide offers`
--
ALTER TABLE `guide offers`
  ADD PRIMARY KEY (`GuideID`,`RequestsID`,`OfferID`),
  ADD KEY `fk_Guides_has_Guide Requests_Guide Requests1_idx` (`RequestsID`),
  ADD KEY `fk_Guides_has_Guide Requests_Guides1_idx` (`GuideID`);

--
-- Indexes for table `guide requests`
--
ALTER TABLE `guide requests`
  ADD PRIMARY KEY (`RequestsID`,`TravelerID`),
  ADD KEY `fk_Guide Requests_Traveler1_idx` (`TravelerID`);

--
-- Indexes for table `guides`
--
ALTER TABLE `guides`
  ADD PRIMARY KEY (`GuideID`),
  ADD KEY `GuideID` (`GuideID`);

--
-- Indexes for table `hotelreservation`
--
ALTER TABLE `hotelreservation`
  ADD PRIMARY KEY (`HotelID`,`TravelerID`,`ReservationID`),
  ADD KEY `fk_Hotels_has_Traveler_Traveler1_idx` (`TravelerID`),
  ADD KEY `fk_Hotels_has_Traveler_Hotels1_idx` (`HotelID`);

--
-- Indexes for table `hotel review`
--
ALTER TABLE `hotel review`
  ADD PRIMARY KEY (`TravelerID`,`HotelID`),
  ADD KEY `fk_Traveler_has_Hotels_Hotels1_idx` (`HotelID`),
  ADD KEY `fk_Traveler_has_Hotels_Traveler1_idx` (`TravelerID`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`HotelID`),
  ADD KEY `HotelID` (`HotelID`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`MessageID`,`TravelerID`),
  ADD KEY `fk_Message_Traveler1_idx` (`TravelerID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Guides_GuideID`,`Traveler_TravelerID`,`ReviewID`) USING BTREE,
  ADD KEY `fk_Guides_has_Traveler_Traveler1_idx` (`Traveler_TravelerID`),
  ADD KEY `fk_Guides_has_Traveler_Guides1_idx` (`Guides_GuideID`) USING BTREE;

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`RoomID`,`HotelID`,`BedID`) USING BTREE,
  ADD KEY `fk_Room_Hotels1_idx` (`HotelID`);

--
-- Indexes for table `taxi ads`
--
ALTER TABLE `taxi ads`
  ADD PRIMARY KEY (`AdID`,`TaxiOwner_OwnerID`),
  ADD KEY `fk_Taxi Ads_TaxiOwner1_idx` (`TaxiOwner_OwnerID`);

--
-- Indexes for table `taxi drivers`
--
ALTER TABLE `taxi drivers`
  ADD PRIMARY KEY (`TaxiDriverID`,`OwnerID`),
  ADD KEY `fk_Taxi Drivers_TaxiOwner1_idx` (`OwnerID`);

--
-- Indexes for table `taxi offers`
--
ALTER TABLE `taxi offers`
  ADD PRIMARY KEY (`OwnerID`,`RequestID`,`OfferID`),
  ADD KEY `fk_TaxiOwner_has_Taxi Request_Taxi Request1_idx` (`RequestID`),
  ADD KEY `fk_TaxiOwner_has_Taxi Request_TaxiOwner_idx` (`OwnerID`);

--
-- Indexes for table `taxiowner`
--
ALTER TABLE `taxiowner`
  ADD PRIMARY KEY (`OwnerID`),
  ADD KEY `OwnerID` (`OwnerID`);

--
-- Indexes for table `taxi request`
--
ALTER TABLE `taxi request`
  ADD PRIMARY KEY (`RequestID`,`TravelerID`),
  ADD KEY `fk_Taxi Request_Traveler1_idx` (`TravelerID`);

--
-- Indexes for table `taxi reservation`
--
ALTER TABLE `taxi reservation`
  ADD PRIMARY KEY (`Traveler_TravelerID`,`Vehicles_VehicleID`,`ReservationID`),
  ADD KEY `fk_Traveler_has_Vehicles_Vehicles1_idx` (`Vehicles_VehicleID`),
  ADD KEY `fk_Traveler_has_Vehicles_Traveler1_idx` (`Traveler_TravelerID`);

--
-- Indexes for table `taxi review`
--
ALTER TABLE `taxi review`
  ADD PRIMARY KEY (`TravelerID`,`ReservationID`),
  ADD KEY `fk_Traveler_has_Taxi Reservation_Traveler1_idx` (`TravelerID`);

--
-- Indexes for table `tour bookings`
--
ALTER TABLE `tour bookings`
  ADD PRIMARY KEY (`TourPlanID`);

--
-- Indexes for table `tour plans`
--
ALTER TABLE `tour plans`
  ADD PRIMARY KEY (`TourPlanID`,`TravelerID`),
  ADD KEY `fk_Tour Plans_Traveler1_idx` (`TravelerID`);

--
-- Indexes for table `traveler`
--
ALTER TABLE `traveler`
  ADD PRIMARY KEY (`TravelerID`),
  ADD KEY `TravelerID` (`TravelerID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`VehicleID`,`OwnerID`),
  ADD KEY `fk_Vehicles_TaxiOwner1_idx` (`OwnerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `AdminID` FOREIGN KEY (`AdminID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `beds`
--
ALTER TABLE `beds`
  ADD CONSTRAINT `room` FOREIGN KEY (`HotelID`,`RoomID`) REFERENCES `room` (`HotelID`, `RoomID`);

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `fk_Complaint_Traveler1_idx` FOREIGN KEY (`TravelerID`) REFERENCES `traveler` (`TravelerID`);

--
-- Constraints for table `guide ads`
--
ALTER TABLE `guide ads`
  ADD CONSTRAINT `fk_Guide Ads_Guides1_idx` FOREIGN KEY (`GuideID`) REFERENCES `guides` (`GuideID`);

--
-- Constraints for table `guide bookings`
--
ALTER TABLE `guide bookings`
  ADD CONSTRAINT `fk_Traveler_has_Guides_Guides1_idx` FOREIGN KEY (`Guides_GuideID`) REFERENCES `guides` (`GuideID`),
  ADD CONSTRAINT `fk_Traveler_has_Guides_Traveler1_idx` FOREIGN KEY (`Traveler_TravelerID`) REFERENCES `traveler` (`TravelerID`);

--
-- Constraints for table `guide offers`
--
ALTER TABLE `guide offers`
  ADD CONSTRAINT `fk_Guides_has_Guide Requests_Guide Requests1` FOREIGN KEY (`RequestsID`) REFERENCES `guide requests` (`RequestsID`),
  ADD CONSTRAINT `fk_Guides_has_Guide Requests_Guides1_idx` FOREIGN KEY (`GuideID`) REFERENCES `guides` (`GuideID`);

--
-- Constraints for table `guide requests`
--
ALTER TABLE `guide requests`
  ADD CONSTRAINT `fk_Guide Requests_Traveler1_idx` FOREIGN KEY (`TravelerID`) REFERENCES `traveler` (`TravelerID`);

--
-- Constraints for table `guides`
--
ALTER TABLE `guides`
  ADD CONSTRAINT `GuideID` FOREIGN KEY (`GuideID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `hotelreservation`
--
ALTER TABLE `hotelreservation`
  ADD CONSTRAINT `fk_Hotels_has_Traveler_Hotels1_idx` FOREIGN KEY (`HotelID`) REFERENCES `hotels` (`HotelID`),
  ADD CONSTRAINT `fk_Hotels_has_Traveler_Traveler1_idx` FOREIGN KEY (`TravelerID`) REFERENCES `traveler` (`TravelerID`);

--
-- Constraints for table `hotel review`
--
ALTER TABLE `hotel review`
  ADD CONSTRAINT `fk_Traveler_has_Hotels_Traveler1_idx` FOREIGN KEY (`TravelerID`) REFERENCES `traveler` (`TravelerID`),
  ADD CONSTRAINT `k_Traveler_has_Hotels_Hotels1_idx` FOREIGN KEY (`HotelID`) REFERENCES `hotels` (`HotelID`);

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `HotelID` FOREIGN KEY (`HotelID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_Message_Traveler1_idx` FOREIGN KEY (`TravelerID`) REFERENCES `traveler` (`TravelerID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_Guides_has_Traveler_Guides1_idx` FOREIGN KEY (`Guides_GuideID`) REFERENCES `guides` (`GuideID`),
  ADD CONSTRAINT `fk_Guides_has_Traveler_Traveler1_idx` FOREIGN KEY (`Traveler_TravelerID`) REFERENCES `traveler` (`TravelerID`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `fk_Room_Hotels1_idx` FOREIGN KEY (`HotelID`) REFERENCES `hotels` (`HotelID`);

--
-- Constraints for table `taxi ads`
--
ALTER TABLE `taxi ads`
  ADD CONSTRAINT `fk_Taxi Ads_TaxiOwner1_idx` FOREIGN KEY (`TaxiOwner_OwnerID`) REFERENCES `taxiowner` (`OwnerID`);

--
-- Constraints for table `taxi drivers`
--
ALTER TABLE `taxi drivers`
  ADD CONSTRAINT `fk_Taxi Drivers_TaxiOwner1_idx` FOREIGN KEY (`OwnerID`) REFERENCES `taxiowner` (`OwnerID`);

--
-- Constraints for table `taxi offers`
--
ALTER TABLE `taxi offers`
  ADD CONSTRAINT `fk_TaxiOwner_has_Taxi Request_Taxi Request1` FOREIGN KEY (`RequestID`) REFERENCES `taxi request` (`RequestID`),
  ADD CONSTRAINT `fk_TaxiOwner_has_Taxi Request_TaxiOwner_idx` FOREIGN KEY (`OwnerID`) REFERENCES `taxiowner` (`OwnerID`);

--
-- Constraints for table `taxiowner`
--
ALTER TABLE `taxiowner`
  ADD CONSTRAINT `OwnerID` FOREIGN KEY (`OwnerID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `taxi request`
--
ALTER TABLE `taxi request`
  ADD CONSTRAINT `fk_Taxi Request_Traveler1_idx` FOREIGN KEY (`TravelerID`) REFERENCES `traveler` (`TravelerID`);

--
-- Constraints for table `taxi reservation`
--
ALTER TABLE `taxi reservation`
  ADD CONSTRAINT `fk_Traveler_has_Vehicles_Traveler1_idx` FOREIGN KEY (`Traveler_TravelerID`) REFERENCES `traveler` (`TravelerID`),
  ADD CONSTRAINT `fk_Traveler_has_Vehicles_Vehicles1` FOREIGN KEY (`Vehicles_VehicleID`) REFERENCES `vehicles` (`VehicleID`);

--
-- Constraints for table `taxi review`
--
ALTER TABLE `taxi review`
  ADD CONSTRAINT `fk_Traveler_has_Taxi Reservation_Traveler1_idx` FOREIGN KEY (`TravelerID`) REFERENCES `traveler` (`TravelerID`);

--
-- Constraints for table `tour bookings`
--
ALTER TABLE `tour bookings`
  ADD CONSTRAINT `fk_Tour Bookings_Tour Plans1` FOREIGN KEY (`TourPlanID`) REFERENCES `tour plans` (`TourPlanID`);

--
-- Constraints for table `tour plans`
--
ALTER TABLE `tour plans`
  ADD CONSTRAINT `fk_Tour Plans_Traveler1_idx` FOREIGN KEY (`TravelerID`) REFERENCES `traveler` (`TravelerID`);

--
-- Constraints for table `traveler`
--
ALTER TABLE `traveler`
  ADD CONSTRAINT `TravelerID` FOREIGN KEY (`TravelerID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `fk_Vehicles_TaxiOwner1_idx` FOREIGN KEY (`OwnerID`) REFERENCES `taxiowner` (`OwnerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
