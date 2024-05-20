// This program was cloned from: https://github.com/asicsforthemasses/LunaPnR
// License: GNU General Public License v3.0

// test for removeNetconInstances

module netcon(x1,x2,x3,x4,y1,y2,y3,y4);

input x1;
input x2;
input x3;
input x4;
input x5;
output y1;
output y2;
output y3;
output y4;
output y5;

wire   tmp;

assign y1 = x1;
assign y2 = x2;
assign y3 = x3;
assign y4 = x4;

assign tmp = x5;
assign y5  = tmp;

endmodule
