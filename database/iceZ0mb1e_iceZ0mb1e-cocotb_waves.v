// This program was cloned from: https://github.com/abnoname/iceZ0mb1e
// License: MIT License

module waves();
    initial begin
        if ($test$plusargs ("WAVES_ON")) begin
            $dumpfile(`WAVES_OUT);
            $dumpvars();
        end
    end
endmodule

