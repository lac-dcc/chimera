// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1 ns / 100 ps

module testbench
# (
    parameter w = 8,
              n = 5
);

    //------------------------------------------------------------------------
    //
    //  Signals
    //
    //------------------------------------------------------------------------

    reg clk;
    reg rst_n;
    reg clk_en;
    reg arg_vld;

    reg [ w - 1:0 ] arg;

    wire                 res_vld_pow_5_single_cycle_struct;
    wire                 res_vld_pow_5_single_cycle_always;
    wire                 res_vld_pow_5_multi_cycle_struct_todo;
    wire                 res_vld_pow_5_multi_cycle_struct;
    wire                 res_vld_pow_5_multi_cycle_always;
    wire [ n     - 1:0 ] res_vld_pow_5_pipe_struct;
    wire [ 5     - 1:0 ] res_vld_pow_n_pipe_struct_5;
    wire [ n     - 1:0 ] res_vld_pow_5_pipe_always;
    wire [ n     - 1:0 ] res_vld_pow_5_pipe_always_with_array;
    wire [ 5     - 1:0 ] res_vld_pow_n_pipe_always_5;
    wire [ 6     - 1:0 ] res_vld_pow_n_pipe_struct_6;
    wire [ 6     - 1:0 ] res_vld_pow_n_pipe_always_6;

    wire [ w     - 1:0 ] res_pow_5_single_cycle_struct;
    wire [ w     - 1:0 ] res_pow_5_single_cycle_always;
    wire [ w     - 1:0 ] res_pow_5_multi_cycle_struct_todo;
    wire [ w     - 1:0 ] res_pow_5_multi_cycle_struct;
    wire [ w     - 1:0 ] res_pow_5_multi_cycle_always;
    wire [ n * w - 1:0 ] res_pow_5_pipe_struct;
    wire [ 5 * w - 1:0 ] res_pow_n_pipe_struct_5;
    wire [ n * w - 1:0 ] res_pow_5_pipe_always;
    wire [ n * w - 1:0 ] res_pow_5_pipe_always_with_array;
    wire [ 5 * w - 1:0 ] res_pow_n_pipe_always_5;
    wire [ 6 * w - 1:0 ] res_pow_n_pipe_struct_6;
    wire [ 6 * w - 1:0 ] res_pow_n_pipe_always_6;

    //------------------------------------------------------------------------

    wire                 res_vld_pow_5_en_single_cycle_struct;
    wire                 res_vld_pow_5_en_single_cycle_always;
    wire                 res_vld_pow_5_en_multi_cycle_struct;
    wire                 res_vld_pow_5_en_multi_cycle_always;
    wire [ n     - 1:0 ] res_vld_pow_5_en_pipe_struct;
    wire [ 5     - 1:0 ] res_vld_pow_n_en_pipe_struct_5;
    wire [ n     - 1:0 ] res_vld_pow_5_en_pipe_always;
    wire [ n     - 1:0 ] res_vld_pow_5_en_pipe_always_with_array;
    wire [ 5     - 1:0 ] res_vld_pow_n_en_pipe_always_5;
    wire [ 6     - 1:0 ] res_vld_pow_n_en_pipe_struct_6;
    wire [ 6     - 1:0 ] res_vld_pow_n_en_pipe_always_6;

    wire [ w     - 1:0 ] res_pow_5_en_single_cycle_struct;
    wire [ w     - 1:0 ] res_pow_5_en_single_cycle_always;
    wire [ w     - 1:0 ] res_pow_5_en_multi_cycle_struct;
    wire [ w     - 1:0 ] res_pow_5_en_multi_cycle_always;
    wire [ n * w - 1:0 ] res_pow_5_en_pipe_struct;
    wire [ 5 * w - 1:0 ] res_pow_n_en_pipe_struct_5;
    wire [ n * w - 1:0 ] res_pow_5_en_pipe_always;
    wire [ n * w - 1:0 ] res_pow_5_en_pipe_always_with_array;
    wire [ 5 * w - 1:0 ] res_pow_n_en_pipe_always_5;
    wire [ 6 * w - 1:0 ] res_pow_n_en_pipe_struct_6;
    wire [ 6 * w - 1:0 ] res_pow_n_en_pipe_always_6;

    //------------------------------------------------------------------------
    //
    //  Instantiations
    //
    //------------------------------------------------------------------------

      pow_5_single_cycle_struct
    # (.w (w))
    i_pow_5_single_cycle_struct
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_single_cycle_struct ),
        .res     ( res_pow_5_single_cycle_struct     )
    );

      pow_5_single_cycle_always
    # (.w (w))
    i_pow_5_single_cycle_always
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_single_cycle_always ),
        .res     ( res_pow_5_single_cycle_always     )
    );

      pow_5_multi_cycle_struct_todo
    # (.w (w))
    i_pow_5_multi_cycle_struct_todo
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_multi_cycle_struct_todo ),
        .res     ( res_pow_5_multi_cycle_struct_todo     )
    );

      pow_5_multi_cycle_struct
    # (.w (w))
    i_pow_5_multi_cycle_struct
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_multi_cycle_struct ),
        .res     ( res_pow_5_multi_cycle_struct     )
    );

      pow_5_multi_cycle_always
    # (.w (w))
    i_pow_5_multi_cycle_always
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_multi_cycle_always ),
        .res     ( res_pow_5_multi_cycle_always     )
    );

      pow_5_pipe_struct
    # (.w (w))
    i_pow_5_pipe_struct
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_pipe_struct ),
        .res     ( res_pow_5_pipe_struct     )
    );

      pow_n_pipe_struct
    # (.w (w), .n (5))
    i_pow_n_pipe_struct_5
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_n_pipe_struct_5 ),
        .res     ( res_pow_n_pipe_struct_5     )
    );

      pow_5_pipe_always
    # (.w (w))
    i_pow_5_pipe_always
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_pipe_always ),
        .res     ( res_pow_5_pipe_always     )
    );

      pow_5_pipe_always_with_array
    # (.w (w))
    i_pow_5_pipe_always_with_array
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_pipe_always_with_array ),
        .res     ( res_pow_5_pipe_always_with_array     )
    );

      pow_n_pipe_always
    # (.w (w), .n (5))
    i_pow_n_pipe_always_5
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_n_pipe_always_5 ),
        .res     ( res_pow_n_pipe_always_5     )
    );

      pow_n_pipe_struct
    # (.w (w), .n (6))
    i_pow_n_pipe_struct_6
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_n_pipe_struct_6 ),
        .res     ( res_pow_n_pipe_struct_6     )
    );

      pow_n_pipe_always
    # (.w (w), .n (6))
    i_pow_n_pipe_always_6
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_n_pipe_always_6 ),
        .res     ( res_pow_n_pipe_always_6     )
    );

    //------------------------------------------------------------------------

      pow_5_en_single_cycle_struct
    # (.w (w))
    i_pow_5_en_single_cycle_struct
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .clk_en  ( clk_en  ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_en_single_cycle_struct ),
        .res     ( res_pow_5_en_single_cycle_struct     )
    );

      pow_5_en_single_cycle_always
    # (.w (w))
    i_pow_5_en_single_cycle_always
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .clk_en  ( clk_en  ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_en_single_cycle_always ),
        .res     ( res_pow_5_en_single_cycle_always     )
    );

      pow_5_en_multi_cycle_struct
    # (.w (w))
    i_pow_5_en_multi_cycle_struct
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .clk_en  ( clk_en  ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_en_multi_cycle_struct ),
        .res     ( res_pow_5_en_multi_cycle_struct     )
    );

      pow_5_en_multi_cycle_always
    # (.w (w))
    i_pow_5_en_multi_cycle_always
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .clk_en  ( clk_en  ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_en_multi_cycle_always ),
        .res     ( res_pow_5_en_multi_cycle_always     )
    );

      pow_5_en_pipe_struct
    # (.w (w))
    i_pow_5_en_pipe_struct
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .clk_en  ( clk_en  ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_en_pipe_struct ),
        .res     ( res_pow_5_en_pipe_struct     )
    );

      pow_n_en_pipe_struct
    # (.w (w), .n (5))
    i_pow_n_en_pipe_struct_5
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .clk_en  ( clk_en  ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_n_en_pipe_struct_5 ),
        .res     ( res_pow_n_en_pipe_struct_5     )
    );

      pow_5_en_pipe_always
    # (.w (w))
    i_pow_5_en_pipe_always
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .clk_en  ( clk_en  ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_en_pipe_always ),
        .res     ( res_pow_5_en_pipe_always     )
    );

      pow_5_en_pipe_always_with_array
    # (.w (w))
    i_pow_5_en_pipe_always_with_array
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .clk_en  ( clk_en  ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_5_en_pipe_always_with_array ),
        .res     ( res_pow_5_en_pipe_always_with_array     )
    );

      pow_n_en_pipe_always
    # (.w (w), .n (5))
    i_pow_n_en_pipe_always_5
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .clk_en  ( clk_en  ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_n_en_pipe_always_5 ),
        .res     ( res_pow_n_en_pipe_always_5     )
    );

      pow_n_en_pipe_struct
    # (.w (w), .n (6))
    i_pow_n_en_pipe_struct_6
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .clk_en  ( clk_en  ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_n_en_pipe_struct_6 ),
        .res     ( res_pow_n_en_pipe_struct_6     )
    );

      pow_n_en_pipe_always
    # (.w (w), .n (6))
    i_pow_n_en_pipe_always_6
    (
        .clk     ( clk     ),
        .rst_n   ( rst_n   ),
        .clk_en  ( clk_en  ),
        .arg_vld ( arg_vld ),
        .arg     ( arg     ),
        .res_vld ( res_vld_pow_n_en_pipe_always_6 ),
        .res     ( res_pow_n_en_pipe_always_6     )
    );

    //------------------------------------------------------------------------
    //
    //  Clock and reset
    //
    //------------------------------------------------------------------------

    initial
    begin
        clk = 0;

        forever
            # 10 clk = ! clk;
    end

    initial
    begin
        clk_en  <= 1'b1;
        arg_vld <= 1'b0;

        repeat (2) @ (posedge clk);
        rst_n <= 0;
        repeat (2) @ (posedge clk);
        rst_n <= 1;
    end

    //------------------------------------------------------------------------
    //
    //  Main sequence
    //
    //------------------------------------------------------------------------

    integer i;

    initial
    begin
        #0
        $dumpvars;

        @ (posedge rst_n);

        repeat (10) @ (posedge clk);

        arg     <= 3;
        arg_vld <= 1;

        @ (posedge clk);

        arg_vld <= 0;

        repeat (10) @ (posedge clk);

        @ (posedge clk);

        for (i = 0; i < 50; i = i + 1)
        begin
            arg     <= i & 7;
            arg_vld <= (i == 0 || res_vld_pow_5_en_multi_cycle_struct);

            @ (posedge clk);
        end

        repeat (10) @ (posedge clk);

        for (i = 0; i < 50; i = i + 1)
        begin
            arg     <= i & 7;
            arg_vld <= 1;

            @ (posedge clk);
        end

        $stop;
    end

    //------------------------------------------------------------------------
    //
    //  Checking with assertions
    //
    //------------------------------------------------------------------------


    reg [31:0] checks;

    always @ (posedge clk)
    begin

        //--------------------------------------------------------------------

        checks [ 0] = (     res_vld_pow_5_single_cycle_struct
                        === res_vld_pow_5_single_cycle_always );

        checks [ 1] = (     res_vld_pow_5_multi_cycle_struct
                        === res_vld_pow_5_multi_cycle_always );

        checks [ 2] = (     res_vld_pow_5_pipe_struct
                        === res_vld_pow_n_pipe_struct_5 );

        checks [ 3] = (     res_vld_pow_5_pipe_struct
                        === res_vld_pow_5_pipe_always );

        checks [ 4] = (     res_vld_pow_5_pipe_struct
                        === res_vld_pow_5_pipe_always_with_array );

        checks [ 5] = (     res_vld_pow_5_pipe_struct
                        === res_vld_pow_n_pipe_always_5 );

        checks [ 6] = (     res_vld_pow_n_pipe_struct_6
                        === res_vld_pow_n_pipe_always_6 );

        //--------------------------------------------------------------------

        checks [ 7] = (     res_pow_5_single_cycle_struct
                        === res_pow_5_single_cycle_always );

        checks [ 8] = (     res_pow_5_multi_cycle_struct
                        === res_pow_5_multi_cycle_always );

        checks [ 9] = (     res_pow_5_pipe_struct
                        === res_pow_n_pipe_struct_5 );

        checks [10] = (     res_pow_5_pipe_struct
                        === res_pow_5_pipe_always );

        checks [11] = (     res_pow_5_pipe_struct
                        === res_pow_5_pipe_always_with_array );

        checks [12] = (     res_pow_5_pipe_struct
                        === res_pow_n_pipe_always_5 );

        checks [13] = (     res_pow_n_pipe_struct_6
                        === res_pow_n_pipe_always_6 );

        //--------------------------------------------------------------------

        checks [14] = (     res_vld_pow_5_en_single_cycle_struct
                        === res_vld_pow_5_en_single_cycle_always );

        checks [15] = (     res_vld_pow_5_en_multi_cycle_struct
                        === res_vld_pow_5_en_multi_cycle_always );

        checks [16] = (     res_vld_pow_5_en_pipe_struct
                        === res_vld_pow_n_en_pipe_struct_5 );

        checks [17] = (     res_vld_pow_5_en_pipe_struct
                        === res_vld_pow_5_en_pipe_always );

        checks [18] = (     res_vld_pow_5_en_pipe_struct
                        === res_vld_pow_5_en_pipe_always_with_array );

        checks [19] = (     res_vld_pow_5_en_pipe_struct
                        === res_vld_pow_n_en_pipe_always_5 );

        checks [20] = (     res_vld_pow_n_en_pipe_struct_6
                        === res_vld_pow_n_en_pipe_always_6 );

        //--------------------------------------------------------------------

        checks [21] = (     res_pow_5_en_single_cycle_struct
                        === res_pow_5_en_single_cycle_always );

        checks [22] = (     res_pow_5_en_multi_cycle_struct
                        === res_pow_5_en_multi_cycle_always );

        checks [23] = (     res_pow_5_en_pipe_struct
                        === res_pow_n_en_pipe_struct_5 );

        checks [24] = (     res_pow_5_en_pipe_struct
                        === res_pow_5_en_pipe_always );

        checks [25] = (     res_pow_5_en_pipe_struct
                        === res_pow_5_en_pipe_always_with_array );

        checks [26] = (     res_pow_5_en_pipe_struct
                        === res_pow_n_en_pipe_always_5 );

        checks [27] = (     res_pow_n_en_pipe_struct_6
                        === res_pow_n_en_pipe_always_6 );

        //--------------------------------------------------------------------

        checks [28] = (     res_vld_pow_5_single_cycle_struct
                        === res_vld_pow_5_en_single_cycle_struct );

        checks [29] = (     res_vld_pow_5_multi_cycle_struct
                        === res_vld_pow_5_en_multi_cycle_struct );

        checks [30] = (     res_vld_pow_5_pipe_struct
                        === res_vld_pow_5_en_pipe_struct );

        checks [31] = (     res_vld_pow_n_pipe_struct_6
                        === res_vld_pow_n_en_pipe_struct_6 );

        //--------------------------------------------------------------------

        if ((~ checks) != 0)
            $display ("Something went wrong %b", checks);
    end

endmodule
