
module ledblink(clk, LED);
input clk;
output LED;

    reg [7:0]counter;

    always @( posedge clk)
    begin
        if(counter == 8'hF0)
            begin

            end
        else
            begin
                counter <= counter + 8'h1;
            end

    end


    lsa_top lsa_top0
    (
        .in_clock(clk),
        .in_reset(counter[7]),
        .out_led_out(LED)
    );


endmodule
