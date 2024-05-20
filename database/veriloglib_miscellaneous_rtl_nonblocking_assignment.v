// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// Parallel Execution: Non-blocking assignments execute concurrently
// Independence: The next statement does not depend on the completion of the previous one
// Here, all assignments occur concurrently
// Non-blocking assignments describe parallel execution in hardware systems (thus modeling sequential circuits)

module nonblocking_assingment();

reg a, b, c;
initial begin
    a <= 8'h00;
    $display("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    b <= 8'h0F;
    $display("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    c <= 8'hF0;
    $display("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
end

endmodule
