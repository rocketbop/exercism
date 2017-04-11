//
// This is only a SKELETON file for the "Leap" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

const Year = function(date) {
  this.date = date;
  return;
};

Year.prototype.isLeap = function() {
  switch (0) {
    case this.date % 400:
      return true
      break;
    case this.date % 100:
      return false;
    case this.date % 4:
      return true;  
    default:
      return false;
  }
};

module.exports = Year;
