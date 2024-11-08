/*
  Warnings:

  - Made the column `description` on table `Park` required. This step will fail if there are existing NULL values in that column.
  - Made the column `designation` on table `Park` required. This step will fail if there are existing NULL values in that column.
  - Made the column `directionsInfo` on table `Park` required. This step will fail if there are existing NULL values in that column.
  - Made the column `directionsUrl` on table `Park` required. This step will fail if there are existing NULL values in that column.
  - Made the column `fullName` on table `Park` required. This step will fail if there are existing NULL values in that column.
  - Made the column `latitude` on table `Park` required. This step will fail if there are existing NULL values in that column.
  - Made the column `longitude` on table `Park` required. This step will fail if there are existing NULL values in that column.
  - Made the column `states` on table `Park` required. This step will fail if there are existing NULL values in that column.
  - Made the column `url` on table `Park` required. This step will fail if there are existing NULL values in that column.
  - Made the column `weatherInfo` on table `Park` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Park" ALTER COLUMN "description" SET NOT NULL,
ALTER COLUMN "designation" SET NOT NULL,
ALTER COLUMN "directionsInfo" SET NOT NULL,
ALTER COLUMN "directionsUrl" SET NOT NULL,
ALTER COLUMN "fullName" SET NOT NULL,
ALTER COLUMN "latitude" SET NOT NULL,
ALTER COLUMN "longitude" SET NOT NULL,
ALTER COLUMN "states" SET NOT NULL,
ALTER COLUMN "url" SET NOT NULL,
ALTER COLUMN "weatherInfo" SET NOT NULL;
