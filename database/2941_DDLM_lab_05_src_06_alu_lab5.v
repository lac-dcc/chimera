// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module lab5
(
    input        MAX10_CLK1_50,
	input  [1:0] KEY,
    input  [9:0] SW,
    output [9:0] LEDR
);
    //wires
    wire [3:0] x_bus, y_bus;
    wire       load_x, load_y;
    wire       clock;
    wire       reset;
    
    assign clock = MAX10_CLK1_50;
    assign reset = KEY[1];
    
    //register for the arguments
    register #(.WIDTH(4)) x_register
    (
        .clock   (clock  ),
        .reset   (reset  ),
        .load    (load_x ),
        .data_in (SW[4:1]),
        .data_out(x_bus  )
    );

    register #(.WIDTH(4)) y_register
    (
        .clock   (clock  ),
        .reset   (reset  ),
        .load    (load_y ),
        .data_in (SW[4:1]),
        .data_out(y_bus  )
    );
    
    //argument selector
    assign load_x =  SW[0] & ~KEY[0] ? 1'b1 : 1'b0;
    assign load_y = ~SW[0] & ~KEY[0] ? 1'b1 : 1'b0;

    //alu
    alu
    #(
        .WIDTH(4),
        .SHIFT(2)
    )
    i_alu
    (
        .x        ( x_bus     ),
        .y        ( y_bus     ),
        .shamt    ( SW[6:5]   ),
        .operation( SW[9:8]   ),
        .zero     ( LEDR[9]   ),
        .result   ( LEDR[3:0] )
);
    
    assign LEDR[8:4] = 0;
    
endmodule