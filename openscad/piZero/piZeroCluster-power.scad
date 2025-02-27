//measurements for the USB "iLEPO" power supply
powerW=130;
powerD=6;
powerH=32;
color([1,1,1]) cube([powerW,powerD,powerH]);

//need to create a structure to place the USB hub and pi cluster on this power hub
// first build structure over this.
// this has rounded corners take that into account by building with cylinders and hull
// then build USB hub structure that fits on to this
// then add mounting pins to top of overall strucute for the piZero mounting brackets
// potentially add hood for cluster to make it less of a dust collector (optional)
// print in white as USB power supply is white.
// make it a super structure that goes over as opposed to a case.
// potentially use algorithmic cutouts
