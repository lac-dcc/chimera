module block();
    reg a, b, c;

    // Blocking assignments
initial begin
    $display("a b c at time %0t", $time);
    $monitor("%d %d %d at time %0t", a, b, c, $time);
    a = #10 1'b1;// The simulator assigns 1 to a at time 10
    b = #20 1'b0;// The simulator assigns 0 to b at time 30
    c = #40 1'b1;// The simulator assigns 1 to c at time 70
end
endmodule
