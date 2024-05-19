// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0


`timescale 1ns / 100ps

/*

Camera Proxy

Overview

    Camera Proxy

    Proxy responds to the Camera signals as the real one might to some level of approximation.

    The idea is to provide the framework to allow arbitrary closeness to the real camera.  It
    can get improved along the way as additional functionality is needed.

    Supported functionality
    - snapshot mode
    - master simultaneous mode (exposure while data is read out)
    - capture dimensions
    - blanking

    Unsupported
    - high fidelity  register load -> impact on image
    - second register context
    - master sequential mode (exposure then data is read out)
    - slave mode
    - interleaved modes
    - exposure (LED) output
    - exposure details

    Note this module does a little init after reset to load registers with their default values.
         It takes 2x the number of configurations in clocks to finish.  Hopefully the I2C pipe
         will hold any early messages


Timing

    Simultaneous Master Mode - Continuous frames, exposure happens during the previous frame

                    _...__________
        LED_Out   _/              \____________________________________________...____________________________
                  ___...___        ____________________________________________...________________________
        Frame              \______/                                                                       \___
                           |      |           _________         ________                _________         |
        Line      ___...___|______|__________/         \_______/        \______..._____/         \________|___
                           |      |          |         |       |        |              |         |        |
                   P2      |  V   |    P1    |    A    |   Q   |   A    |   Q       Q  |    A    |   P2   |


            Frame Blanking in this mode may be extended when the exposure time is longer than the frame time

    Snapshot Mode - Exposure is triggered, when complete the frame is sent

                        _
        Exposure  __/ \__..._________________________________________________..._______________________________
                        __...___
        LED_Out   ____/        \_____________________________________________..._______________________________
                                    ____________________________________________...__________________________
        Frame     _______...____/                                                                         \____
                                            _________         ________                _________
        Line      _______...____|__________/         \_______/        \______..._____/         \________|______
                                |          |         |       |        |              |         |        |
                                |    P1    |    A    |   Q   |   A    |   Q       Q  |    A    |   P2   |

        V     = Vertical Blanking     = R06
        P1    = Frame Start Blanking  = R05 - 23
        A     = Active Data Time      = R04
        Q     = Horizontal Blanking   = R05
        P2    = Frame End Blanking    = 23 (fixed)

        R     = Rows

        A + Q = Row Time

        F     = Total Frame Time = V + R x ( A + Q )

Invocation

    camera_proxy #(
        ) cp (
            .clock( clock ),
            .reset( reset ),

        );

*/

`include "../../pipe/rtl/pipe_defs.v"

module camera_proxy #(
        parameter Width = 752,
        parameter Height = 482
    ) (
        input clock,
        input reset,

        // Camera Connections
        output scl_out,
        input  scl_in,
        output sda_out,
        input  sda_in,

        output vs,
        output hs,
        output pclk,

        input  xclk,

        output [9:0] d,

        input  pwdn,
        input  rst,

        output led,
        input  trigger
    );

    //
    // Camera Registers
    //

    `include "../../drivers/rtl/camera_defs.vh"

    //
    // Defines
    //

    localparam PipeSpec = `PS_d8s;
    localparam PipeWidth = `P_w( PipeSpec );
    localparam PipeDataWidth = `P_Data_w( PipeSpec );

    localparam AddressWidth = PipeDataWidth - 1;

    localparam SlaveAddress = 7'H48;

    localparam RegisterWidth = 16;

    localparam FrameEndBlanking = 23;

    //
    // Camera State
    //

    reg cp_snapshot_mode;

    reg [RegisterWidth-1:0] cp_window_height;
    reg [RegisterWidth-1:0] cp_window_width;

    reg [RegisterWidth-1:0] cp_column_start;
    reg [RegisterWidth-1:0] cp_row_start;

    reg [RegisterWidth-1:0] cp_horizontal_blanking;
    reg [RegisterWidth-1:0] cp_vertical_blanking;

    reg [RegisterWidth-1:0] cp_exposure;

    //
    // I2C Slave
    //

    // The I2C Slave has a pipe in and a pipe out.  An I2C write operation results in data coming out of the out port.
    // In this case it will be a register index coming out, then either data in the case of a write, or the register
    // value will be expected on the in port in the case of a read.

    wire [PipeWidth-1:0]     pipe_in;
    wire [PipeWidth-1:0]     pipe_out;

    reg                      pipe_in_start;
    reg                      pipe_in_stop;
    reg [PipeDataWidth-1:0]  pipe_in_data;
    reg                      pipe_in_valid;
    wire                     pipe_in_ready;

    wire                     pipe_out_start;
    wire                     pipe_out_stop;
    wire [PipeDataWidth-1:0] pipe_out_data;
    wire                     pipe_out_valid;
    reg                      pipe_out_ready;

    p_pack_ssdvrp #( PipeSpec )   in_pack( pipe_in_start, pipe_in_stop, pipe_in_data, pipe_in_valid, pipe_in_ready, pipe_in );

    p_unpack_pssdvr #( PipeSpec ) out_unpack( pipe_out, pipe_out_start, pipe_out_stop, pipe_out_data, pipe_out_valid, pipe_out_ready );

    i2c_slave_core #(
            .Address( SlaveAddress ),
            .PipeSpec( PipeSpec )
        ) i2c_s(
            .clock( clock ),
            .reset( reset ),

            .pipe_in( pipe_in ),
            .pipe_out( pipe_out ),

            .scl_in( scl_in ),
            .scl_out( scl_out ),
            .sda_in( sda_in ),
            .sda_out( sda_out )

            // .debug( debug )
        );

    //
    // Communication Logic
    //

    // Listen for register updates, and provide register values in response to I2C queries.

    localparam CP_STATE_INITIALIZE_A = 0,
               CP_STATE_INITIALIZE_B = 1,
               CP_STATE_IDLE         = 2,
               CP_STATE_DATA_M       = 3,
               CP_STATE_DATA_L       = 4,
               CP_STATE_DATA_STORE   = 5;

    reg [2:0]  cp_state = CP_STATE_IDLE;
    reg [7:0]  register_index;

    reg [RegisterWidth-1:0] register_value;

    reg [RegisterWidth-1:0] registers [0:255];

    // fixed length!
    reg [4:0] cp_configuration_index;

    reg running;
    reg register_index_set;

    always @( posedge clock ) begin

        if ( reset ) begin
            cp_state <= CP_STATE_INITIALIZE_A;

            pipe_out_ready <= 0;
            running <= 0;
            register_index_set <= 0;
            register_index <= 0;

            // load the internal variables with the correct default values
            cp_snapshot_mode <= ( Register_ChipControl_SensorOperatingMode_Default == Register_ChipControl_SensorOperatingMode_Snapshot);
            cp_column_start <= Register_ColumnStart_Default;
            cp_row_start <= Register_RowStart_Default;
            cp_window_height <= Register_WindowHeight_Default;
            cp_window_width <= Register_WindowWidth_Default;

            // Going to do some minumums here, rather than the defualts
            cp_horizontal_blanking <= Register_HorizontalBlanking_Min;
            cp_vertical_blanking <= Register_VerticalBlanking_Min;
            cp_exposure <= Register_CoarseShutterWidth_Min + 100;

            // get the config logic ready
            cp_configuration_index <= 0;

        end else begin
            case ( cp_state )
                CP_STATE_INITIALIZE_A: begin // 0
                        if ( cp_configuration_done  ) begin
                            pipe_out_ready <= 1;
                            cp_state <= CP_STATE_IDLE;
                        end else begin
                            register_index <= cp_configuration_register;
                            cp_state <= CP_STATE_INITIALIZE_B;
                        end
                    end
                CP_STATE_INITIALIZE_B: begin // 1
                        registers[ register_index ] <= cp_configuration_data;
                        cp_configuration_index <= cp_configuration_index + 1;
                        cp_state <= CP_STATE_INITIALIZE_A;
                    end
                CP_STATE_IDLE: begin // 2
                        if ( pipe_out_valid && pipe_out_start ) begin
                            register_index <= pipe_out_data;
                            if ( !pipe_out_stop ) begin
                                cp_state <= CP_STATE_DATA_M;
                            end
                        end
                    end
                CP_STATE_DATA_M: begin // 3
                        if ( pipe_out_valid  ) begin
                            // might have been the terminating byte
                            if ( pipe_out_stop ) begin
                                cp_state <= CP_STATE_IDLE;
                            end else begin
                                register_value[ 15:8 ] <= pipe_out_data;
                                cp_state <= CP_STATE_DATA_L;
                            end
                        end
                    end
                CP_STATE_DATA_L: begin // 4
                        if ( pipe_out_valid  ) begin
                            // might have been the terminating byte - although at this place it would be bad
                            if ( pipe_out_stop ) begin
                                cp_state <= CP_STATE_IDLE;
                            end else begin
                                register_value[ 7:0 ] <= pipe_out_data;
                                pipe_out_ready <= 0;
                                cp_state <= CP_STATE_DATA_STORE;
                            end
                        end
                    end
                CP_STATE_DATA_STORE: begin // 5
                        // interpret register loads (selectively)
                        case ( register_index )
                            Register_Reset:
                                    if ( register_value[ Register_Reset_LogicReset_l ] == 1 )
                                        running <= 1;
                            Register_ChipControl:
                                cp_snapshot_mode <= ((( register_value >> Register_ChipControl_SensorOperatingMode_l ) & Register_ChipControl_SensorOperatingMode_mask ) == Register_ChipControl_SensorOperatingMode_Snapshot );
                            Register_ColumnStart:
                                cp_column_start <= ( register_value > Register_ColumnStart_Max ) ? Register_ColumnStart_Max :
                                                        (( register_value < Register_ColumnStart_Min ) ? Register_ColumnStart_Min : register_value );
                            Register_RowStart:
                                cp_row_start <= ( register_value > Register_ColumnStart_Max ) ? Register_ColumnStart_Max :
                                                        (( register_value < Register_ColumnStart_Min ) ? Register_ColumnStart_Min : register_value );
                            Register_WindowHeight:
                                cp_window_height <= ( register_value > Register_RowStart_Max ) ? Register_RowStart_Max :
                                                        (( register_value < Register_RowStart_Min ) ? Register_RowStart_Min :
                                                        (( register_value > Height ) ? Height : register_value ) );

                            Register_WindowWidth:
                                cp_window_width <= ( register_value > Register_WindowWidth_Max ) ? Register_WindowWidth_Max :
                                                        (( register_value < Register_WindowWidth_Min ) ? Register_WindowWidth_Min :
                                                        (( register_value > Width ) ? Width : register_value ) );
                            Register_HorizontalBlanking:
                                cp_horizontal_blanking <= ( register_value > Register_HorizontalBlanking_Max ) ? Register_HorizontalBlanking_Max :
                                                        (( register_value < Register_HorizontalBlanking_Min ) ? Register_HorizontalBlanking_Min : register_value );
                            Register_VerticalBlanking:
                                cp_vertical_blanking <= ( register_value > Register_VerticalBlanking_Max ) ? Register_VerticalBlanking_Max :
                                                        (( register_value < Register_VerticalBlanking_Min ) ? Register_VerticalBlanking_Min : register_value );
                        endcase
                        register_index <= register_index + 1;
                        cp_state <= CP_STATE_DATA_M;
                        pipe_out_ready <= 1;
                    end
            endcase
        end
    end

    //
    // CONFIGURATION TABLE
    //

    // List of registers and values to stick in them
    // Combinatorial - you set the index and it snaps to the right value
    // Last one sets the done flag

    reg        cp_configuration_done;
    reg [7:0]  cp_configuration_register;
    reg [15:0] cp_configuration_data;

    always @(*) begin
        cp_configuration_register = 8'H00;
        cp_configuration_data = 16'H0000;
        case ( cp_configuration_index ) // make sure this register is wide enough
            0:       { cp_configuration_done, cp_configuration_register, cp_configuration_data } = { 1'H0, Register_ChipVersion,        Register_ChipVersion_MT9V022 };
            1:       { cp_configuration_done, cp_configuration_register, cp_configuration_data } = { 1'H0, Register_WindowHeight,       Register_WindowHeight_Default };
            2:       { cp_configuration_done, cp_configuration_register, cp_configuration_data } = { 1'H0, Register_WindowWidth,        Register_WindowWidth_Default };
            3:       { cp_configuration_done, cp_configuration_register, cp_configuration_data } = { 1'H0, Register_HorizontalBlanking, Register_HorizontalBlanking_Default };
            4:       { cp_configuration_done, cp_configuration_register, cp_configuration_data } = { 1'H0, Register_VerticalBlanking,   Register_VerticalBlanking_Default };
            5:       { cp_configuration_done, cp_configuration_register, cp_configuration_data } = { 1'H0, Register_ChipControl,        Register_ChipControl_Default };
            6:       { cp_configuration_done, cp_configuration_register, cp_configuration_data } = { 1'H0, Register_ReadMode,           Register_ReadMode_Default    };
            default: { cp_configuration_done, cp_configuration_register, cp_configuration_data } = { 1'H1, 8'H00,                       16'H0000                     };
        endcase
    end


    // Register Read

    reg reading_msb;

    always @( posedge clock ) begin

        if ( reset ) begin
            reading_msb <= 0;
            pipe_in_start <= 0;
            pipe_in_stop <= 0;
            pipe_in_data <= 0;
            pipe_in_valid <= 0;
        end else begin
            // allow the controller to reset the reading_msb flag
            if ( register_index_set ) begin
                reading_msb <= 0;
            end else begin
                // data coming out of the pipe is sent to the specified register, either msb or lsb
                if ( pipe_in_ready ) begin
                    pipe_in_valid <= 1;
                    if ( !reading_msb ) begin
                        pipe_in_start <= 1;
                        pipe_in_stop <= 0;
                        pipe_in_data <= registers[ register_index ][15:8];
                        reading_msb <= 1;
                    end else begin
                        pipe_in_start <= 0;
                        pipe_in_stop <= 1;
                        pipe_in_data <= registers[ register_index ][7:0];
                        reading_msb <= 0;
                    end
                end
            end
        end
    end

    //
    // Pixel Data
    //
    //
    // Deliver pixels roughly as the sensor would
    // 2D State Machines
    //     VerticalState
    //     HorizontalState
    //

    // create the output regs
    reg       cp_vs;
    reg       cp_hs;
    reg [9:0] cp_d;
    //reg       cp_trigger;
    reg       cp_led;

    // connect them
    assign vs   = cp_vs;
    assign hs   = cp_hs;
    assign d    = cp_d;

    // assign trigger = cp_trigger;
    assign led     = cp_led;

    // pixel clock is inverted system clock
    assign pclk = !xclk;

    localparam HorizontalMaxValue = ( Register_HorizontalBlanking_Max > Register_WindowWidth_Max ) ? Register_HorizontalBlanking_Max : Register_WindowWidth_Max;
    localparam VerticalMaxValue   = ( Register_VerticalBlanking_Max > Register_WindowHeight_Max ) ? Register_VerticalBlanking_Max : Register_WindowHeight_Max;

    localparam HorizontalWidth = $clog2( HorizontalMaxValue + 1 );
    localparam VerticalWidth   = $clog2( VerticalMaxValue + 1 );

    // Horizontal counter - expired when = -1, hence load with Count - 2 when initializing.  Extra bit for rollover
    reg [HorizontalWidth:0] cp_horizontal_counter;
    wire cp_horizontal_counter_expired = cp_horizontal_counter[ HorizontalWidth ];

    // Horizontal counter - expired when = -1, hence load with Count - 2 when initializing.  Extra bit for rollover
    reg [VerticalWidth:0]   cp_vertical_counter;
    wire cp_vertical_counter_expired = cp_vertical_counter[ VerticalWidth ];

    localparam XWidth = $clog2( Register_WindowWidth_Max + 1 );
    localparam YWidth   = $clog2( Register_WindowHeight_Max + 1 );

    reg [XWidth-1:0] window_x;
    reg [YWidth-1:0] window_y;

    reg [XWidth-1:0] image_x;
    reg [YWidth-1:0] image_y;

    localparam CP_VERTICAL_IDLE = 0,
               CP_VERTICAL_WAIT_FOR_SNAPSHOT = 1,
               CP_VERTICAL_EXPOSURE = 2,
               CP_VERTICAL_FRAME_START_BLANKING = 3,
               CP_VERTICAL_ACTIVE = 4,
               CP_VERTICAL_FRAME_END_BLANKING = 5,
               CP_VERTICAL_BLANKING = 6,
               CP_VERTICAL_BLANKING_4 = 7;

    reg [ 3:0 ] cp_vertical_state;

    localparam CP_HORIZONTAL_ACTIVE = 0,
               CP_HORIZONTAL_BLANKING = 1;

    reg cp_horizontal_state;

    reg pclk_previous;

    function [15:0] pixel_grid( input [XWidth-1:0] x, input [YWidth-1:0] y );
            pixel_grid = (( x == 0 ) || ( y == 0 ) || (x == cp_window_width - 1 ) || ( y == cp_window_height - 1 ) || ( x[2:0] == 0 ) || ( y[2:0] == 0 ) ) ?
                         { 5'H1F, 6'H3F, 5'H1F } : { 5'H03, 6'H07, 5'H03 };
    endfunction

    localparam HorizontalCounterInit = Width - 1;

    always @( posedge clock ) begin

        if ( reset ) begin
            cp_vs <= 0;
            cp_hs <= 0;
            cp_d <= 0;
            // cp_trigger <= 0;
            cp_led <= 0;

            window_x <= 0;
            window_y <= 0;

            image_x <= 0;
            image_y <= 0;

            cp_vertical_state <= CP_VERTICAL_IDLE;
            cp_horizontal_state <= CP_HORIZONTAL_ACTIVE;

            cp_horizontal_counter <= 0;
            cp_vertical_counter <= 0;

        end else begin

            // keep track of pclk
            pclk_previous <= pclk;

            // falling edge of pclk
            if ( pclk_previous && !pclk ) begin
                case ( cp_vertical_state )

                    CP_VERTICAL_IDLE: begin
                            if ( running ) begin
                                if ( cp_snapshot_mode ) begin
                                    cp_vertical_state <= CP_VERTICAL_WAIT_FOR_SNAPSHOT;
                                end else begin
                                    cp_vertical_counter <= cp_exposure - 2;
                                    cp_vertical_state <= CP_VERTICAL_EXPOSURE;
                                    cp_led <= 1;
                                end
                            end
                        end
                    CP_VERTICAL_WAIT_FOR_SNAPSHOT:
                            if ( trigger ) begin
                                cp_vertical_counter <= cp_exposure - 2;
                                cp_vertical_state <= CP_VERTICAL_EXPOSURE;
                                cp_led <= 1;
                            end
                    CP_VERTICAL_EXPOSURE:
                            if ( cp_vertical_counter_expired ) begin
                                cp_led <= 0;
                                window_x <= 0;
                                window_y <= 0;
                                image_x <= 0;
                                image_y <= 0;
                                cp_vs <= ( cp_row_start == 0 );
                                cp_horizontal_counter <= cp_horizontal_blanking - FrameEndBlanking - 2;
                                cp_vertical_state <= CP_VERTICAL_FRAME_START_BLANKING;
                                cp_d <= 0;
                            end else begin
                                cp_vertical_counter <= cp_vertical_counter - 1;
                            end
                    CP_VERTICAL_FRAME_START_BLANKING: begin
                            if ( cp_horizontal_counter_expired ) begin
                                cp_horizontal_counter <= HorizontalCounterInit;
                                cp_horizontal_state <= CP_HORIZONTAL_ACTIVE;
                                cp_vertical_state <= CP_VERTICAL_ACTIVE;
                                cp_vertical_counter <= Height - 2;
                                if ( cp_vs && ( cp_column_start == 0 ) ) begin
                                    cp_d <= pixel_grid( image_x, image_y );
                                    cp_hs <= 1;
                                end else begin
                                    cp_d <= 0;
                                end
                            end else begin
                                cp_horizontal_counter <= cp_horizontal_counter - 1;
                            end
                        end
                    CP_VERTICAL_ACTIVE: // 4
                            case ( cp_horizontal_state )
                                CP_HORIZONTAL_ACTIVE: begin
                                        if ( cp_horizontal_counter_expired ) begin
                                            cp_d <= 0;
                                            window_x <= 0;
                                            image_x <= 0;
                                            cp_hs <= 0;
                                            cp_horizontal_state <= CP_HORIZONTAL_BLANKING;
                                            cp_horizontal_counter <= cp_horizontal_blanking - 2;
                                        end else begin
                                            if ( cp_hs ) begin
                                                if ( image_x == cp_window_width - 1 ) begin
                                                    cp_hs <= 0;
                                                    cp_d <= 0;
                                                end else begin
                                                    cp_d <= pixel_grid( image_x + 1, image_y );
                                                end
                                                image_x <= image_x + 1;
                                            end else begin
                                                cp_d <= 0;
                                                if ( cp_vs && ( window_x == cp_column_start ) ) begin
                                                    cp_hs <= 1;
                                                    cp_d <= pixel_grid( image_x + 1, image_y );
                                                    image_x <= 0;
                                                end
                                            end
                                            window_x <= window_x + 1;
                                            cp_horizontal_counter <= cp_horizontal_counter - 1;
                                        end
                                    end
                                CP_HORIZONTAL_BLANKING: begin
                                        if ( cp_horizontal_counter_expired ) begin
                                            cp_horizontal_counter <= HorizontalCounterInit;
                                            cp_horizontal_state <= CP_HORIZONTAL_ACTIVE;
                                            if ( cp_vertical_counter_expired ) begin
                                                cp_d <= 0;
                                                cp_vs <= 0;
                                                image_y <= 0;
                                                window_x <= 0;
                                                window_y <= 0;
                                                cp_vertical_state <= CP_VERTICAL_FRAME_END_BLANKING;
                                                cp_horizontal_counter <= FrameEndBlanking;
                                            end else begin
                                                // prepare for the next row
                                                if ( cp_vs ) begin
                                                    image_y <= image_y + 1;
                                                    if ( image_y == cp_window_height - 1 ) begin
                                                        cp_vs <= 0;
                                                    end else begin
                                                        if ( ( cp_column_start == 0 ) ) begin
                                                            cp_d <= pixel_grid( image_x, image_y );
                                                            cp_hs <= 1;
                                                        end else begin
                                                            cp_d <= 0;
                                                        end
                                                    end
                                                end else begin
                                                    cp_d <= 0;
                                                    if ( window_y == cp_row_start - 1 ) begin
                                                        cp_vs <= 1;
                                                    end
                                                end
                                                window_y <= window_y + 1;
                                                cp_vertical_counter <= cp_vertical_counter - 1;
                                            end
                                        end else begin
                                            cp_horizontal_counter <= cp_horizontal_counter - 1;
                                        end
                                    end
                            endcase
                    CP_VERTICAL_FRAME_END_BLANKING: begin
                            if ( cp_horizontal_counter_expired ) begin
                                cp_vs <= 0;
                                cp_hs <= 0;
                                cp_horizontal_state <= CP_HORIZONTAL_ACTIVE;
                                cp_horizontal_counter <= HorizontalCounterInit;
                                cp_vertical_state <= CP_VERTICAL_BLANKING;
                                cp_vertical_counter <= cp_vertical_blanking;
                            end else begin
                                cp_horizontal_counter <= cp_horizontal_counter - 1;
                            end
                        end
                    CP_VERTICAL_BLANKING: // 6
                            case ( cp_horizontal_state )
                                CP_HORIZONTAL_ACTIVE: begin
                                        if ( cp_horizontal_counter_expired ) begin
                                            cp_horizontal_state <= CP_HORIZONTAL_BLANKING;
                                            cp_horizontal_counter <= cp_horizontal_blanking - 2;
                                        end else begin
                                            cp_horizontal_counter <= cp_horizontal_counter - 1;
                                        end
                                    end
                                CP_HORIZONTAL_BLANKING: begin
                                        if ( cp_horizontal_counter_expired ) begin
                                            cp_horizontal_counter <= HorizontalCounterInit;
                                            cp_horizontal_state <= CP_HORIZONTAL_ACTIVE;
                                            if ( cp_vertical_counter_expired ) begin
                                                cp_vertical_counter <= 4 - 2;
                                                cp_vertical_state <= CP_VERTICAL_BLANKING_4;
                                            end else begin
                                                if ( cp_row_start == 0 )
                                                    cp_vs <= 1;
                                                cp_vertical_counter <= cp_vertical_counter - 1;
                                            end
                                        end else begin
                                            cp_horizontal_counter <= cp_horizontal_counter - 1;
                                        end
                                    end
                            endcase
                    CP_VERTICAL_BLANKING_4: begin
                            if ( cp_vertical_counter_expired ) begin
                                if ( cp_snapshot_mode ) begin
                                    cp_vertical_state <= CP_VERTICAL_WAIT_FOR_SNAPSHOT;
                                end else begin
                                    cp_vs <= 1;
                                    cp_vertical_counter <= cp_horizontal_blanking - FrameEndBlanking - 2;
                                    cp_horizontal_counter <= HorizontalCounterInit;
                                    cp_horizontal_state <= CP_HORIZONTAL_ACTIVE;
                                    cp_vertical_state <= CP_VERTICAL_FRAME_START_BLANKING;
                                    // cp_state <= CP_VERTICAL_FRAME_START_BLANKING; // that can't be good
                                end
                            end else begin
                                cp_vertical_counter <= cp_vertical_counter - 1;
                            end
                        end
                endcase // vertical state
            end
        end
    end

endmodule

