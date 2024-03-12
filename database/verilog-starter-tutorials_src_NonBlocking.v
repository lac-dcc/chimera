module nonblock();
    reg x , y, z ;
    // Nonblocking assignments
initial begin
    $display("x y z at time %0t", $time);
    $monitor("%d %d %d at time %0t", x, y, z, $time);
    x <=  #10  1'b1;// The simulator assigns 1 to x at time 10
    y <=  #20  1'b0;// The simulator assigns 0 to y at time 20
    z  <=  #40  1'b1;// The simulator assigns 1 to z at time 40
end
endmodule
