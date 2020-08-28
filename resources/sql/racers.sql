--
-- File generated with SQLiteStudio v3.2.1 on Sat May 16 00:28:28 2020
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: clubs
DROP TABLE IF EXISTS clubs;

CREATE TABLE clubs (
    id   INT     PRIMARY KEY,
    [no] VARCHAR,
    name VARCHAR
);

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      7,
                      '02272',
                      'Luftbote Wilhelmshöhe'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      9,
                      '00892',
                      'Sturmvogel'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      11,
                      '01008',
                      'Ruhrbote Witten'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      14,
                      '07043',
                      'Ohne Furcht'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      15,
                      '06255',
                      'Auf zur Schoenen Ruhr'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      21,
                      '05866',
                      'Treu zur Heimat'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      24,
                      '00664',
                      'Brieftaube Bredenscheid'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      28,
                      '01213',
                      'Heimatliebe Papenholz'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      31,
                      '08144',
                      'Alter Stamm'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      32,
                      '06230',
                      'Luftbote Persebeck'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      33,
                      '01882',
                      'Auf Zum Borbachtal'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      36,
                      '00906',
                      'Eintracht'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      40,
                      '02517',
                      'Heimatliebe Kornhar.'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      45,
                      '07185',
                      'Edeltaube Ruedinghausen'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      46,
                      '08483',
                      'Club Annen'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      49,
                      '01833',
                      'Einigkeit Arday'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      52,
                      '08418',
                      'Treu zur Heimat Herdecke'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      59,
                      '07807',
                      'Edeltaube Grümerbaum'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      65,
                      '02467',
                      'Heimatliebe'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      67,
                      '03089',
                      'Heimatliebe'
                  );

INSERT INTO clubs (
                      id,
                      [no],
                      name
                  )
                  VALUES (
                      68,
                      '03891',
                      'Alte Heimat'
                  );


-- Table: locations
DROP TABLE IF EXISTS locations;

CREATE TABLE locations (
    Id          INTEGER PRIMARY KEY,
    Name        VARCHAR,
    AvgDistance INTEGER,
    Lat         DOUBLE,
    Lon         DOUBLE
);

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          601,
                          'Höchstadt a.d',
                          314,
                          49.69966667,
                          10.80475
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          665,
                          'Wels',
                          605,
                          48.15405556,
                          14.01805556
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          705,
                          'Aßlar',
                          124,
                          50.58322222,
                          8.424333333
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          738,
                          'Weibersbrunn',
                          222,
                          49.93083333,
                          9.356111111
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          1025,
                          'Hemau',
                          415,
                          49.05386111,
                          11.77763889
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          1224,
                          'Forchheim',
                          325,
                          49.73830556,
                          11.04411111
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          1236,
                          'Haiger',
                          97,
                          50.76180556,
                          8.156833333
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          1401,
                          'Ortenberg',
                          171,
                          50.37566667,
                          9.060472222
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          1438,
                          'Butzbach',
                          149,
                          50.42741667,
                          8.680055556
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          2645,
                          'Wertheim',
                          243,
                          49.75602778,
                          9.492944444
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          2698,
                          'Hemau',
                          416,
                          49.05075,
                          11.80427778
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          2735,
                          'Osterhofen',
                          509,
                          48.72461111,
                          13.05055556
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          3103,
                          'Aschaffenburg',
                          200,
                          50.02188889,
                          9.038944444
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          3112,
                          'Pohlheim',
                          141,
                          50.53683333,
                          8.7125
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          3378,
                          'Gelnhausen',
                          190,
                          50.20402778,
                          9.158194444
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          3771,
                          'Lauf a.d.Pegn',
                          355,
                          49.49952778,
                          11.27986111
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          4501,
                          'Hammersbach',
                          179,
                          50.24675,
                          9.003611111
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          4640,
                          'Dettelbach',
                          274,
                          49.79636111,
                          10.19525
                      );

INSERT INTO locations (
                          Id,
                          Name,
                          AvgDistance,
                          Lat,
                          Lon
                      )
                      VALUES (
                          4938,
                          'Regensburg',
                          445,
                          48.97219444,
                          12.21841667
                      );


-- Table: racers
DROP TABLE IF EXISTS racers;

CREATE TABLE racers (
    Name   VARCHAR,
    Lat    DOUBLE,
    Lon    DOUBLE,
    ClubId INTEGER,
    [No]   INTEGER,
    Id     VARCHAR PRIMARY KEY
);

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Vogelsang und Prange',
                       51.48711111,
                       7.322027778,
                       7,
                       1,
                       '7/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Prange,Günter',
                       51.51875,
                       7.321666667,
                       7,
                       2,
                       '7/2'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Hillringhaus, Frank',
                       51.49925,
                       7.357916667,
                       7,
                       13,
                       '7/13'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Wittig, Christian',
                       51.49,
                       7.350277778,
                       7,
                       15,
                       '7/15'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Fennen,Uwe',
                       51.43505556,
                       7.308222222,
                       9,
                       2,
                       '9/2'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Vosskuhle W.',
                       51.44094444,
                       7.313138889,
                       9,
                       3,
                       '9/3'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Zawadzki / Lucht',
                       51.45155556,
                       7.321166667,
                       9,
                       4,
                       '9/4'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Hanfland',
                       51.45236111,
                       7.32125,
                       9,
                       5,
                       '9/5'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Wrobel E.',
                       51.45133333,
                       7.320972222,
                       9,
                       6,
                       '9/6'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Zawadzki,Jacek',
                       51.42636111,
                       7.373138889,
                       9,
                       7,
                       '9/7'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Kaczmarczyk +Bioly W',
                       51.481,
                       7.307361111,
                       9,
                       11,
                       '9/11'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Dick,Sascha',
                       51.51983333,
                       7.192833333,
                       11,
                       1,
                       '11/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Möhrke,Michael',
                       51.45925,
                       7.405833333,
                       11,
                       2,
                       '11/2'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' P.Blum',
                       51.45805556,
                       7.374722222,
                       11,
                       4,
                       '11/4'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Naglik Michael',
                       51.44919444,
                       7.348583333,
                       11,
                       5,
                       '11/5'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Kessler, Egon',
                       51.44877778,
                       7.333166667,
                       11,
                       6,
                       '11/6'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Potrawa+Weissenfeld',
                       51.43611111,
                       7.363194444,
                       14,
                       1,
                       '14/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' G. Baumgart',
                       51.39566667,
                       7.361333333,
                       14,
                       7,
                       '14/7'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Dieter Flühs',
                       51.45038889,
                       7.321277778,
                       14,
                       8,
                       '14/8'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Leschinsky,W.',
                       51.43938889,
                       7.304944444,
                       15,
                       3,
                       '15/3'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' W. Rieske',
                       51.42772222,
                       7.293638889,
                       15,
                       5,
                       '15/5'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Nelk, Karl',
                       51.48019444,
                       7.287055556,
                       21,
                       1,
                       '21/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Schilf u. Ladeck',
                       51.47908333,
                       7.2855,
                       21,
                       6,
                       '21/6'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Balkenhol, Siegmund',
                       51.47819444,
                       7.287694444,
                       21,
                       7,
                       '21/7'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Szafranski, Heinz',
                       51.47930556,
                       7.286138889,
                       21,
                       9,
                       '21/9'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Pielorz,Gerd',
                       51.39575,
                       7.257027778,
                       24,
                       11,
                       '24/11'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Ölrich',
                       51.44280556,
                       7.301638889,
                       28,
                       1,
                       '28/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Pienkoss u. Halbe',
                       51.50641667,
                       7.312055556,
                       31,
                       1,
                       '31/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Springborn',
                       51.45925,
                       7.405833333,
                       32,
                       1,
                       '32/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Leschinsky,Nikolaus',
                       51.45844444,
                       7.40525,
                       32,
                       2,
                       '32/2'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Stracke, Hugo',
                       51.48988889,
                       7.422805556,
                       32,
                       3,
                       '32/3'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Eike Niemeyer',
                       51.43691667,
                       7.378277778,
                       33,
                       1,
                       '33/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Krusch Klaus',
                       51.40102778,
                       7.444861111,
                       33,
                       3,
                       '33/3'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Böttcher',
                       51.43391667,
                       7.382388889,
                       33,
                       8,
                       '33/8'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Wellershoff/Tornau',
                       51.4375,
                       7.375555556,
                       33,
                       12,
                       '33/12'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Köhler, Norbert',
                       51.42694444,
                       7.371111111,
                       33,
                       13,
                       '33/13'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Grote, Detlef',
                       51.47027778,
                       7.315611111,
                       36,
                       1,
                       '36/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Weide, Werner',
                       51.46275,
                       7.322861111,
                       36,
                       3,
                       '36/3'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Wittkamp u. Sohn',
                       51.45288889,
                       7.3215,
                       36,
                       4,
                       '36/4'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Oliver Lies',
                       51.51602778,
                       7.323666667,
                       36,
                       5,
                       '36/5'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Dildrop, Birgit',
                       51.54083333,
                       7.313166667,
                       36,
                       6,
                       '36/6'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Klein,Hans-Otto',
                       51.43033333,
                       7.420305556,
                       36,
                       7,
                       '36/7'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Suski, Dariusz',
                       51.43280556,
                       7.421305556,
                       36,
                       8,
                       '36/8'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Kokoscha',
                       51.45822222,
                       7.340222222,
                       36,
                       11,
                       '36/11'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Degener, W. u. B.',
                       51.48902778,
                       7.267194444,
                       40,
                       1,
                       '40/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Wojciechowski,Paul',
                       51.49905556,
                       7.366611111,
                       40,
                       2,
                       '40/2'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' von Blonski',
                       51.51316667,
                       7.267611111,
                       40,
                       5,
                       '40/5'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Bennemann, Ingo',
                       51.44477778,
                       7.389305556,
                       45,
                       1,
                       '45/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Schietrumpf',
                       51.44852778,
                       7.383,
                       46,
                       2,
                       '46/2'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Team Leon Payk',
                       51.441,
                       7.362,
                       46,
                       3,
                       '46/3'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Team Bioly',
                       51.44719444,
                       7.387222222,
                       46,
                       4,
                       '46/4'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Hasenkamp',
                       51.44177778,
                       7.361277778,
                       49,
                       1,
                       '49/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' L. Sichelschmidt',
                       51.42861111,
                       7.42475,
                       52,
                       3,
                       '52/3'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Mackowiak,Reiner',
                       51.48677778,
                       7.306222222,
                       59,
                       5,
                       '59/5'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Gollor, Herbert',
                       51.49205556,
                       7.299777778,
                       59,
                       6,
                       '59/6'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Knischewski, Horst',
                       51.45358333,
                       7.267194444,
                       65,
                       3,
                       '65/3'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Michel, Wilhelm',
                       51.50694444,
                       7.259944444,
                       67,
                       1,
                       '67/1'
                   );

INSERT INTO racers (
                       Name,
                       Lat,
                       Lon,
                       ClubId,
                       [No],
                       Id
                   )
                   VALUES (
                       ' Badowski, Jochen',
                       51.4635,
                       7.322222222,
                       68,
                       1,
                       '68/1'
                   );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
