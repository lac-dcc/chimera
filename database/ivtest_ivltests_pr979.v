// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();
real r;

initial
begin
r=0.25;
$write("%f %b %f\n",r, $realtobits(r), $bitstoreal($realtobits(r)));
r=0.5;
$write("%f %b %f\n",r, $realtobits(r), $bitstoreal($realtobits(r)));

$display("neg reals don't work");
r=-0.25;
$write("%f %b %f\n",r, $realtobits(r), $bitstoreal($realtobits(r)));
r=-0.5;
$write("%f %b %f\n",r, $realtobits(r), $bitstoreal($realtobits(r)));

end
endmodule
