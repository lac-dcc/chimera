// This program was cloned from: https://github.com/churchmice/secdec
// License: GNU General Public License v3.0

//***********************************************************************
//    Copyright (c) 2024 @freecity
//    All Rights Reserved.
//***********************************************************************
//-----------------------------------------------------------------------
// File:        tb.v
// Auther:      churchmice ( firefoxelectric@gmail.com )
// Created:     23:04:41, Jul 17, 2023
//-----------------------------------------------------------------------
// Abstract:    A sample testbench to test the ecc code
//
//-----------------------------------------------------------------------
module tb;
    localparam  DW = 64;
    localparam  EW = 8;
    localparam  TOTAL = 100000;
    /*AUTOINPUTREG*/
    // Beginning of automatic inputs (from unused autoinst inputs)
    reg                           clk                 ;//To clk of u_dec
    reg                           rst_n               ;//To rst_n of u_dec
    reg  [DW+EW-1:0]              ecc_din             ;//To din of u_dec
    reg                           inj_1bit_err        ;//To inj_1bit_err of u_enc
    reg                           inj_2bit_err        ;//To inj_2bit_err of u_enc
    reg  [DW-1:0]                 din                 ;//To din of u_enc
    // End of automatics
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire [DW+EW-1:0]        dout;            // From u_enc of cbb_ecc_enc
    wire [DW-1:0]           ecc_dout;        // From u_dec of cbb_ecc_dec
    wire                    sec;             // From u_dec of cbb_ecc_dec
    wire                    ded;             // From u_dec of cbb_ecc_dec
    // End of automatics
    /*AUTOREGINIT*/
    // Beginning of automatic reg initialization (from unused autoinst inputs)
    initial begin
        clk                 = {(1){1'b0}}; // To clk of u_dec
        rst_n               = {(1){1'b0}}; // To rst_n of u_dec
        ecc_din             = {((DW+EW-1) - (0) + 1){1'b0}}; // To din of u_dec
        inj_1bit_err        = {(1){1'b0}}; // To inj_1bit_err of u_enc
        inj_2bit_err        = {(1){1'b0}}; // To inj_2bit_err of u_enc
        din                 = {((DW-1) - (0) + 1){1'b0}}; // To din of u_enc
    end
    // End of automatics

    initial begin
        forever begin
            clk = #5 ~clk;
        end
    end

    initial begin
        repeat (5) @(posedge clk );
        rst_n       <= 1'b1;
    end

    bit [EW+DW-1:0] bit_mask;

    initial begin
        bit [EW-1:0] ecc[$];
        bit [DW-1:0] g[EW-1:0];
        bit [DW-1:0] org_data[TOTAL];
        bit [DW+1:0] dec_data[TOTAL];
        int index1;
        int index2;
        int j;

        for ( int i = 0 ; i < TOTAL; i ++ ) begin
            org_data[i] = $urandom;
        end

        j = 0;
        bit_mask = 'h0;
        repeat (10 ) @ (posedge clk );
        for ( int i = 0 ; i <TOTAL; i++) begin
            @(posedge clk );
            din  <= org_data[i];
            fork
                begin
                    repeat (2) @(posedge clk );
                    @(negedge clk);
                    dec_data[j++]={ded,sec,ecc_dout};
                end
            join_none
        end

        repeat (10 ) @ (posedge clk );
        for ( int i = 0 ; i < TOTAL ; i ++ ) begin
            if ( org_data[i] !== dec_data[i][0+:DW] ) begin
                $display("%d decoding failed: %h vs  %h",i,org_data[i],dec_data[i]);
                $fatal(1);
            end
            if ( dec_data[i][DW+:2] != 2'b00 ) begin
                $display("%d ded = %b, sec = %b", i,dec_data[i][DW+1], dec_data[i][DW]);
                $fatal(1);
            end
        end
        $display("zero bit error injection passed!");

        for ( int i = 0 ; i < TOTAL; i ++ ) begin
            org_data[i] = $urandom;
        end

        j = 0;
        bit_mask = 'h0;
        repeat (10 ) @ (posedge clk );
        for ( int i = 0 ; i <TOTAL; i++) begin
            @(posedge clk );
            din  <= org_data[i];
            //create one bits error
            bit_mask = 1'b1 << ($urandom % (DW+EW));
            fork
                begin
                    repeat (2) @(posedge clk );
                    @(negedge clk);
                    dec_data[j++]={ded,sec,ecc_dout};
                end
            join_none
        end

        repeat (10 ) @ (posedge clk );
        for ( int i = 0 ; i < TOTAL ; i ++ ) begin
            if ( org_data[i] !== dec_data[i][0+:DW] ) begin
                $display("%d decoding failed: %h vs  %h",i,org_data[i],dec_data[i]);
                $fatal(1);
            end
            if ( dec_data[i][DW+:2] != 2'b01 ) begin
                $display("%d ded = %b, sec = %b", i,dec_data[i][DW+1], dec_data[i][DW]);
                $fatal(1);
            end
        end

        $display("single bit error injection passed!");

        j = 0;
        bit_mask = 'h0;
        //now testing double bit error, need to make sure the ded is asserted
        for ( int i = 0 ; i < TOTAL; i ++ ) begin
            org_data[i] =$urandom;
        end

        repeat (10 ) @ (posedge clk );
        for ( int i = 0 ; i <TOTAL; i++) begin
            @(posedge clk );
            din  <= org_data[i];
            //create one bits error
            index1 = $urandom % ( DW+EW);
            do begin
                index2 = $urandom % ( DW+EW);
            end while ( index1 == index2 );
            bit_mask = (1'b1 << index1 ) | (1'b1 << index2);
            fork
                begin
                    repeat (2) @(posedge clk );
                    @(negedge clk);
                    dec_data[j++]={ded,sec,ecc_dout};
                end
            join_none
        end

        repeat (10 ) @ (posedge clk );
        for ( int i = 0 ; i < TOTAL ; i ++ ) begin
            if ( dec_data[i][DW+:2] != 2'b10 ) begin
                $display("%d ded = %b, sec = %b", i,dec_data[i][DW+1], dec_data[i][DW]);
                $fatal(1);
            end
        end

        $display("double bit error injection passed!");

        $finish(0);
    end

    always @( * ) begin
        ecc_din = dout ^ bit_mask;
    end

    /* cbb_ecc_enc AUTO_TEMPLATE (
        .__PARAM_DW__   (DW),
        .__PARAM_EW__   (EW),
    );*/
    cbb_ecc_enc #(/*AUTOOVRDPARAM*/
        .DW        (DW        ),//Templated: DW (DW) 
        .EW        (EW        ) //Templated: EW (EW) 
    ) u_enc(/*AUTOINST*/
        // Beginning of automatic module instantiation
        .clk                    (clk                    ),//I
        .rst_n                  (rst_n                  ),//I
        .inj_1bit_err           (inj_1bit_err           ),//I
        .inj_2bit_err           (inj_2bit_err           ),//I
        .din                    (din                    ),//I
        .dout                   (dout                   ) //O
        // End of automatics
    );

    /* cbb_ecc_dec AUTO_TEMPLATE (
        .__PARAM_DW__   (DW),
        .__PARAM_EW__   (EW),
        .din            (ecc_din),
        .dout           (ecc_dout),
    );*/
    cbb_ecc_dec #(/*AUTOOVRDPARAM*/
        .DW        (DW        ),//Templated: DW (DW) 
        .EW        (EW        ) //Templated: EW (EW) 
    ) u_dec (/*AUTOINST*/
        // Beginning of automatic module instantiation
        .clk             (clk                ),//I
        .rst_n           (rst_n              ),//I
        .din             (ecc_din            ),//I Templated: din (ecc_din) 
        .dout            (ecc_dout           ),//O Templated: dout (ecc_dout) 
        .sec             (sec                ),//O
        .ded             (ded                ) //O
        // End of automatics
    );

    initial begin
        $fsdbDumpfile("tb.fsdb");
        $fsdbDumpvars(0,"tb");
    end
endmodule
// Local Variables:
// verilog-library-directories:("../rtl/")
// End:

