module waves();
    initial begin
        if ($test$plusargs ("WAVES_ON")) begin
            $dumpfile(`WAVES_OUT);
            $dumpvars();
        end
    end
endmodule

