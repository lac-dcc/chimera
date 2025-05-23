// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;
  string img;

  initial begin
    if (!$value$plusargs("img=%s", img)) begin
      $display("Specify image file with +img=<image>.");
      $finish_and_return(1);
    end
    $display("Using image: %s", img);
    if (img != "test_image.file") $display("FAILED");
    else $display("PASSED");
  end
endmodule // main
