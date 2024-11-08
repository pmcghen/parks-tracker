/*
  Warnings:

  - A unique constraint covering the columns `[npsId]` on the table `Activity` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[npsId]` on the table `Topic` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `npsId` to the `Activity` table without a default value. This is not possible if the table is not empty.
  - Added the required column `npsId` to the `Topic` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Activity" ADD COLUMN     "npsId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Topic" ADD COLUMN     "npsId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Activity_npsId_key" ON "Activity"("npsId");

-- CreateIndex
CREATE UNIQUE INDEX "Topic_npsId_key" ON "Topic"("npsId");
