/*
  Warnings:

  - You are about to drop the `VisitorsToParks` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "VisitorsToParks" DROP CONSTRAINT "VisitorsToParks_parkId_fkey";

-- DropForeignKey
ALTER TABLE "VisitorsToParks" DROP CONSTRAINT "VisitorsToParks_userId_fkey";

-- DropTable
DROP TABLE "VisitorsToParks";

-- CreateTable
CREATE TABLE "_ParksVisited" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ParksVisited_AB_unique" ON "_ParksVisited"("A", "B");

-- CreateIndex
CREATE INDEX "_ParksVisited_B_index" ON "_ParksVisited"("B");

-- AddForeignKey
ALTER TABLE "_ParksVisited" ADD CONSTRAINT "_ParksVisited_A_fkey" FOREIGN KEY ("A") REFERENCES "Park"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ParksVisited" ADD CONSTRAINT "_ParksVisited_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
