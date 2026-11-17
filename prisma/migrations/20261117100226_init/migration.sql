-- CreateTable
CREATE TABLE "Listing" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "source" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "priceEurMonthly" INTEGER,
    "billsIncluded" BOOLEAN,
    "minLeaseMonths" INTEGER,
    "furnished" BOOLEAN,
    "photoUrls" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "firstSeenAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Score" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "listingId" TEXT NOT NULL,
    "promptVersion" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "score" INTEGER NOT NULL,
    "pros" TEXT NOT NULL,
    "redFlags" TEXT NOT NULL,
    "natureProximityNote" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Score_listingId_fkey" FOREIGN KEY ("listingId") REFERENCES "Listing" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE INDEX "Listing_country_idx" ON "Listing"("country");

-- CreateIndex
CREATE UNIQUE INDEX "Score_listingId_promptVersion_model_key" ON "Score"("listingId", "promptVersion", "model");
