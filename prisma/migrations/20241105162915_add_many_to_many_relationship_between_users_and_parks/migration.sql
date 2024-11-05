/*
  Warnings:

  - You are about to drop the `_ParkToUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ParkToUser" DROP CONSTRAINT "_ParkToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_ParkToUser" DROP CONSTRAINT "_ParkToUser_B_fkey";

-- DropTable
DROP TABLE "_ParkToUser";

-- CreateTable
CREATE TABLE "VisitorsToParks" (
    "userId" TEXT NOT NULL,
    "parkId" TEXT NOT NULL,

    CONSTRAINT "VisitorsToParks_pkey" PRIMARY KEY ("userId","parkId")
);

-- AddForeignKey
ALTER TABLE "VisitorsToParks" ADD CONSTRAINT "VisitorsToParks_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VisitorsToParks" ADD CONSTRAINT "VisitorsToParks_parkId_fkey" FOREIGN KEY ("parkId") REFERENCES "Park"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
