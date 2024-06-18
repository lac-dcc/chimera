// This program was cloned from: https://github.com/WangXuan95/FPGA-SDcard-Reader-SPI
// License: GNU General Public License v3.0


//--------------------------------------------------------------------------------------------------------
// Module  : sd_spi_file_reader
// Type    : synthesizable, IP's top
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: A SDcard reader via SPI.
//           Specify a filename, sd_spi_file_reader will read out file content
//           Support CardType   : SDv1.1 , SDv2  or SDHCv2
//           Support FileSystem : FAT16 or FAT32
//--------------------------------------------------------------------------------------------------------

module sd_spi_file_reader #(
    parameter            FILE_NAME_LEN = 11           , // length of FILE_NAME (in bytes). Since the length of "example.txt" is 11, so here is 11.
    parameter [52*8-1:0] FILE_NAME     = "example.txt", // file name to read, ignore upper and lower case
                                                        // For example, if you want to read a file named "HeLLo123.txt", this parameter can be "hello123.TXT", "HELLO123.txt" or "HEllo123.Txt"
    parameter            SPI_CLK_DIV   = 50             // SD spi_sck freq = clk freq/(2*SPI_CLK_DIV), modify SPI_CLK_DIV to change the SPI speed
                                                        // For example, when clk=50MHz, SPI_CLK_DIV=50,then spi_sck=50MHz/(2*50)=500kHz, 500kHz is a typical SPI speed for SDcard
)(
    input  wire       rstn,                             // rstn active-low, 1:working, 0:reset
    input  wire       clk,                              // clock 
    // SDcard spi interface
    output wire       spi_ssn, spi_sck, spi_mosi,
    input  wire       spi_miso,
    // status output (optional for user)
    output wire [1:0] card_type,                        // SDv1, SDv2, SDHCv2 or UNKNOWN
    output wire [3:0] card_stat,                        // show the sdcard initialize status
    output wire [1:0] filesystem_type,                  // FAT16, FAT32 or UNKNOWN
    output wire [2:0] filesystem_stat,                  // show the filesystem initialize status
    output reg        file_found,                       // 0=file not found, 1=file found
    // file content data output (sync with clk)
    output reg        outen,                            // when outen=1, a byte of file content is read out from outbyte
    output reg  [7:0] outbyte                           // a byte of file content
);


initial file_found = 1'b0;
initial {outen,outbyte} = 0;


function  [7:0] toUpperCase;
    input [7:0] in;
begin
    toUpperCase = (in>=8'h61 && in<=8'h7A) ? (in & 8'b11011111) : in;
end
endfunction


wire [52*8-1:0] FILE_NAME_UPPER;

generate genvar k;
    for (k=0; k<52; k=k+1) begin : convert_fname_to_upper
        assign FILE_NAME_UPPER[k*8 +: 8] = toUpperCase( FILE_NAME[k*8 +: 8] );
    end
endgenerate



reg         read_start     = 1'b0;
reg  [31:0] read_sector_no = 0;
wire        read_done;

wire        rvalid;
wire [ 8:0] raddr;
wire [ 7:0] rdata;

reg  [31:0] rootdir_sector = 0;       // rootdir sector number (FAT16 only)
reg  [15:0] rootdir_sectorcount = 0;  // (FAT16 only)

reg  [31:0] curr_cluster = 0;    // current reading cluster number

wire [ 6:0] curr_cluster_fat_offset;
wire [24:0] curr_cluster_fat_no;
assign {curr_cluster_fat_no,curr_cluster_fat_offset} = curr_cluster;

wire [ 7:0] curr_cluster_fat_offset_fat16;
wire [23:0] curr_cluster_fat_no_fat16;
assign {curr_cluster_fat_no_fat16,curr_cluster_fat_offset_fat16} = curr_cluster;

reg  [31:0] target_cluster = 0;           // target cluster number item in FAT32 table
reg  [15:0] target_cluster_fat16 = 16'h0; // target cluster number item in FAT16 table
reg  [ 7:0] cluster_sector_offset=8'h0;   // current sector number in cluster

reg  [31:0] file_cluster = 0;
reg  [31:0] file_size = 0;

reg  [ 7:0] cluster_size = 0;
reg  [31:0] first_fat_sector_no = 0;
reg  [31:0] first_data_sector_no= 0;

reg         search_fat = 1'b0;

localparam [2:0] RESET         = 3'd0,
                 SEARCH_MBR    = 3'd1,
                 SEARCH_DBR    = 3'd2,
                 LS_ROOT_FAT16 = 3'd3,
                 LS_ROOT_FAT32 = 3'd4,
                 READ_A_FILE   = 3'd5,
                 DONE          = 3'd6;

reg        [2:0] filesystem_state = RESET;

//enum logic [2:0] {RESET, SEARCH_MBR, SEARCH_DBR, LS_ROOT_FAT16, LS_ROOT_FAT32, READ_A_FILE, DONE} filesystem_state = RESET;

localparam [1:0] UNASSIGNED = 2'd0,
                 UNKNOWN    = 2'd1,
                 FAT16      = 2'd2,
                 FAT32      = 2'd3;

reg        [1:0] filesystem = UNASSIGNED,
                 filesystem_parsed;

//enum logic [1:0] {UNASSIGNED, UNKNOWN, FAT16, FAT32} filesystem=UNASSIGNED, filesystem_parsed;

assign filesystem_type = filesystem;
assign filesystem_stat = filesystem_state;




//----------------------------------------------------------------------------------------------------------------------
// loop variables
integer ii, i;



//----------------------------------------------------------------------------------------------------------------------
// store MBR or DBR fields
//----------------------------------------------------------------------------------------------------------------------
reg [ 7:0] sector_content [0:511];
initial for(ii=0; ii<512; ii=ii+1) sector_content[ii] = 0;

always @ (posedge clk)
    if(rvalid)
        sector_content[raddr] <= rdata;



//----------------------------------------------------------------------------------------------------------------------
// parse MBR or DBR fields
//----------------------------------------------------------------------------------------------------------------------
wire        is_boot_sector     = ( {sector_content['h1FE],sector_content['h1FF]}==16'h55AA );
wire        is_dbr             =    sector_content[0]==8'hEB || sector_content[0]==8'hE9;
wire [31:0] dbr_sector_no      =   {sector_content['h1C9],sector_content['h1C8],sector_content['h1C7],sector_content['h1C6]};
wire [15:0] bytes_per_sector   =   {sector_content['hC],sector_content['hB]};
wire [ 7:0] sector_per_cluster =    sector_content['hD];
wire [15:0] resv_sectors       =   {sector_content['hF],sector_content['hE]};
wire [ 7:0] number_of_fat      =    sector_content['h10];
wire [15:0] rootdir_itemcount  =   {sector_content['h12],sector_content['h11]};   // root dir item count (FAT16 Only)

reg  [31:0] sectors_per_fat = 0;
reg  [31:0] root_cluster    = 0;

always @ (*) begin    
    sectors_per_fat   = {16'h0, sector_content['h17], sector_content['h16]};
    root_cluster      = 0;
    if(sectors_per_fat>0) begin  // FAT16 case
        filesystem_parsed = FAT16;
    end else if(sector_content['h56]==8'h32) begin  // FAT32 case
        filesystem_parsed = FAT32;
        sectors_per_fat   = {sector_content['h27],sector_content['h26],sector_content['h25],sector_content['h24]};
        root_cluster      = {sector_content['h2F],sector_content['h2E],sector_content['h2D],sector_content['h2C]};
    end else begin   // Unknown FileSystem
        filesystem_parsed = UNKNOWN;
    end
end



//----------------------------------------------------------------------------------------------------------------------
// main FSM
//----------------------------------------------------------------------------------------------------------------------
always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        read_start <= 1'b0;
        read_sector_no <= 0;
        filesystem_state <= RESET;
        filesystem <= UNASSIGNED;
        search_fat <= 1'b0;
        cluster_size = 8'h0;
        first_fat_sector_no   = 0;
        first_data_sector_no  = 0;
        curr_cluster          = 0;
        cluster_sector_offset = 8'h0;
        rootdir_sector        = 0;
        rootdir_sectorcount   = 16'h0;
    end else begin
        read_start <= 1'b0;
        if(read_done) begin
            case(filesystem_state)
            SEARCH_MBR :    if(is_boot_sector) begin
                                filesystem_state <= SEARCH_DBR;
                                if(~is_dbr) read_sector_no <= dbr_sector_no;
                            end else begin
                                read_sector_no <= read_sector_no + 1;
                            end
            SEARCH_DBR :    if(is_boot_sector && is_dbr ) begin
                                if(bytes_per_sector!=16'd512) begin
                                    filesystem_state <= DONE;
                                end else begin
                                    filesystem <= filesystem_parsed;
                                    if(filesystem_parsed==FAT16) begin
                                        cluster_size        = sector_per_cluster;
                                        first_fat_sector_no = read_sector_no + resv_sectors;
                                        
                                        rootdir_sectorcount = rootdir_itemcount / (16'd512/16'd32);
                                        rootdir_sector      = first_fat_sector_no + sectors_per_fat * number_of_fat;
                                        first_data_sector_no= rootdir_sector + rootdir_sectorcount - cluster_size*2;
                                        
                                        cluster_sector_offset = 8'h0;
                                        read_sector_no      <= rootdir_sector + cluster_sector_offset;
                                        filesystem_state <= LS_ROOT_FAT16;
                                    end else if(filesystem_parsed==FAT32) begin
                                        cluster_size        = sector_per_cluster;
                                        first_fat_sector_no = read_sector_no + resv_sectors;
                                        
                                        first_data_sector_no= first_fat_sector_no + sectors_per_fat * number_of_fat - cluster_size * 2;
                                        
                                        curr_cluster        = root_cluster;
                                        cluster_sector_offset = 8'h0;
                                        read_sector_no      <= first_data_sector_no + cluster_size * curr_cluster + cluster_sector_offset;
                                        filesystem_state <= LS_ROOT_FAT32;
                                    end else begin
                                        filesystem_state <= DONE;
                                    end
                                end
                            end
            LS_ROOT_FAT16 :     if(file_found) begin
                                    curr_cluster = file_cluster;
                                    cluster_sector_offset = 8'h0;
                                    read_sector_no <= first_data_sector_no + cluster_size * curr_cluster + cluster_sector_offset;
                                    filesystem_state <= READ_A_FILE;
                                end else if(cluster_sector_offset<rootdir_sectorcount) begin
                                    cluster_sector_offset = cluster_sector_offset + 8'd1;
                                    read_sector_no <= rootdir_sector + cluster_sector_offset;
                                end else begin
                                    filesystem_state <= DONE;   // cant find target file
                                end
            LS_ROOT_FAT32 : if(~search_fat) begin
                                if(file_found) begin
                                    curr_cluster = file_cluster;
                                    cluster_sector_offset = 8'h0;
                                    read_sector_no <= first_data_sector_no + cluster_size * curr_cluster + cluster_sector_offset;
                                    filesystem_state <= READ_A_FILE;
                                end else if(cluster_sector_offset<(cluster_size-1)) begin
                                    cluster_sector_offset = cluster_sector_offset + 8'd1;
                                    read_sector_no <= first_data_sector_no + cluster_size * curr_cluster + cluster_sector_offset;
                                end else begin   // read FAT to get next cluster
                                    search_fat <= 1'b1;
                                    cluster_sector_offset = 8'h0;
                                    read_sector_no <= first_fat_sector_no + curr_cluster_fat_no;
                                end
                            end else begin
                                search_fat <= 1'b0;
                                cluster_sector_offset = 8'h0;
                                if(target_cluster=='h0FFF_FFFF || target_cluster=='h0FFF_FFF8 || target_cluster=='hFFFF_FFFF || target_cluster<2) begin
                                    filesystem_state <= DONE;   // cant find target file
                                end else begin
                                    curr_cluster = target_cluster;
                                    read_sector_no <= first_data_sector_no + cluster_size * curr_cluster + cluster_sector_offset;
                                end
                            end
            READ_A_FILE  :  if(~search_fat) begin
                                if(cluster_sector_offset<(cluster_size-1)) begin
                                    cluster_sector_offset = cluster_sector_offset + 8'd1;
                                    read_sector_no <= first_data_sector_no + cluster_size * curr_cluster + cluster_sector_offset;
                                end else begin   // read FAT to get next cluster
                                    search_fat <= 1'b1;
                                    cluster_sector_offset = 8'h0;
                                    read_sector_no <= first_fat_sector_no + (filesystem==FAT16 ? curr_cluster_fat_no_fat16 : curr_cluster_fat_no);
                                end
                            end else begin
                                search_fat <= 1'b0;
                                cluster_sector_offset = 8'h0;
                                if(filesystem==FAT16) begin
                                    if(target_cluster_fat16>=16'hFFF0 || target_cluster_fat16<16'h2) begin
                                        filesystem_state <= DONE;   // read to the end of file, done
                                    end else begin
                                        curr_cluster = {16'h0,target_cluster_fat16};
                                        read_sector_no <= first_data_sector_no + cluster_size * curr_cluster + cluster_sector_offset;
                                    end
                                end else begin
                                    if(target_cluster=='h0FFF_FFFF || target_cluster=='h0FFF_FFF8 || target_cluster=='hFFFF_FFFF || target_cluster<2) begin
                                        filesystem_state <= DONE;   // read to the end of file, done
                                    end else begin
                                        curr_cluster = target_cluster;
                                        read_sector_no <= first_data_sector_no + cluster_size * curr_cluster + cluster_sector_offset;
                                    end
                                end
                            end
            endcase
        end else begin
            case(filesystem_state)
                RESET         : filesystem_state  <= SEARCH_MBR;
                SEARCH_MBR    : read_start <= 1'b1;
                SEARCH_DBR    : read_start <= 1'b1;
                LS_ROOT_FAT16 : read_start <= 1'b1;
                LS_ROOT_FAT32 : read_start <= 1'b1;
                READ_A_FILE   : read_start <= 1'b1;
                //DONE          : $finish;   // only for finish simulation, will be ignore when synthesize
            endcase
        end
    end



//----------------------------------------------------------------------------------------------------------------------
// capture data in FAT table
//----------------------------------------------------------------------------------------------------------------------
always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
        target_cluster <= 0;
        target_cluster_fat16 <= 16'h0;
    end else begin
        if(search_fat && rvalid) begin
            if(filesystem==FAT16) begin
                if(raddr[8:1]==curr_cluster_fat_offset_fat16)
                    target_cluster_fat16[8*raddr[  0] +: 8] <= rdata;
            end else if(filesystem==FAT32) begin
                if(raddr[8:2]==curr_cluster_fat_offset)
                    target_cluster[8*raddr[1:0] +: 8] <= rdata;
            end
        end
    end
end



sd_spi_sector_reader #(
    .SPI_CLK_DIV ( SPI_CLK_DIV    )
) u_sd_spi_sector_reader (
    .rstn        ( rstn           ),
    .clk         ( clk            ),
    .spi_ssn     ( spi_ssn        ),
    .spi_sck     ( spi_sck        ),
    .spi_mosi    ( spi_mosi       ),
    .spi_miso    ( spi_miso       ),
    .card_type   ( card_type      ),
    .card_stat   ( card_stat      ),
    .start       ( read_start     ),
    .sector_no   ( read_sector_no ),
    .done        ( read_done      ),
    .rvalid      ( rvalid         ),
    .raddr       ( raddr          ),
    .rdata       ( rdata          )
);



//----------------------------------------------------------------------------------------------------------------------
// parse root dir
//----------------------------------------------------------------------------------------------------------------------
reg         fready = 1'b0;            // a file is find when fready = 1
reg  [ 7:0] fnamelen = 0;
reg  [15:0] fcluster = 0;
reg  [31:0] fsize = 0;
reg  [ 7:0] fname     [0:51];
reg  [ 7:0] file_name [0:51];
reg         isshort=1'b0, islongok=1'b0, islong=1'b0, longvalid=1'b0;
reg  [ 5:0] longno = 6'h0;
reg  [ 7:0] lastchar = 8'h0;
reg  [ 7:0] fdtnamelen = 8'h0;
reg  [ 7:0] sdtnamelen = 8'h0;
reg  [ 7:0] file_namelen = 8'h0;
reg  [15:0] file_1st_cluster = 16'h0;
reg  [31:0] file_1st_size = 0;

initial for(i=0;i<52;i=i+1) begin file_name[i]=8'h0; fname[i]=8'h0; end

always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
        fready<=1'b0;  fnamelen<=8'h0; file_namelen<=8'h0;
        fcluster<=16'h0;  fsize<=0;
        for(i=0;i<52;i=i+1) begin file_name[i]<=8'h0; fname[i]<=8'h0; end
        
        {isshort, islongok, islong, longvalid} = 4'b0000;
        longno     = 6'h0;
        lastchar  <= 8'h0;
        fdtnamelen = 8'h0;  sdtnamelen=8'h0;
        file_1st_cluster=16'h0; file_1st_size=0;
    end else begin
        fready<=1'b0;  fnamelen<=8'h0;
        for(i=0;i<52;i=i+1) fname[i]<=8'h0;
        fcluster<=16'h0;  fsize<=0;
        
        if( rvalid && (filesystem_state==LS_ROOT_FAT16||filesystem_state==LS_ROOT_FAT32) && ~search_fat ) begin
            case(raddr[4:0])
            5'h1A : file_1st_cluster[ 0+:8] = rdata;
            5'h1B : file_1st_cluster[ 8+:8] = rdata;
            5'h1C :    file_1st_size[ 0+:8] = rdata;
            5'h1D :    file_1st_size[ 8+:8] = rdata;
            5'h1E :    file_1st_size[16+:8] = rdata;
            5'h1F :    file_1st_size[24+:8] = rdata;
            endcase
            
            if(raddr[4:0]==5'h0) begin
                {islongok, isshort} = 2'b00;
                fdtnamelen = 8'h0;  sdtnamelen=8'h0;
                
                if(rdata!=8'hE5 && rdata!=8'h2E && rdata!=8'h00) begin
                    if(islong && longno==6'h1)
                        islongok = 1'b1;
                    else
                        isshort = 1'b1;
                end
                
                if(rdata[7]==1'b0 && ~islongok) begin
                    if(rdata[6]) begin
                        {islong,longvalid} = 2'b11;
                        longno = rdata[5:0];
                    end else if(islong) begin
                        if(longno>6'h1 && (rdata[5:0]+6'h1==longno) ) begin
                            islong = 1'b1;
                            longno = rdata[5:0];
                        end else begin
                            islong = 1'b0;
                        end
                    end else
                        islong = 1'b0;
                end else
                    islong = 1'b0;
            end else if(raddr[4:0]==5'hB) begin
                if(rdata!=8'h0F)
                    islong = 1'b0;
                if(rdata!=8'h20)
                    {isshort, islongok} = 2'b00;
            end else if(raddr[4:0]==5'h1F) begin
                if(islongok && longvalid || isshort) begin
                    fready <= 1'b1;
                    fnamelen <= file_namelen;
                    for(i=0;i<52;i=i+1) fname[i] <= (i<file_namelen) ? file_name[i] : 8'h0;
                    fcluster <= file_1st_cluster;
                    fsize <= file_1st_size;
                end
            end
            
            if(islong) begin
                if(raddr[4:0]>5'h0&&raddr[4:0]<5'hB || raddr[4:0]>=5'hE&&raddr[4:0]<5'h1A || raddr[4:0]>=5'h1C)begin
                    if(raddr[4:0]<5'hB ? raddr[0] : ~raddr[0]) begin
                        lastchar <= rdata;
                        fdtnamelen = fdtnamelen + 8'd1;
                    end else begin
                        //automatic logic [15:0] unicode = {rdata,lastchar};
                        if({rdata,lastchar} == 16'h0000) begin
                            file_namelen <= fdtnamelen-8'd1 + (longno-8'd1)*8'd13;
                        end else if({rdata,lastchar} != 16'hFFFF) begin
                            if(rdata == 8'h0) begin
                                file_name[fdtnamelen-8'd1+(longno-8'd1)*8'd13] <= (lastchar>=8'h61 && lastchar<=8'h7A) ? lastchar&8'b11011111 : lastchar; 
                            end else begin
                                longvalid = 1'b0;
                            end
                        end
                    end
                end
            end 
            
            if(isshort) begin
                if(raddr[4:0]<5'h8) begin
                    if(rdata!=8'h20) begin
                        file_name[sdtnamelen] <= rdata;
                        sdtnamelen = sdtnamelen + 8'd1;
                    end
                end else if(raddr[4:0]<5'hB) begin
                    if(raddr[4:0]==5'h8) begin
                        file_name[sdtnamelen] <= 8'h2E;
                        sdtnamelen = sdtnamelen + 8'd1;
                    end
                    if(rdata!=8'h20) begin
                        file_name[sdtnamelen] <= rdata;
                        sdtnamelen = sdtnamelen + 8'd1;
                    end
                end else if(raddr[4:0]==5'hB) begin
                    file_namelen <= sdtnamelen;
                end
            end
            
        end
    end
end



//----------------------------------------------------------------------------------------------------------------------
// compare Target filename with Parsed filename
//----------------------------------------------------------------------------------------------------------------------
always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        file_found <= 1'b0;
        file_cluster <= 0;
        file_size <= 0;
    end else begin
        if(fready && fnamelen==FILE_NAME_LEN) begin
            file_found <= 1'b1;
            file_cluster <= fcluster;
            file_size <= fsize;
            for(ii=0; ii<FILE_NAME_LEN; ii=ii+1) begin
                if( fname[FILE_NAME_LEN-1-ii] != FILE_NAME_UPPER[ii*8+:8] ) begin
                    file_found <= 1'b0;
                    file_cluster <= 0;
                    file_size <= 0;
                end
            end
        end
    end



//----------------------------------------------------------------------------------------------------------------------
// output file content
//----------------------------------------------------------------------------------------------------------------------
reg [31:0] fptr = 0;

always @ (posedge clk or negedge rstn)
    if(~rstn) begin
        fptr <= 0;
        {outen,outbyte} <= 0;
    end else begin
        if(rvalid && filesystem_state==READ_A_FILE && ~search_fat && fptr<file_size) begin
            fptr <= fptr + 1;
            {outen,outbyte} <= {1'b1,rdata};
        end else
            {outen,outbyte} <= 0;
    end


endmodule
