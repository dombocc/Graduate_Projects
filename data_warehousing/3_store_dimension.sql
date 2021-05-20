CREATE TABLE store (
    StoreKey      INTEGER    PRIMARY KEY
                             UNIQUE
                             NOT NULL,
    StoreManager  TEXT (50)  NOT NULL,
    StreetAddress TEXT (100) NOT NULL,
    Town          TEXT (20)  NOT NULL,
    ZipCode       TEXT (10)  NOT NULL,
    Phone         TEXT (10)  NOT NULL,
    State         TEXT (2)   NOT NULL
);

INSERT INTO StoreDim (
                         StoreKey,
                         StoreManager,
                         StreetAddress,
                         Town,
                         ZipCode,
                         Phone,
                         State
                     )
                     VALUES (
                         '2301',
                         'Dominic',
                         '305 14th Avenue Street',
                         'Woodstown',
                         '08096',
                         '8725624556',
                         'NJ'
                     )
INSERT INTO StoreDim (
                         
                         StoreManager,
                         StreetAddress,
                         Town,
                         ZipCode,
                         Phone,
                         State
                     )
                     VALUES (
                         
                         'Kaushiki',
                         '672 Cross Key Rd',
                         'Swedesboro',
                         '08085',
                         '5617349662',
                         'NJ'
                     )
INSERT INTO StoreDim (
                         
                         StoreManager,
                         StreetAddress,
                         Town,
                         ZipCode,
                         Phone,
                         State
                     )
                     VALUES (
                         
                         'Badal',
                         '123 Center Square Rd',
                         'Voorhees',
                         '08043',
                         '3106728834',
                         'NJ'
                     )

SELECT * FROM StoreDim;
