-- CreateTable
CREATE TABLE "public"."User" (
    "id" TEXT NOT NULL,
    "Clerkid" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "FName" TEXT,
    "LName" TEXT,
    "ImgURL" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Record" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "category" TEXT NOT NULL DEFAULT 'Others',
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userID" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Record_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_Clerkid_key" ON "public"."User"("Clerkid");

-- CreateIndex
CREATE UNIQUE INDEX "User_Email_key" ON "public"."User"("Email");

-- CreateIndex
CREATE INDEX "Record_userID_idx" ON "public"."Record"("userID");

-- AddForeignKey
ALTER TABLE "public"."Record" ADD CONSTRAINT "Record_userID_fkey" FOREIGN KEY ("userID") REFERENCES "public"."User"("Clerkid") ON DELETE CASCADE ON UPDATE CASCADE;
