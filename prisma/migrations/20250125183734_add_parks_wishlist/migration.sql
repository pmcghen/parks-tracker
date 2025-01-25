-- CreateTable
CREATE TABLE "_ParksOnWishlist" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ParksOnWishlist_AB_unique" ON "_ParksOnWishlist"("A", "B");

-- CreateIndex
CREATE INDEX "_ParksOnWishlist_B_index" ON "_ParksOnWishlist"("B");

-- AddForeignKey
ALTER TABLE "_ParksOnWishlist" ADD CONSTRAINT "_ParksOnWishlist_A_fkey" FOREIGN KEY ("A") REFERENCES "Park"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ParksOnWishlist" ADD CONSTRAINT "_ParksOnWishlist_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
