-- AlterTable
ALTER TABLE "Address" ADD COLUMN     "campgroundId" TEXT;

-- AlterTable
ALTER TABLE "Contact" ADD COLUMN     "campgroundId" TEXT;

-- CreateTable
CREATE TABLE "Campground" (
    "id" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "directionsOverview" TEXT NOT NULL,
    "directionsUrl" TEXT NOT NULL,
    "geometryPoiId" TEXT NOT NULL,
    "npsId" TEXT NOT NULL,
    "lastIndexedDate" TEXT NOT NULL,
    "latitude" TEXT NOT NULL,
    "longitude" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "parkId" TEXT NOT NULL,
    "regulationsOverview" TEXT NOT NULL,
    "fees" TEXT[],
    "regulationsUrl" TEXT NOT NULL,
    "reservationsDescription" TEXT NOT NULL,
    "reservationsSitesFirstCome" TEXT NOT NULL,
    "reservationsSitesReservable" TEXT NOT NULL,
    "reservationsUrl" TEXT NOT NULL,
    "weatherOverview" TEXT NOT NULL,
    "adaInfo" TEXT NOT NULL,
    "wheelchairAccess" TEXT NOT NULL,
    "internetInfo" TEXT NOT NULL,
    "rvAllowed" TEXT NOT NULL,
    "rvMaxLength" TEXT NOT NULL,
    "rvInfo" TEXT NOT NULL,
    "trailerAllowed" TEXT NOT NULL,
    "trailerMaxLength" TEXT NOT NULL,
    "cellphoneInfo" TEXT NOT NULL,
    "fireStovePolicy" TEXT NOT NULL,
    "additionalInfo" TEXT NOT NULL,
    "accessRoads" TEXT[],
    "classifications" TEXT[],
    "trashRecyclingCollection" TEXT NOT NULL,
    "toilets" TEXT[],
    "internetConnectivity" TEXT NOT NULL,
    "showers" TEXT[],
    "cellphoneReception" TEXT NOT NULL,
    "laundry" TEXT NOT NULL,
    "amphitheather" TEXT NOT NULL,
    "dumpStation" TEXT NOT NULL,
    "campStore" TEXT NOT NULL,
    "staffOrVolunteerHostOnsite" TEXT NOT NULL,
    "potableWater" TEXT[],
    "iceAvailable" TEXT NOT NULL,
    "firewoodForSale" TEXT NOT NULL,
    "ampitheather" TEXT NOT NULL,
    "foodStorageLockers" TEXT NOT NULL,

    CONSTRAINT "Campground_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Amenity" (
    "id" TEXT NOT NULL,
    "npsId" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Amenity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ParksWithAmenity" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ParksWithAmenity_AB_unique" ON "_ParksWithAmenity"("A", "B");

-- CreateIndex
CREATE INDEX "_ParksWithAmenity_B_index" ON "_ParksWithAmenity"("B");

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_campgroundId_fkey" FOREIGN KEY ("campgroundId") REFERENCES "Campground"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_campgroundId_fkey" FOREIGN KEY ("campgroundId") REFERENCES "Campground"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Campground" ADD CONSTRAINT "Campground_parkId_fkey" FOREIGN KEY ("parkId") REFERENCES "Park"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ParksWithAmenity" ADD CONSTRAINT "_ParksWithAmenity_A_fkey" FOREIGN KEY ("A") REFERENCES "Amenity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ParksWithAmenity" ADD CONSTRAINT "_ParksWithAmenity_B_fkey" FOREIGN KEY ("B") REFERENCES "Park"("id") ON DELETE CASCADE ON UPDATE CASCADE;
