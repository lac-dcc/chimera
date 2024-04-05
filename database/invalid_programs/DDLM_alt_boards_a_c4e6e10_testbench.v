`include "config.vh"

module testbench;

    reg         clk;
    reg  [ 3:0] key;
    reg  [ 7:0] sw;
    wire [11:0] led;
    wire [ 7:0] abcdefgh;
    wire [ 7:0] digit;
    wire        buzzer;

    top i_top
    (
        .clk      ( clk      ),
        .key      ( key      ),
        .sw       ( sw       ),
        .led      ( led      ),
        .abcdefgh ( abcdefgh ),
        .digit    ( digit    ),
        .buzzer   ( buzzer   )
    );


    initial
    begin
        clk = 0;

        forever
            # 10 clk = ! clk;
    end

    reg rst_n;
    
    always @*
        key [3] = rst_n;

    initial
    begin
        repeat (2) @ (posedge clk);
        rst_n <= 0;
        repeat (2) @ (posedge clk);
        rst_n <= 1;
    end

    initial
    begin
        #0
        $dumpvars;

        @ (posedge rst_n);

        repeat (10000)
        begin
            @ (posedge clk);

            key <= $random;
            sw  <= $random;
        end

        $stop;
    end

endmodule
