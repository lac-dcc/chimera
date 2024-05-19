// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module inner ();
    initial
        a.dump;
endmodule

module outer ();
    inner i ();

    generate
    begin : a
        task dump;
            begin
                $display ("PASSED");
            end
        endtask
    end
    endgenerate
endmodule
