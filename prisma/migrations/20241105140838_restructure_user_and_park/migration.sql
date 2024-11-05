/*
  Warnings:

  - You are about to drop the column `userProfileId` on the `Park` table. All the data in the column will be lost.
  - You are about to drop the column `parkId` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `UserProfile` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Park" DROP CONSTRAINT "Park_userProfileId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_parkId_fkey";

-- DropForeignKey
ALTER TABLE "UserProfile" DROP CONSTRAINT "UserProfile_userId_fkey";

-- AlterTable
ALTER TABLE "Park" DROP COLUMN "userProfileId";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "parkId",
ADD COLUMN     "bio" TEXT,
ADD COLUMN     "displayFirstName" TEXT,
ADD COLUMN     "displayLastName" TEXT,
ADD COLUMN     "location" TEXT;

-- DropTable
DROP TABLE "UserProfile";

-- CreateTable
CREATE TABLE "_ParkToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ParkToUser_AB_unique" ON "_ParkToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_ParkToUser_B_index" ON "_ParkToUser"("B");

-- AddForeignKey
ALTER TABLE "_ParkToUser" ADD CONSTRAINT "_ParkToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Park"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ParkToUser" ADD CONSTRAINT "_ParkToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
