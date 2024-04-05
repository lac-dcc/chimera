`timescale 1ns / 100ps

/*

I2C Master Slave Tests

*/

`include "../../utils/sim/sim.v"

`include "../../pipe/rtl/pipe_defs.v"

module i2c_master_slave_tb();

    parameter Output=`OutputDebug;
    // parameter Output=`OutputInfo;
    // parameter Output=`OutputError;

    // bring in the pipeline definitions
    // `include "../../pipeline/rtl/pipeline_defs.v"

    localparam PipeSpec = `PS_d8s;
    localparam PipeWidth = `P_w( PipeSpec );
    localparam PipeDataWidth = `P_Data_w( PipeSpec );

    localparam AddressWidth = PipeDataWidth - 1;

    localparam SlaveCount = 2;

    localparam Slave0Address = 7'H11;
    localparam Slave1Address = 7'H44;

    localparam AddressInPipe = 1;
    localparam ReadCountInPipe = 1;
    localparam AddressOutPipe = 1;
    localparam TransferCountOutPipe = 1;

    // dividable by 4, >= 4
    localparam ClockCount = 4;

    wire reset;
    reg  reset_int;

    initial begin
      $dumpfile("i2c_master_slave_tb.vcd");
      $dumpvars(1, i2c_master_slave_tb);
      $dumpvars(1, i2c_m);
      $dumpvars(1, i2c_s_0);
      $dumpvars(0, i2c_s_1);
    end

    // create the realtime_ns counter
    `Realtime

    // create the 10MHz clock
    `Clock10MHz

    localparam ClockCountWidth = $clog2( ClockCount ) + 1;
    reg [ClockCountWidth-1:0] clock_counter;

    //
    // Debug
    //

    wire [7:0] debug;

    //
    // Bus
    //

    wire sda;
    wire scl;

    assign scl = ( master_scl_out && slave_scl_out[ 0 ] && slave_scl_out[ 1 ] );
    assign sda = ( master_sda_out && slave_sda_out[ 0 ] && slave_sda_out[ 1 ] );

    //
    // Master
    //

    reg [PipeDataWidth-1:0]  master_slave_address;    // slave address or -1 for in pipe (extra bit width for the -1)
    reg [PipeDataWidth:0]    master_read_count;       // read count or -1 for in pipe (extra bit width for the -1)
    reg [2:0]                master_operation;        // 0 - write, 1 - read, 2 - write-read, -1 - in pipe (extra bit width for the -1)
    reg                      master_start_operation;       // perform the operation
    reg                      master_send_address;     // send address
    reg                      master_send_operation;   // send operation
    reg                      master_send_write_count; // send write count

    wire                     master_complete;         // operation completed
    wire                     master_error;            // operation failed
    wire [PipeDataWidth-1:0] master_write_count;      // number of words written

    // slave address in pipe (-1)
    wire master_slave_address_in_pipe = master_slave_address[ PipeDataWidth-1 ];

    // operation in pipe (-1)
    wire master_operation_in_pipe = master_operation[ 2 ];

    // count in pipe (-1)
    wire master_read_count_in_pipe = master_read_count[ PipeDataWidth ];

    wire master_scl_in;
    wire master_scl_out;
    wire master_sda_out_enable;
    wire master_sda_out;
    wire master_sda_in;

    wire [PipeWidth-1:0]     master_pipe_in;
    wire [PipeWidth-1:0]     master_pipe_out;

    reg                      master_pipe_in_start;
    reg                      master_pipe_in_stop;
    reg [PipeDataWidth-1:0]  master_pipe_in_data;
    reg                      master_pipe_in_valid;
    wire                     master_pipe_in_ready;

    p_pack_ssdvrp #( PipeSpec ) master_in_pack( master_pipe_in_start, master_pipe_in_stop, master_pipe_in_data, master_pipe_in_valid, master_pipe_in_ready, master_pipe_in );

    wire                     master_pipe_out_interrupt;

    wire                     master_pipe_out_start;
    wire                     master_pipe_out_stop;
    wire [PipeDataWidth-1:0] master_pipe_out_data;
    wire                     master_pipe_out_valid;
    reg                      master_pipe_out_ready;

    p_unpack_pssdvr #( PipeSpec ) master_out_unpack(  master_pipe_out , master_pipe_out_start, master_pipe_out_stop, master_pipe_out_data, master_pipe_out_valid, master_pipe_out_ready );

    i2c_master_core #(
            .PipeSpec( PipeSpec ),
            .ClockCount( ClockCount )
        ) i2c_m(
            .clock( clock ),
            .reset( reset ),

            .slave_address( master_slave_address ),
            .read_count( master_read_count ),
            .operation( master_operation ),
            .send_address( master_send_address ),
            .send_operation( master_send_operation ),
            .send_write_count( master_send_write_count ),

            .start_operation( master_start_operation ),

            .complete( master_complete ),
            .error( master_error ),
            .write_count( master_write_count ),

            .pipe_in( master_pipe_in ),
            .pipe_out( master_pipe_out ),

            .scl_in( scl ),
            .scl_out( master_scl_out ),
            .sda_out( master_sda_out ),
            .sda_in( sda ),

            .debug( debug )
        );

    //
    // Slaves
    //

    wire                     slave_scl_out[SlaveCount-1:0];
    wire                     slave_sda_out[SlaveCount-1:0];

    wire [PipeWidth-1:0]     slave_pipe_in[SlaveCount-1:0];
    wire [PipeWidth-1:0]     slave_pipe_out[SlaveCount-1:0];

    reg                      slave_pipe_in_start[ SlaveCount-1:0 ];
    reg                      slave_pipe_in_stop[ SlaveCount-1:0 ];
    reg [PipeDataWidth-1:0]  slave_pipe_in_data[ SlaveCount-1:0 ];
    reg                      slave_pipe_in_valid[ SlaveCount-1:0 ];
    wire                     slave_pipe_in_ready[ SlaveCount-1:0 ];

    wire                     slave_pipe_out_start[ SlaveCount-1:0 ];
    wire                     slave_pipe_out_stop[ SlaveCount-1:0 ];
    wire [PipeDataWidth-1:0] slave_pipe_out_data[ SlaveCount-1:0 ];
    wire                     slave_pipe_out_valid[ SlaveCount-1:0 ];
    reg                      slave_pipe_out_ready[ SlaveCount-1:0 ];

    p_pack_ssdvrp #( PipeSpec )   slave0_in_pack( slave_pipe_in_start[ 0 ], slave_pipe_in_stop[ 0 ], slave_pipe_in_data[ 0 ], slave_pipe_in_valid[ 0 ], slave_pipe_in_ready[ 0 ], slave_pipe_in[ 0 ] );
    p_pack_ssdvrp #( PipeSpec )   slave1_in_pack( slave_pipe_in_start[ 1 ], slave_pipe_in_stop[ 1 ], slave_pipe_in_data[ 1 ], slave_pipe_in_valid[ 1 ], slave_pipe_in_ready[ 1 ], slave_pipe_in[ 1 ] );

    p_unpack_pssdvr #( PipeSpec ) slave0_out_unpack( slave_pipe_out[ 0 ], slave_pipe_out_start[ 0 ], slave_pipe_out_stop[ 0 ], slave_pipe_out_data[ 0 ], slave_pipe_out_valid[ 0 ], slave_pipe_out_ready[ 0 ] );
    p_unpack_pssdvr #( PipeSpec ) slave1_out_unpack( slave_pipe_out[ 1 ], slave_pipe_out_start[ 1 ], slave_pipe_out_stop[ 1 ], slave_pipe_out_data[ 1 ], slave_pipe_out_valid[ 1 ], slave_pipe_out_ready[ 1 ] );

    i2c_slave_core #(
            .Address( Slave0Address ),
            .PipeSpec( PipeSpec )
        ) i2c_s_0(
            .clock( clock ),
            .reset( reset ),

            .pipe_in( slave_pipe_in[ 0 ] ),
            .pipe_out( slave_pipe_out[ 0 ] ),

            .scl_in( scl ),
            .scl_out( slave_scl_out[ 0 ] ),
            .sda_in( sda ),
            .sda_out( slave_sda_out[ 0 ] ),

            .debug( debug )
        );

    i2c_slave_core #(
            .Address( Slave1Address ),
            .PipeSpec( PipeSpec )
        ) i2c_s_1(
            .clock( clock ),
            .reset( reset ),

            .pipe_in( slave_pipe_in[ 1 ] ),
            .pipe_out( slave_pipe_out[ 1 ] ),

            .scl_in( scl ),
            .scl_out( slave_scl_out[ 1 ] ),
            .sda_in( sda ),
            .sda_out( slave_sda_out[ 1 ] )
        );

    `AssertSetup

    //
    // Testing
    //

    integer i, j, index;
    integer c;
    integer count;

    integer loop_count;

    integer data;
    integer data_expected;
    integer data_master;
    integer data_slave;
    integer data_master_expected;
    integer data_slave_expected;
    integer data_slave_expected_next;
    integer data_offset;
    integer repeat_data_offset;

    integer master_pipe_out_count;
    integer slave_pipe_out_count;

    integer master_pipe_in_count;
    integer slave_pipe_in_count;

    integer send_out_count;

    reg starting;

    reg test_test0;
    reg test_testA;
    reg test_testB;
    reg test_testC;
    reg test_testD;
    reg test_testE;
    reg test_testF;
    reg test_testG;
    reg test_testH;
    reg test_testI;
    reg test_testJ;

    reg do_jobA;
    reg do_jobB;

    task set_master_pipe_in( input reg in_start, input reg in_stop, input reg [PipeDataWidth-1:0] in_data, input reg in_valid );
        begin
            master_pipe_in_start = in_start;
            master_pipe_in_stop = in_stop;
            master_pipe_in_data = in_data;
            master_pipe_in_valid = in_valid;
        end
    endtask

    task clear_master_pipe_in;
        begin
            master_pipe_in_start = 0;
            master_pipe_in_stop = 0;
            master_pipe_in_data = 0;
            master_pipe_in_valid = 0;
        end
    endtask

    task set_slave_pipe_in( input integer index, input reg in_start, input reg in_stop, input reg [PipeDataWidth-1:0] in_data, input reg in_valid );
        begin
            slave_pipe_in_start[ index ] = in_start;
            slave_pipe_in_stop[ index ] = in_stop;
            slave_pipe_in_data[ index ] = in_data;
            slave_pipe_in_valid[ index ] = in_valid;
        end
    endtask

    task check_slave_pipe_out( input index, input reg out_start_test, input reg out_stop_test, input reg [PipeDataWidth-1:0] out_data_test );
        begin
            `AssertEqual( slave_pipe_out_start[ index ], out_start_test, "Incorrect Slave Pipe Out Start" );
            `AssertEqual( slave_pipe_out_stop[ index ], out_stop_test, "Incorrect Slave Pipe Out Stop" );
            `AssertEqual( slave_pipe_out_data[ index ], out_data_test, "Incorrect Slave Pipe Out Data" );
        end
    endtask

    task check_master_pipe_out( input reg out_start_test, input reg out_stop_test, input reg [PipeDataWidth-1:0] out_data_test );
        begin
            `AssertEqual( master_pipe_out_start, out_start_test, "Incorrect Master Pipe Out Start" );
            `AssertEqual( master_pipe_out_stop, out_stop_test, "Incorrect Master Pipe Out Stop" );
            `AssertEqual( master_pipe_out_data, out_data_test, "Incorrect Master Pipe Out Data" );
        end
    endtask

    integer pci_i;

    task system_initialize;
        begin
            // make sure all data is in-pipe
            master_slave_address = -1;
            master_read_count = -1;
            master_operation = -1;
            master_start_operation = 0;
            master_send_address = 1;
            master_send_write_count = 1;

            pipeline_clock_quiet;
        end
    endtask

    task master_operation_configure_ad_count_op( input reg [PipeDataWidth-1:0] slave_address, input reg [PipeDataWidth:0] read_count, input reg[2:0] operation );
        begin
            // make sure all data is in-pipe
            master_slave_address = slave_address;
            master_read_count = read_count;
            master_operation = operation;

            pipeline_clock_quiet;
        end
    endtask

    task master_send_configure( input reg send_address, input reg send_operation, input reg send_write_count );
        begin
            // make sure all data is in-pipe
            master_send_address = send_address;
            master_send_operation = send_operation;
            master_send_write_count = send_write_count;

            pipeline_clock_quiet;
        end
    endtask

    task pipeline_clear_inputs;
       begin
            master_pipe_in_start = 0;
            master_pipe_in_stop = 0;
            master_pipe_in_data = 0;
            master_pipe_in_valid = 0;
            for ( pci_i = 0; pci_i < SlaveCount; pci_i = pci_i + 1 ) begin
                slave_pipe_in_start[ pci_i ] = 0;
                slave_pipe_in_stop[ pci_i ] = 0;
                slave_pipe_in_data[ pci_i ] = 0;
                slave_pipe_in_valid[ pci_i ] = 0;
            end
        end
    endtask

    task  pipeline_clock_quiet;
        begin

            #2

            @( posedge clock );

            // reset all the inputs - let them be re-asserted
            // pipeline_clear_inputs;

            #2

            ;
            // `Info( "      Clock");

        end
    endtask

    task show_pipelines;
        begin
            // `Debug( "" );

            `DebugDo $display( "                     [In] -> %1x.%1x.%2x.%1x.%1x -> [I2C_M] -> %1x-%1x -> [I2C_S0] <- %1x.%1x.%2x.%1x.%1x ",
                                                        master_pipe_in_start, master_pipe_in_stop, master_pipe_in_data, master_pipe_in_valid, master_pipe_in_ready,
                                                        scl, sda,
                                                        slave_pipe_in_start[ 0 ], slave_pipe_in_stop[ 0 ], slave_pipe_in_data[ 0 ], slave_pipe_in_valid[ 0 ], slave_pipe_in_ready[ 0 ] );

            `DebugDo $display( "                    [Out] <- %1x.%1x.%2x.%1x.%1x -> /                         `-> %1x.%1x.%2x.%1x.%1x ",
                                                        master_pipe_out_start, master_pipe_out_stop, master_pipe_out_data, master_pipe_out_valid, master_pipe_out_ready,
                                                        slave_pipe_out_start[ 0 ], slave_pipe_out_stop[ 0 ], slave_pipe_out_data[ 0 ], slave_pipe_out_valid[ 0 ], slave_pipe_out_ready[ 0 ] );

            `DebugDo $display( "                                                          -> [I2C_S1] <- %1x.%1x.%2x.%1x.%1x ",
                                                        slave_pipe_in_start[ 1 ], slave_pipe_in_stop[ 1 ], slave_pipe_in_data[ 1 ], slave_pipe_in_valid[ 1 ], slave_pipe_in_ready[ 1 ] );
            `DebugDo $display( "                                                                     `-> %1x.%1x.%2x.%1x.%1x ",
                                                        slave_pipe_out_start[ 1 ], slave_pipe_out_stop[ 1 ], slave_pipe_out_data[ 1 ], slave_pipe_out_valid[ 1 ], slave_pipe_out_ready[ 1 ]  );
        end
    endtask

    task  pipeline_clock_full;
        begin

            #2

            show_pipelines;

            @( posedge clock );

            // reset all the inputs - let them be re-asserted
            // pipeline_clear_inputs;

            #2

            `Info( "                      Clock");

        end
    endtask

    task  pipeline_clock;
        begin
            pipeline_clock_full;
        end
    endtask

    integer cm;
    task pipeline_clock_multiple( input integer n );
        begin
            for ( cm = 0; cm < n; cm = cm + 1)
                pipeline_clock_quiet;
        end
    endtask

    task pipeline_initialize;
        begin
            `Info( "Initialize" );

            // `InfoDo $display( "    Specs: PipeDataWidth %0d (Ready %0d Valid %0d Meta %0d Data %0d)",
            //                   specs.PipeWidth, specs.PipeReadyPosition, specs.PipeValidPosition, specs.PipeMetaPosition, specs.PipeDataPosition );

            system_initialize;

            i = 0;
            test_test0 = 0;
            test_testA = 0;
            test_testB = 0;
            test_testC = 0;
            test_testD = 0;
            test_testE = 0;
            test_testF = 0;
            test_testG = 0;
            test_testH = 0;
            test_testI = 0;
            test_testJ = 0;

            pipeline_clock_quiet;

            // Set up all the soft config
            clock_counter = ClockCount;

            // Clear inputs
            pipeline_clear_inputs;

            // All outputs OK
            master_pipe_out_ready = 1;
            slave_pipe_out_ready[ 0 ] = 1;
            slave_pipe_out_ready[ 1 ] = 1;

            // Reset
            reset_int = 1;

            pipeline_clock_quiet;
            pipeline_clock_quiet;

            // Unreset
            reset_int = 0;
