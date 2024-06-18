// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License


// Sequential Execution: Blocking assignments execute sequentially, one after the other, within a procedural block
// NB: not to be confused with sequential circuits, actually blocking assignment are used for combinational circuits
// Order Matters: The next statement waits for the previous one to complete before executing
// In this example, b and c assignments wait for the completion of the previous assignment, resulting in sequential execution
// Blocking assignments are akin to sequential programming

module blocking_assignment();

reg a, b, c;
initial begin
    a = 8'h00;
    $display("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    b = 8'h0F;
    $display("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    c = 8'hF0;
    $display("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
end

endmodule

