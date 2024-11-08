/*
  Warnings:

  - Added the required column `description` to the `Park` table without a default value. This is not possible if the table is not empty.
  - Added the required column `designation` to the `Park` table without a default value. This is not possible if the table is not empty.
  - Added the required column `directionsInfo` to the `Park` table without a default value. This is not possible if the table is not empty.
  - Added the required column `directionsUrl` to the `Park` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fullName` to the `Park` table without a default value. This is not possible if the table is not empty.
  - Added the required column `latitude` to the `Park` table without a default value. This is not possible if the table is not empty.
  - Added the required column `longitude` to the `Park` table without a default value. This is not possible if the table is not empty.
  - Added the required column `states` to the `Park` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `Park` table without a default value. This is not possible if the table is not empty.
  - Added the required column `weatherInfo` to the `Park` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Park" ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "designation" TEXT NOT NULL,
ADD COLUMN     "directionsInfo" TEXT NOT NULL,
ADD COLUMN     "directionsUrl" TEXT NOT NULL,
ADD COLUMN     "fullName" TEXT NOT NULL,
ADD COLUMN     "latitude" TEXT NOT NULL,
ADD COLUMN     "longitude" TEXT NOT NULL,
ADD COLUMN     "states" TEXT NOT NULL,
ADD COLUMN     "url" TEXT NOT NULL,
ADD COLUMN     "weatherInfo" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "Topic" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Topic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Activity" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Activity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Fee" (
    "id" TEXT NOT NULL,
    "cost" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "entranceFeeType" TEXT NOT NULL,
    "exceptions" TEXT NOT NULL,
    "informationUrl" TEXT NOT NULL,
    "payGovPurchaseUrl" TEXT NOT NULL,
    "paymentDescription" TEXT NOT NULL,
    "purchaseUrl" TEXT NOT NULL,
    "recGovPurchaseUrl" TEXT NOT NULL,
    "timedEntryLocation" TEXT NOT NULL,
    "timedEntryShortDescription" TEXT NOT NULL,
    "endDateId" TEXT NOT NULL,
    "startDateId" TEXT NOT NULL,

    CONSTRAINT "Fee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StartDate" (
    "id" TEXT NOT NULL,
    "day" INTEGER NOT NULL,
    "holiday" TEXT NOT NULL,
    "month" INTEGER NOT NULL,

    CONSTRAINT "StartDate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EndDate" (
    "id" TEXT NOT NULL,
    "day" INTEGER NOT NULL,
    "holiday" TEXT NOT NULL,
    "month" INTEGER NOT NULL,

    CONSTRAINT "EndDate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Contact" (
    "id" TEXT NOT NULL,
    "emailAddress" TEXT NOT NULL,
    "emailDescription" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "phoneDescription" TEXT NOT NULL,
    "phoneExtension" TEXT NOT NULL,
    "phoneType" TEXT NOT NULL,
    "parkId" TEXT NOT NULL,

    CONSTRAINT "Contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Address" (
    "id" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "countryCode" TEXT NOT NULL,
    "line1" TEXT NOT NULL,
    "line2" TEXT NOT NULL,
    "line3" TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    "provinceTerritoryCode" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "parkId" TEXT NOT NULL,

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ParksWithTopic" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ParksWithActivity" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ParksWithTopic_AB_unique" ON "_ParksWithTopic"("A", "B");

-- CreateIndex
CREATE INDEX "_ParksWithTopic_B_index" ON "_ParksWithTopic"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ParksWithActivity_AB_unique" ON "_ParksWithActivity"("A", "B");

-- CreateIndex
CREATE INDEX "_ParksWithActivity_B_index" ON "_ParksWithActivity"("B");

-- AddForeignKey
ALTER TABLE "Fee" ADD CONSTRAINT "Fee_endDateId_fkey" FOREIGN KEY ("endDateId") REFERENCES "EndDate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Fee" ADD CONSTRAINT "Fee_startDateId_fkey" FOREIGN KEY ("startDateId") REFERENCES "StartDate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_parkId_fkey" FOREIGN KEY ("parkId") REFERENCES "Park"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_parkId_fkey" FOREIGN KEY ("parkId") REFERENCES "Park"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ParksWithTopic" ADD CONSTRAINT "_ParksWithTopic_A_fkey" FOREIGN KEY ("A") REFERENCES "Park"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ParksWithTopic" ADD CONSTRAINT "_ParksWithTopic_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ParksWithActivity" ADD CONSTRAINT "_ParksWithActivity_A_fkey" FOREIGN KEY ("A") REFERENCES "Activity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ParksWithActivity" ADD CONSTRAINT "_ParksWithActivity_B_fkey" FOREIGN KEY ("B") REFERENCES "Park"("id") ON DELETE CASCADE ON UPDATE CASCADE;