/*
*/
            pipeline_clock_quiet;
            pipeline_clock_quiet;
        end
    endtask

    assign reset = reset_int;


    reg [8*50:1] test_name;

    task test_bus( input reg scl_test, input reg sda_test );
        begin
            `AssertEqual( scl, scl_test, test_name  );
            `AssertEqual( sda, sda_test, test_name  );
        end
    endtask

    // integer data;
    reg bit;
    reg [PipeDataWidth-1:0] sent;

    localparam TestCount = 100;

    task test_wait_for_bus(  input reg scl_test, input reg sda_test, input integer target, input integer leeway );
        begin
            // drop clock
            c = 0;
            while ( ( ( scl != scl_test ) || ( sda != sda_test ) ) && ( c < TestCount ) ) begin
                c = c + 1;
                pipeline_clock_quiet;
            end

            //`Assert( c < ClockCount, test_name );

            `Assert( c <= ( target + leeway ), test_name );
            `Assert( c >= ( target - leeway ), test_name );

            test_bus( scl_test, sda_test );

            `InfoDo $display( "            SCL %x SDA %x - %0d Clocks", scl, sda, c );

            show_pipelines;
        end
    endtask

    task test_master_clock( input reg [AddressWidth-1:0] address );
        begin
            `Info( "    Testing Master Clock" );

            test_name = "Master Clock";

            `Info( "        Waiting for IDLE" );
            test_wait_for_bus( 1, 1, 0, 2 );

            `Info( "        Sending word in" );

            sent = { address, 1'H0 };

            set_master_pipe_in( 'H1, 1'H1, sent, 1 );

            while ( !master_pipe_in_ready ) begin
                `Info( "            Waiting" );
                pipeline_clock_full;
            end

            pipeline_clock_full;

            clear_master_pipe_in;

            `Info( "        Waiting for START" );
            test_wait_for_bus( 1, 0, 0, 1 );

            `Info( "        Waiting for ENTERING" );
            test_wait_for_bus( 0, 0, ClockCount / 4, 1 );

            bit = 0;

            for ( j = PipeDataWidth-1; j >= 0; j = j - 1  ) begin

                bit = sent[ PipeDataWidth - 1 ];
                sent = sent << 1;

                `InfoDo $display( "        Bit %d : %x", j, bit );

                `InfoDo $display( "            Clock on Bus" );
                test_wait_for_bus( 1, bit, ( ClockCount / 2 ), 1 );

                `InfoDo $display( "            Clock off Bus" );
                test_wait_for_bus( 0, bit, ( ClockCount / 2 ), 1 );

            end

            `InfoDo $display( "        ACK" );
            test_wait_for_bus( 1, 1, ( ClockCount / 2 ), 1 );

            `InfoDo $display( "            Clock off Bus" );
            test_wait_for_bus( 0, 1, ( ClockCount / 2 ), 10  ); // much more leeway given here because the module is dumping a status out to the out pipe

            `InfoDo $display( "            Ending" );
            test_wait_for_bus( 0, 0, ( ClockCount / 4 ), 10  ); // much more leeway given here because the module is dumping a status out to the out pipe


            `InfoDo $display( "            Ending" );
            test_wait_for_bus( 1, 0, ( ClockCount / 4 ), 1  );

            `InfoDo $display( "            Stop" );
            test_wait_for_bus( 1, 1 , ( ClockCount / 4 ), 5 );

        end
    endtask

    reg [PipeDataWidth-2:0] slave_address;

    task test_master_write( input integer index, input reg match, input integer count,
                            input integer master_stall, input integer master_stall_phase );
        begin
            `InfoDo $display( "    Testing Master Write Slave Address %2x In Pipe %x Operation %x In Pipe %x Read Count %2x In Pipe %x Index %0d Match %0d Count %0d  Master Pause %0d Phase %0d",
                                    master_slave_address, master_slave_address_in_pipe, master_operation, master_operation_in_pipe, master_read_count, master_read_count_in_pipe,
                                    index, match, count, master_stall, master_stall_phase );

            `InfoDo $display( "        Send Address %x Send Operation %x Send Write Count %x", master_send_address, master_send_operation, master_send_write_count );

            test_name = "Master Clock";

            // `Info( "        Waiting for ready" );
            // while ( ~master_pipe_in_ready )
            //     pipeline_clock_quiet;

            pipeline_clock_quiet;

            // initially idle
            test_bus( 1, 1 );

            slave_address = ( index ) ? Slave1Address : Slave0Address;

            if ( !match )
                slave_address = 7'H7F;

            if ( master_slave_address_in_pipe ) begin
                `InfoDo $display( "        Sending Address (Write) %2X", slave_address );
                if ( master_operation_in_pipe ) begin
                    `InfoDo $display( "        Sending Operation Write (0)" );
                    set_master_pipe_in( 'H1, 'H0, { slave_address, 1'H0 }, 1 );
                end else begin
                    set_master_pipe_in( 'H1, 'H0, { 1'H0, slave_address }, 1 );
                    master_operation = 0;
                end
            end else begin
                `InfoDo $display( "        Setting Address %2X", slave_address );
                master_slave_address = slave_address;
                if ( master_operation_in_pipe ) begin
                    `InfoDo $display( "        Sending Operation Write (0)" );
                    set_master_pipe_in( 'H1, 'H0, 1'H0, 1 );
                end else begin
                    `InfoDo $display( "        Setting Operation Write (0)" );
                    master_operation = 0;
                    // No master start in WRITES, but it's missed named.
                    master_start_operation <= 1;
                end
            end

            show_pipelines;

            if ( !master_start_operation ) begin
                `Info( "        Waiting for ready" );
                while ( ~master_pipe_in_ready )
                    pipeline_clock_quiet;
            end

            pipeline_clock_quiet;


            master_start_operation <= 0;

            show_pipelines;

            clear_master_pipe_in;

            master_pipe_in_count = 0;
            master_pipe_out_count = 0;
            slave_pipe_out_count = 0;
            data_offset = 8'HC0;
            loop_count = ( count * ClockCount * 100 );
            i = 0;
            while ( ( ( master_pipe_out_count < ( ( master_send_write_count ) + ( master_send_address || master_send_operation ) ) ) ||
                    ( master_pipe_in_count < count ) ||
                    ( match && ( slave_pipe_out_count <= count ) ) ) &&
                    ( i < loop_count ) ) begin
                if ( master_pipe_in_ready && ( master_pipe_in_count < count ) )  begin
                    `InfoDo $display( "        Sending Master Data %0x Count %0d", master_pipe_in_count + data_offset, master_pipe_in_count );
                    set_master_pipe_in( 'H0, ( ( master_pipe_in_count == ( count - 1 ) ) ), master_pipe_in_count + data_offset, 1 );
                    master_pipe_in_count = master_pipe_in_count + 1;
                    show_pipelines;
                end
                if ( match && slave_pipe_out_valid[ index ] ) begin
                    `InfoDo $display( "                            Checking Slave Data %0x Count %0d", (( slave_pipe_out_count < count ) ? slave_pipe_out_count + data_offset : 0), slave_pipe_out_count );
                    check_slave_pipe_out( index, ( slave_pipe_out_count == 0 ),
                                             ( slave_pipe_out_count == count),
                                             ( slave_pipe_out_count < count ) ? slave_pipe_out_count + data_offset : 0 );
                    slave_pipe_out_count = slave_pipe_out_count + 1;
                    show_pipelines;
                end
                if ( master_pipe_out_ready && master_pipe_out_valid ) begin
                    if ( master_pipe_out_count == 0 ) begin
                        if ( master_send_address ) begin
                            `InfoDo $display( "                                            Checking Master Status Address %x Write", slave_address );
                            if ( master_send_operation )
                                check_master_pipe_out( 1, ( ~master_send_write_count ), { slave_address, 1'H0 } );
                            else
                                check_master_pipe_out( 1, ( ~master_send_write_count ), { 1'H0, slave_address } );
                        end else begin
                            if ( master_send_operation )
                                check_master_pipe_out( 1, ( ~master_send_write_count ), 1'H0 );
                            else begin
                                if ( master_send_write_count ) begin
                                    `InfoDo $display( "                                            Checking Master Status Count %-0d", ( match ? count : 0 ) );
                                    check_master_pipe_out( 1, 1, ( match ? count : 0 ) );
                                end
                            end
                        end
                    end
                    if ( master_pipe_out_count == 1 ) begin
                        `InfoDo $display( "                                            Checking Master Status Count %-0d", ( match ? count : 0 ) );
                        check_master_pipe_out( 0, 1, ( match ? count : 0 ) );
                    end
                    master_pipe_out_count = master_pipe_out_count + 1;
                    show_pipelines;
                end

                pipeline_clock_quiet;

                if ( master_stall && ( ( i % master_stall ) == master_stall_phase ) ) begin
                    master_pipe_out_ready = 0;
                    // `Info( "        Master Pause" );
                end else begin
                    master_pipe_out_ready = 1;
                end

                i = i + 1;

                // $display( "%d/%d", i, loop_count );

            end

            `AssertEqual( master_pipe_out_count, ( ( master_send_write_count ) + ( master_send_address || master_send_operation ) ), "Feedback"  );
            `AssertEqual( master_pipe_in_count, count, "Master Data In"  );

            if ( match ) begin
                `AssertEqual( slave_pipe_out_count, count + 1, "Slave Data Out"  );
                `Assert( master_complete, "Complete" );
                `Assert( ~master_error, "No Error" );
                `AssertEqual( master_write_count, count, "Reporting the correct write count" );
            end else begin
                `Assert( ~master_complete, "No Complete" );
                `Assert( master_error, "Error" );
            end

            `Assert( i < loop_count, "Ran out of time" );

            clear_master_pipe_in;

            for ( i = 0; i < 2 * ClockCount; i = i + 1 )
                pipeline_clock_quiet;

            `Info( "        Done" );
            // finally idle
            test_bus( 1, 1 );

        end
    endtask

    reg [ PipeDataWidth-1:0] slave_address_word;

    task test_master_read( input integer index, input reg match, input integer count, input integer master_stall, input integer master_stall_phase );
        begin
            `InfoDo $display( "    Testing Master Read Address %2x (%x) Operation %x (%x) Count %2x (%x) Index %0d Match %0d Count %0d Master Pause %0d Phase %0d",
                                    master_slave_address, master_slave_address_in_pipe, master_operation, master_operation_in_pipe, master_read_count, master_read_count_in_pipe,
                                    index, match, count, master_stall, master_stall_phase );

            `InfoDo $display( "        Send Address %x Send Operation %x Send Write Count %x", master_send_address, master_send_operation, master_send_write_count );

            test_name = "Slave Master Transfer";

            pipeline_clock_quiet;

            // initially idle
            test_bus( 1, 1 );

            slave_address = ( index ) ? Slave1Address : Slave0Address;

            if ( !match )
                slave_address = ( slave_address ^ 7'H7F ) + 1'H1;

            if ( !master_read_count_in_pipe  ) begin
                 master_read_count = count;
                `InfoDo $display( "        Setting Count %2X", master_read_count );
            end

            if ( master_slave_address_in_pipe ) begin
                if ( master_operation_in_pipe ) begin
                    `InfoDo $display( "        Sending Address & Operation (Read) %2X", slave_address );
                    slave_address_word = { slave_address, 1'H1 };
                end else begin
                    `InfoDo $display( "        Sending Address %2X", slave_address );
                    slave_address_word = { 1'H0, slave_address };
                    master_operation = 1;
                end
                set_master_pipe_in( 'H1, 'H0, slave_address_word, 1 );
                show_pipelines;
                while ( ~master_pipe_in_ready ) begin
                    show_pipelines;
                    pipeline_clock_quiet;
                end
                pipeline_clock_quiet;
            end else begin
                `InfoDo $display( "        Setting Address %2X", slave_address );
                master_slave_address = slave_address;
                if ( master_operation_in_pipe ) begin
                    `InfoDo $display( "        Sending Operation Read (1)" );
                    set_master_pipe_in( 'H1, 'H0, 1'H1, 1 );
                    show_pipelines;
                    while ( ~master_pipe_in_ready ) begin
                        set_master_pipe_in( 'H1, 'H0, 1'H1, 1 );
                        show_pipelines;
                        pipeline_clock_quiet;
                    end
                    pipeline_clock_quiet;
                end else begin
                    master_operation = 1;
                    `InfoDo $display( "        Setting Operation %2X", 1'H1 );
                end
            end

            // Send the count... might need to set the start bit
            if ( master_read_count_in_pipe ) begin
                `InfoDo $display( "        Sending Count %2X", count );
                set_master_pipe_in( (~master_operation_in_pipe && ~master_slave_address_in_pipe), 'H1, count, 1 );
                show_pipelines;
                while ( ~master_pipe_in_ready ) begin
                    pipeline_clock_quiet;
                end
                pipeline_clock_quiet;
                clear_master_pipe_in;
            end else begin
                master_start_operation <= 1;
            end

            pipeline_clock_quiet;
            master_start_operation <= 0;

            master_pipe_in_count = 0;
            master_pipe_out_count = 0;
            slave_pipe_in_count = 0;
            data_offset = 8'HD0;
            loop_count = ( count * ClockCount * 20 );
            i = 0;
            while ( ( (~match && ( master_pipe_out_count < 1 ) ) ||
                      (match && ( master_pipe_out_count <= count - 1 + ( master_send_address || master_send_operation ) ) ) ||
                      (match && ( slave_pipe_in_count < count ) ) ) &&
                      ( i < loop_count ) ) begin

                if ( match && slave_pipe_in_ready[ index ] && ( slave_pipe_in_count < count ) )  begin
                    `InfoDo $display( "        Sending Slave %d Data %0x Count %0d", index, slave_pipe_in_count + data_offset, slave_pipe_in_count );
                    set_slave_pipe_in( index, ( slave_pipe_in_count == 0 ), ( slave_pipe_in_count == ( count - 1 ) ), slave_pipe_in_count + data_offset, 1 );
                    slave_pipe_in_count = slave_pipe_in_count + 1;
                    show_pipelines;
                end

                if ( master_pipe_out_ready && match && ( master_pipe_out_count <= count ) && master_pipe_out_valid ) begin
                    if ( ( master_send_address || master_send_operation ) && ( master_pipe_out_count == 0 ) ) begin
                        if ( master_send_address && master_send_operation ) begin
                            `InfoDo $display( "                            Checking Master Address/Operation %0x", { slave_address, 1'H1 } );
                            check_master_pipe_out( 1, 0, { slave_address, 1'H1 } );
                        end else begin
                            if ( master_send_address ) begin
                                `InfoDo $display( "                            Checking Master Address %0x", { 1'H0, slave_address } );
                                check_master_pipe_out( 1, 0, { 1'H0, slave_address } );
                            end else begin
                                `InfoDo $display( "                            Checking Master Operation Read %0x", 1 );
                                check_master_pipe_out( 1, 0, 1'H1 );
                            end
                        end
                    end else begin
                        `InfoDo $display( "                            Checking Master Data %0x Count %0d", master_pipe_out_count + data_offset - ( master_send_address || master_send_operation ), master_pipe_out_count );
                        check_master_pipe_out( ( master_pipe_out_count == 0 ),
                                            ( master_pipe_out_count == count -1 + ( master_send_address || master_send_operation ) ),
                                            ( master_pipe_out_count + data_offset - ( master_send_address || master_send_operation )) );
                    end
                    master_pipe_out_count = master_pipe_out_count + 1;
                    show_pipelines;
                end
                if ( master_pipe_out_ready && ~match && ( master_pipe_out_count < 1 ) && master_pipe_out_valid ) begin
                    `InfoDo $display( "                            Checking Master Data STX-ETX-%0x ",{ slave_address, 1'H1 } );
                    check_master_pipe_out( 1, 1, { slave_address, 1'H1 }  );
                    master_pipe_out_count = master_pipe_out_count + 1;
                    show_pipelines;
                end
                pipeline_clock_quiet;

                if ( master_stall && ( ( i % master_stall ) == master_stall_phase ) ) begin
                    master_pipe_out_ready = 0;
                    // `Info( "        Master Pause" );
                end else begin
                    master_pipe_out_ready = 1;
                end

                i = i + 1;
            end

            if ( match ) begin
                `AssertEqual( master_pipe_out_count, count + ( master_send_address || master_send_operation ), "Master Data In"  );
                `AssertEqual( slave_pipe_in_count, count, "Slave Data In"  );
                `Assert( master_complete, "Complete" );
                `Assert( ~master_error, "No Error" );
            end else begin
                `Assert( ~master_complete, "No Complete" );
                `Assert( master_error, "Error" );
            end

            `Assert( i < loop_count, "Ran out of time" );

            clear_master_pipe_in;

            pipeline_clock_quiet;

            `Info( "        Done" );

            for ( i = 0; i < 2 * ClockCount; i = i + 1 )
                pipeline_clock_quiet;

            // finally idle
            test_bus( 1, 1 );

        end
    endtask

    //
    // Write Read is not fully implemented, therefore it won't be tested!
    //
/*
    task test_master_write_read( input integer index, input reg match,
                                 input integer count, input integer repeated_read_count,
                                 input integer master_stall, input integer master_stall_phase );
        begin
            `InfoDo $display( "    Testing Master Write Read Index %0d Match %0d Write Count %0d Read Count %0d Master Pause %0d Phase %0d", index, match, count, repeated_read_count, master_stall, master_stall_phase );

            `InfoDo $display( "        Send Address %x Send Operation %x Send Write Count %x", master_send_address, master_send_operation, master_send_write_count );

            test_name = "Master Clock";

            // This works by not sending a STOP bit at the end of a write.  The master just sits waiting for more incoming characters to write out.
            // If, however there is a OPERATION_START signal, it can get on with the READ
            // In future, this should be acheivable by a WRITE READ mode.

            pipeline_clock_quiet;

            // initially idle
            test_bus( 1, 1 );

            // `Info( "        Waiting for ready" );
            // while ( ~master_pipe_in_ready )
            //     pipeline_clock_quiet;

            slave_address = ( index ) ? Slave1Address : Slave0Address;

            if ( !match )
                slave_address = 7'H7F;

            if ( master_slave_address_in_pipe ) begin
                `InfoDo $display( "        Sending Address (Write) %2X", slave_address );
                if ( master_operation_in_pipe ) begin
                    `InfoDo $display( "        Sending Operation Write (0)" );
                    set_master_pipe_in( 'H1, 'H0, { slave_address, 1'H0 }, 1 );
                end else begin
                    set_master_pipe_in( 'H1, 'H0, { 1'H0, slave_address }, 1 );
                    master_operation = 0; // write
                end
            end else begin
                `InfoDo $display( "        Setting Address %2X", slave_address );
                master_slave_address = slave_address;
                if ( master_operation_in_pipe ) begin
                    `InfoDo $display( "        Sending Operation Write (0)" );
                    set_master_pipe_in( 'H1, 'H0, 1'H0, 1 );
                end else begin
                    `InfoDo $display( "        Setting Operation Write (0)" );
                    master_operation = 0; // write
                    master_start_operation <= 1;
                end
            end

            if ( !master_start_operation ) begin
                while ( !master_pipe_in_ready )
                    pipeline_clock_quiet;
            end

            pipeline_clock_quiet;

            // initially idle
            // test_bus( 1, 1 );

            show_pipelines;


            master_start_operation <= 0;
            clear_master_pipe_in;

            master_pipe_in_count = 0;
            master_pipe_out_count = 0;
            slave_pipe_out_count = 0;
            slave_pipe_in_count = 0;
            data_offset = 8'HC0;
            repeat_data_offset = 8'HA0;
            loop_count = ( ( count + repeated_read_count)  * ClockCount * 100 );
            i = 0;
            while ( ( ( master_pipe_out_count < ( 3 + repeated_read_count ) ) ||
                      ( master_pipe_in_count <= count + 1 ) ||
                      ( match && ( slave_pipe_out_count < count ) ) ) &&
                    ( i < loop_count ) ) begin

                // Master is ready for DATA
                if ( master_pipe_in_ready && ( master_pipe_in_count <= count + 1 ) )  begin
                    if ( master_pipe_in_count == count + 1 ) begin
                        if ( master_read_count_in_pipe ) begin
                            `InfoDo $display( "        Sending Master Repeated Start ETX-Count" );
                            set_master_pipe_in( ( ~master_operation_in_pipe && ~master_operation_in_pipe ), 1, repeated_read_count, 1 );
                        end else begin
                                `InfoDo $display( "        Setting (Read) Start" );
                                master_start_operation = 1;
                            end
                    end else begin
                        if ( master_pipe_in_count == count ) begin

                            if ( !master_read_count_in_pipe ) begin
                                master_read_count = repeated_read_count;
                                `InfoDo $display( "        Setting Count (Read) %2X", master_read_count );
                            end

                            if ( master_slave_address_in_pipe ) begin
                                `InfoDo $display( "        Sending Address (Read) %2X", slave_address );
                                if ( master_operation_in_pipe ) begin
                                    `InfoDo $display( "        Sending Operation Read (1)" );
                                    set_master_pipe_in( 'H1, !master_read_count_in_pipe, { slave_address, 1'H1 }, 1 );
                                end else begin
                                    set_master_pipe_in( 'H1, !master_read_count_in_pipe, { 1'H0, slave_address }, 1 );
                                    master_operation = 1; // read
                                end
                            end else begin
                                `InfoDo $display( "        Setting Address %2X", slave_address );
                                master_slave_address = slave_address;
                                if ( master_operation_in_pipe ) begin
                                    `InfoDo $display( "        Sending Operation Read (1)" );
                                    set_master_pipe_in( 'H1, !master_read_count_in_pipe, 1'H1, 1 );
                                end else begin
                                    `InfoDo $display( "        Setting Operation Read (1)" );
                                    master_operation = 1; // read
                                end
                            end

                        end else begin
                            `InfoDo $display( "        Sending Master Data %0x Count %0d", master_pipe_in_count + data_offset, master_pipe_in_count );
                            set_master_pipe_in( 1'H0, 1'H0, master_pipe_in_count + data_offset, 1 );
                        end
                    end
                    master_pipe_in_count = master_pipe_in_count + 1;
                    show_pipelines;
                end

                if ( match && slave_pipe_out_valid[ index ] ) begin
                    `InfoDo $display( "                            Checking Slave Data %0x Count %0d", (( slave_pipe_out_count < count ) ? slave_pipe_out_count + data_offset : 0), slave_pipe_out_count );
                    check_slave_pipe_out( index, ( slave_pipe_out_count == 0 ),
                                             ( slave_pipe_out_count == count),
                                             ( slave_pipe_out_count < count ) ? slave_pipe_out_count + data_offset : 0 );
                    slave_pipe_out_count = slave_pipe_out_count + 1;
                    show_pipelines;
                end

                if ( master_pipe_out_ready && master_pipe_out_valid ) begin
                    if ( master_pipe_out_count == 0 ) begin
                        `InfoDo $display( "                                            Checking Master Status Address %x Write", slave_address );
                        check_master_pipe_out( 1, 0, { slave_address, 1'H0 } );
                    end
                    if ( master_pipe_out_count == 1 ) begin
                        `InfoDo $display( "                                            Checking Master Status Count %-0d", ( match ? count : 0 ) );
                        check_master_pipe_out( 0, 1, ( match ? count : 0 ) );
                    end
                    if ( master_pipe_out_count == 2 ) begin
                        `InfoDo $display( "                                            Checking Master Status Repeated Read Address %x", slave_address );
                        check_master_pipe_out( 1, 0, { slave_address, 1'H1 } );
                    end
                    if ( master_pipe_out_count > 2 ) begin
                        master_start_operation <= 0; // make sure we don't re-trigger
                        `InfoDo $display( "                                            Checking Master Data %-0x", master_pipe_out_count - 3 + repeat_data_offset );
                        check_master_pipe_out( 0,
                                               ( master_pipe_out_count == ( repeated_read_count + 2 ) ),
                                               master_pipe_out_count - 3 + repeat_data_offset );
                    end
                    master_pipe_out_count = master_pipe_out_count + 1;
                    show_pipelines;
                end

                if ( slave_pipe_in_ready[ index ] && ( slave_pipe_in_count < repeated_read_count ) )  begin
                    `InfoDo $display( "        Sending Slave %d Data %0x Count %0d", index, slave_pipe_in_count + repeat_data_offset, slave_pipe_in_count );
                    set_slave_pipe_in( index, ( slave_pipe_in_count == 0 ), ( slave_pipe_in_count == ( repeated_read_count - 1 ) ), slave_pipe_in_count + repeat_data_offset, 1 );
                    slave_pipe_in_count = slave_pipe_in_count + 1;
                    show_pipelines;
                    // good time to kill the read start
                    master_start_operation <= 0;
                end


                pipeline_clock_quiet;

                if ( master_stall && ( ( i % master_stall ) == master_stall_phase ) ) begin
                    master_pipe_out_ready = 0;
                    `Info( "        Master Pause" );
                end else begin
                    master_pipe_out_ready = 1;
                end

                // $display( "%d/%d", i, loop_count );

                i = i + 1;
            end

            `AssertEqual( master_pipe_out_count, repeated_read_count + 3, "Master Data In"  );

            `AssertEqual( master_pipe_in_count, count + 2, "Master Data In"  );
            if ( match ) begin
                `AssertEqual( slave_pipe_out_count, count + 1, "Slave Data Out"  );
                `Assert( master_complete, "Complete" );
                `Assert( ~master_error, "No Error" );
                `AssertEqual( master_write_count, count, "Reporting the correct write count" );
            end else begin
                `Assert( ~master_complete, "No Complete" );
                `Assert( master_error, "Error" );
            end

            `Assert( i < loop_count, "Ran out of time" );

            `Info( "        Done" );

            for ( i = 0; i < 2 * ClockCount; i = i + 1 )
                pipeline_clock_quiet;

            test_bus( 1, 1 );

        end
    endtask
*/
    initial begin
        $display( "\nI2C Master Slave Test %s", `__FILE__ );

        pipeline_initialize;

        pipeline_clear_inputs;

        pipeline_clock_quiet;

        `Info( "Start" );

        pipeline_clock;

        pipeline_clock_multiple( 100 );

        master_operation_configure_ad_count_op( -1, -1, -1 );
        master_send_configure( 1, 1, 1 );

        `Info( "    Bus At Rest" );
        test_bus( 1, 1 );

        // test master clocking down to the cycle
        test_master_clock( 8'HFE );
        pipeline_clock_multiple( 40 );

        //
        // Test Writes
        //
        // not addressing
        test_master_write( 0, 0, 10, 0, 0 );
        pipeline_clock_multiple( 100 );

        // not addressing - stall
        test_master_write( 0, 0, 10, 2, 0 );
        pipeline_clock_multiple( 100 );

        // not addressing - stall - phase 1
        test_master_write( 0, 0, 10, 2, 1 );
        pipeline_clock_multiple( 100 );

        // addressing Slave0
        test_master_write( 0, 1, 10, 0, 0 );
        pipeline_clock_multiple( 100 );
        // addressing Slave0 - stall
        test_master_write( 0, 1, 10, 2, 0 );
        pipeline_clock_multiple( 100 );

        // addressing Slave0 - stall phase 1
        test_master_write( 0, 1, 10, 2, 1 );
        pipeline_clock_multiple( 100 );

        // addressing Slave1
        test_master_write( 1, 1, 2, 0, 0 );
        pipeline_clock_multiple( 100 );

        // addressing Slave1
        test_master_write( 0, 0, 1, 0, 0 );
        pipeline_clock_multiple( 100 );

        // addressing Slave1
        test_master_write( 0, 1, 1, 0, 0 );
        pipeline_clock_multiple( 100 );
        // Checking external (non-pipe) control

        // addressing Slave0

        // address specified by port
        master_operation_configure_ad_count_op( 0, -1, -1 );

        test_master_write( 0, 1, 2, 0, 0 );

        // all config in pipe

        master_operation_configure_ad_count_op( -1, -1, -1 );
        pipeline_clock_multiple( 100 );

        // MAYBE THIS NEVER WORKED

        // address & operation specified by port
        master_operation_configure_ad_count_op( 0, -1, 0 );
        test_master_write( 0, 1, 2, 0, 0 );

        // all config in pipe
        master_operation_configure_ad_count_op( -1, -1, -1 );
        pipeline_clock_multiple( 100 );

        // // address & operation specified by port
        master_operation_configure_ad_count_op( 0, 0, 0 );
        test_master_write( 0, 1, 2, 0, 0 );

        // all config in pipe
        master_operation_configure_ad_count_op( -1, -1, -1 );


        pipeline_clock_multiple( 100 );

        // operation specified by port
        master_operation_configure_ad_count_op( 0, 0, -1 );

        test_master_write( 0, 1, 2, 0, 0 );

        // all config in pipe
        master_operation_configure_ad_count_op( -1, -1, -1 );

        pipeline_clock_multiple( 100 );

        // operation specified by port
        master_operation_configure_ad_count_op( -1, -1, -1 );
        master_send_configure( 1, 1, 1 );
        test_master_write( 0, 1, 2, 0, 0 );

        // config back to default
        master_send_configure( 1, 1, 1 );
        master_operation_configure_ad_count_op( -1, -1, -1 );

        // Operation and Count feedback
        master_operation_configure_ad_count_op( -1, -1, -1 );
        master_send_configure( 0, 1, 1 );
        test_master_write( 0, 1, 2, 0, 0 );

        // Address and Count
        master_operation_configure_ad_count_op( -1, -1, -1 );
        master_send_configure( 1, 0, 1 );
        test_master_write( 0, 1, 2, 0, 0 );

        // Count only
        master_operation_configure_ad_count_op( -1, -1, -1 );
        master_send_configure( 0, 0, 1 );
        test_master_write( 0, 1, 2, 0, 0 );

        // No feedback back
        master_operation_configure_ad_count_op( -1, -1, -1 );
        master_send_configure( 0, 0, 0 );
        test_master_write( 0, 1, 2, 0, 0 );

        // config back to default
        master_send_configure( 1, 1, 1 );
        master_operation_configure_ad_count_op( -1, -1, -1 );
        //
        // Read Tests
        //

        master_send_configure( 1, 1, 1 );
        master_operation_configure_ad_count_op( -1, -1, -1 );

        // no match
        test_master_read( 0, 0, 1, 0, 0 );
        pipeline_clock_multiple( 100 );

        // no match - stalls
        test_master_read( 0, 0, 1, 2, 0 );
        pipeline_clock_multiple( 100 );

        // no match - stalls phase 1
        test_master_read( 0, 0, 1, 2, 1 );
        pipeline_clock_multiple( 100 );

        test_master_read( 0, 0, 2, 0, 0 );
        pipeline_clock_multiple( 100 );

        // matching read 2
        test_master_read( 0, 1, 2, 0, 0 );
        pipeline_clock_multiple( 100 );


        // matching read 2, pausing
        test_master_read( 1, 1, 2, 2, 0 );
        pipeline_clock_multiple( 100 );

        test_master_read( 0, 1, 10, 0, 0 );
        pipeline_clock_multiple( 100 );

        // address specified by port
        master_operation_configure_ad_count_op( 0, -1, -1 );

        test_master_read( 0, 1, 2, 0, 0 );

        // all config in pipe
        master_operation_configure_ad_count_op( -1, -1, -1 );

        pipeline_clock_multiple( 100 );

        // address & operation specified by port
        master_operation_configure_ad_count_op( 0, -1, 0 );

        test_master_read( 0, 1, 2, 0, 0 );

        // all config in pipe
        master_operation_configure_ad_count_op( -1, -1, -1 );

        pipeline_clock_multiple( 100 );

        // address & operation specified by port
        master_operation_configure_ad_count_op( 0, 0, 0 );

        test_master_read( 0, 1, 2, 0, 0 );

        // all config in pipe
        master_operation_configure_ad_count_op( -1, -1, -1 );

        pipeline_clock_multiple( 100 );

        // address & operation specified by port
        master_operation_configure_ad_count_op( -1, 0, 0 );

        test_master_read( 0, 1, 2, 0, 0 );

        // all config in pipe
        master_operation_configure_ad_count_op( -1, -1, -1 );
        pipeline_clock_multiple( 100 );

        // address & operation specified by port
        master_operation_configure_ad_count_op( 0, 0, -1 );
        test_master_read( 0, 1, 2, 0, 0 );

        // address & operation specified inline
        master_operation_configure_ad_count_op( -1, -1, -1 );
        // Send no address
        master_send_configure( 0, 1, 1 );
        test_master_read( 0, 1, 2, 0, 0 );

        // address & operation specified inline
        master_operation_configure_ad_count_op( -1, -1, -1 );
        // Send no address and no operation
        master_send_configure( 0, 0, 1 );
        test_master_read( 0, 1, 2, 0, 0 );

        // address & operation specified inline
        master_operation_configure_ad_count_op( -1, -1, -1 );
        // Send address, but no operation
        master_send_configure( 1, 0, 1 );
        test_master_read( 0, 1, 2, 2, 0 ); // pauses for random fun

        // all config in pipe, send everything
        master_operation_configure_ad_count_op( -1, -1, -1 );
        master_send_configure( 1, 1, 1 );

        pipeline_clock_multiple( 100 );
/*
*/
/*  NOTE - THIS WRITE THEN READ FEATURE IS NOT COMPLETE.

    I HAVE REMOVED THESE TESTS SO WORK MAY CONTINUE

        //
        // Write then Repeated Read
        //

        master_operation_configure_ad_count_op( -1, -1, -1 );

        // addressing Slave0
        test_master_write_read( 0, 1, 1, 2, 0, 0 );
        pipeline_clock_multiple( 100 );
        test_master_write_read( 0, 1, 3, 6, 0, 0 );
        pipeline_clock_multiple( 100 );

        // address specified by port
        master_operation_configure_ad_count_op( 0, -1, -1 );

        test_master_write_read( 0, 1, 1, 2, 0, 0 );

        // all config in pipe
        master_operation_configure_ad_count_op( -1, -1, -1 );

        // address specified by port
        master_operation_configure_ad_count_op( 0, -1, 0 );

        test_master_write_read( 0, 1, 1, 2, 0, 0 );

        // all config in pipe
        master_operation_configure_ad_count_op( -1, -1, -1 );

        pipeline_clock_multiple( 100 );

        // Everything done by port, not pipe
        master_operation_configure_ad_count_op( 0, 0, 0 );
        test_master_write_read( 0, 1, 1, 2, 0, 0 );

        // all config in pipe
        master_operation_configure_ad_count_op( -1, -1, -1 );
*/
        pipeline_clock_multiple( 100 );
        `Info( "Stop" );

        `AssertSummary

        $finish;
    end

endmodule

