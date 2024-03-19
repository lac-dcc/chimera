// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps



module jelly_jbus_logger
        #(
            parameter   ADDR_WIDTH      = 12,
            parameter   DATA_SIZE       = 2,        // 2^n (0:8bit, 1:16bit, 2:32bit ...)
            parameter   DATA_WIDTH      = (8 << DATA_SIZE),
            parameter   SEL_WIDTH       = (DATA_WIDTH / 8),
            parameter   FILE_NAME       = "",
            parameter   DISPLAY         = 1,
            parameter   MESSAGE         = "[jbus]",
            parameter   CHECK_DATA      = 0,
            parameter   CHECK_ADR_MASK  = 32'hf000_0000,
            parameter   CHECK_ADR_VALUE = 32'h0000_0000,
            parameter   CHECK_MEM_SIZE  = 256*1024
        )
        (
            // system
            input   wire                        clk,
            input   wire                        reset,
            
            // slave port
            input   wire                        jbus_en,
            input   wire    [ADDR_WIDTH-1:0]    jbus_addr,
            input   wire    [DATA_WIDTH-1:0]    jbus_wdata,
            input   wire    [DATA_WIDTH-1:0]    jbus_rdata,
            input   wire                        jbus_we,
            input   wire    [SEL_WIDTH-1:0]     jbus_sel,
            input   wire                        jbus_valid,
            input   wire                        jbus_ready
        );

    reg                         read_busy;
    reg     [ADDR_WIDTH-1:0]    read_addr;
    reg     [SEL_WIDTH-1:0]     read_sel;

    integer                     file;
    
    initial begin
        read_busy = 1'b0;
        if ( FILE_NAME != "" ) begin
            file = $fopen(FILE_NAME, "w");
            $fclose(file);
        end
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
            read_busy <= 1'b0;
            read_addr <= {ADDR_WIDTH{1'bx}};
            read_sel  <= {SEL_WIDTH{1'bx}};
        end
        else begin
            if ( jbus_en & !jbus_we & jbus_valid & jbus_ready ) begin
                read_busy <= 1'b1;
                read_addr <= jbus_addr;
                read_sel  <= jbus_sel;
            end
            else if ( jbus_ready ) begin
                read_busy <= 1'b0;
                read_addr <= {ADDR_WIDTH{1'bx}};
                read_sel  <= {SEL_WIDTH{1'bx}};
            end
            
            // read
            if ( read_busy & jbus_ready ) begin
                if ( DISPLAY ) begin
                    $display(" %d %s r %h %h %h", $time, MESSAGE, read_addr, jbus_rdata, read_sel);
                end
                if ( FILE_NAME != "" ) begin
                    file = $fopen(FILE_NAME, "a");
                    $fdisplay(file, "%d %s r %h %h %h", $time, MESSAGE, read_addr, jbus_rdata, read_sel);
                    $fclose(file);
                end
            end
            
            // write
            if ( jbus_en & jbus_we & jbus_valid & jbus_ready ) begin
                if ( DISPLAY ) begin
                    $display("%d %s w %h %h %h", $time, MESSAGE, jbus_addr, jbus_wdata, jbus_sel);
                end
                if ( FILE_NAME != "" ) begin
                    file = $fopen(FILE_NAME, "a");
                    $fdisplay(file, "%d %s w %h %h %h", $time, MESSAGE, jbus_addr, jbus_wdata, jbus_sel);
                    $fclose(file);
                end
            end
        end
    end
    
    generate
    if ( CHECK_DATA ) begin
        reg     [ADDR_WIDTH-1:0]    table_addr      [0:CHECK_MEM_SIZE-1];
        reg     [DATA_WIDTH-1:0]    table_data      [0:CHECK_MEM_SIZE-1];
        integer                     table_size = 0;
        
        // write
        task write_table;
        input   [ADDR_WIDTH-1:0]    addr;
        input   [DATA_WIDTH-1:0]    data;
        input   [SEL_WIDTH-1:0]     sel;
        integer                     i, j;
        integer                     index;
        begin
            if ( (addr & CHECK_ADR_MASK) == CHECK_ADR_VALUE ) begin
                index = -1;
                for ( i = 0; i < table_size; i = i + 1 ) begin
                    if ( table_addr[i] == addr ) begin
                        index = i;
                    end
                end
                if ( index < 0 && table_size + 1 < CHECK_MEM_SIZE ) begin
                    index      = table_size;
                    table_size = table_size + 1;
                end
                if ( index >= 0 ) begin
                    table_addr[index] = addr;
                    for ( i = 0; i < SEL_WIDTH; i = i + 1 ) begin
                        if ( sel[i] ) begin
                            for ( j = 0; j < SEL_WIDTH; j = j + 1 ) begin
                                table_data[index][i*8+j] = data[i*8+j];
                            end
                        end
                    end
                end
            end
        end
        endtask
        
        // read
        task read_table;
        input   [ADDR_WIDTH-1:0]    addr;
        input   [DATA_WIDTH-1:0]    data;
        input   [SEL_WIDTH-1:0]     sel;
        integer                     i, j;
        integer                     index;
        integer                     result;
        begin
            if ( (addr & CHECK_ADR_MASK) == CHECK_ADR_VALUE ) begin
                index  = -1;
                for ( i = 0; i < table_size; i = i + 1 ) begin
                    if ( table_addr[i] == addr ) begin
                        index = i;
                    end
                end
                if ( index >= 0 ) begin
                    result = 1;
                    table_addr[index] = addr;
                    for ( i = 0; i < SEL_WIDTH; i = i + 1 ) begin
                        if ( sel[i] ) begin
                            for ( j = 0; j < SEL_WIDTH; j = j + 1 ) begin
                                if ( table_data[index][i*8+j] !== 1'bx && table_data[index][i*8+j] !== data[i*8+j] ) begin
                                    result = 0;
                                end
                            end
                        end
                    end
                    if ( !result ) begin
                        $display("read miss match: %h %h %h (exp:%h) %d", addr, data ,sel, table_data[index], $time);
                    end
                end
                write_table(addr, data, sel);
            end
        end
        endtask
        
        always @( posedge clk ) begin
            if ( !reset ) begin
                // read
                if ( read_busy & jbus_ready ) begin
                    read_table(read_addr, jbus_rdata, read_sel);
                end
                
                // write
                if ( jbus_en & jbus_we & jbus_valid & jbus_ready ) begin
                    write_table(jbus_addr, jbus_wdata, jbus_sel);
                end
            end
        end
    end
    endgenerate
    
endmodule


// end of file
