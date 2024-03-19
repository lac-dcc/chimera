`define VGG_WEIGHT_SOURCE "vgg19_weight.txt"
`define VGG_BIAS_SOURCE   "vgg19_bias.txt"
`define OUTPUT_SOURCE     "vgg19_output_1000.txt"
`define IMG_OFFSET        16384
module CNN_PCPI(
  input             clk, resetn,
  input             pcpi_valid,
  input      [31:0] pcpi_insn,
  input      [31:0] pcpi_rs1,
  input      [31:0] pcpi_rs2,
  output            pcpi_wr,
  output     [31:0] pcpi_rd,
  output            pcpi_wait,
  output            pcpi_ready,
  //memory interface
  input      [31:0] mem_rdata,
  input             mem_ready,
  output            mem_valid,
  output            mem_write,
  output     [31:0] mem_addr,
  output     [31:0] mem_wdata
);

  // vgg19 required image pixel offset
  real mean_pixel [0:2];

  // weights signals
  real conv1_1_w [0:2] [0:2] [0:2]    [0:63];
  real conv1_2_w [0:2] [0:2] [0:63]   [0:63];
  real conv2_1_w [0:2] [0:2] [0:63]   [0:127];
  real conv2_2_w [0:2] [0:2] [0:127]  [0:127];
  real conv3_1_w [0:2] [0:2] [0:127]  [0:255];
  real conv3_2_w [0:2] [0:2] [0:255]  [0:255];
  real conv3_3_w [0:2] [0:2] [0:255]  [0:255];
  real conv3_4_w [0:2] [0:2] [0:255]  [0:255];
  real conv4_1_w [0:2] [0:2] [0:255]  [0:511];
  real conv4_2_w [0:2] [0:2] [0:511]  [0:511];
  real conv4_3_w [0:2] [0:2] [0:511]  [0:511];
  real conv4_4_w [0:2] [0:2] [0:511]  [0:511];
  real conv5_1_w [0:2] [0:2] [0:511]  [0:511];
  real conv5_2_w [0:2] [0:2] [0:511]  [0:511];
  real conv5_3_w [0:2] [0:2] [0:511]  [0:511];
  real conv5_4_w [0:2] [0:2] [0:511]  [0:511];
  real fc_1_w    [0:6] [0:6] [0:511]  [0:4095];
  real fc_2_w    [0:0] [0:0] [0:4095] [0:4095];
  real fc_3_w    [0:0] [0:0] [0:4095] [0:999];

  // bias signals
  real conv1_1_b [0:63];
  real conv1_2_b [0:63];
  real conv2_1_b [0:127];
  real conv2_2_b [0:127];
  real conv3_1_b [0:255];
  real conv3_2_b [0:255];
  real conv3_3_b [0:255];
  real conv3_4_b [0:255];
  real conv4_1_b [0:511];
  real conv4_2_b [0:511];
  real conv4_3_b [0:511];
  real conv4_4_b [0:511];
  real conv5_1_b [0:511];
  real conv5_2_b [0:511];
  real conv5_3_b [0:511];
  real conv5_4_b [0:511];
  real fc_1_b    [0:4095];
  real fc_2_b    [0:4095];
  real fc_3_b    [0:999];

  // signals in initial block
  integer i, j, k, l;
  integer vgg19_weight, vgg19_bias, vgg19_out, read;

  // read weights & bias from .txt
  initial begin
    // bgr
    mean_pixel[0] = 103.939;
    mean_pixel[1] = 116.779;
    mean_pixel[2] = 123.68;
    vgg19_weight = $fopen(`VGG_WEIGHT_SOURCE, "r");
    vgg19_bias   = $fopen(`VGG_BIAS_SOURCE, "r");
    vgg19_out    = $fopen(`OUTPUT_SOURCE, "w");
    for (i = 0; i < 64; i = i + 1) begin
      for (j = 0; j < 3; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv1_1_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv1_1_b[i]);
    end
    for (i = 0; i < 64; i = i + 1) begin
      for (j = 0; j < 64; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv1_2_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv1_2_b[i]);
    end
    for (i = 0; i < 128; i = i + 1) begin
      for (j = 0; j < 64; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv2_1_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv2_1_b[i]);
    end
    for (i = 0; i < 128; i = i + 1) begin
      for (j = 0; j < 128; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv2_2_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv2_2_b[i]);
    end
    for (i = 0; i < 256; i = i + 1) begin
      for (j = 0; j < 128; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv3_1_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv3_1_b[i]);
    end
    for (i = 0; i < 256; i = i + 1) begin
      for (j = 0; j < 256; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv3_2_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv3_2_b[i]);
    end
    for (i = 0; i < 256; i = i + 1) begin
      for (j = 0; j < 256; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv3_3_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv3_3_b[i]);
    end
    for (i = 0; i < 256; i = i + 1) begin
      for (j = 0; j < 256; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv3_4_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv3_4_b[i]);
    end
    for (i = 0; i < 512; i = i + 1) begin
      for (j = 0; j < 256; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv4_1_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv4_1_b[i]);
    end
    for (i = 0; i < 512; i = i + 1) begin
      for (j = 0; j < 512; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv4_2_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv4_2_b[i]);
    end
    for (i = 0; i < 512; i = i + 1) begin
      for (j = 0; j < 512; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv4_3_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv4_3_b[i]);
    end
    for (i = 0; i < 512; i = i + 1) begin
      for (j = 0; j < 512; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv4_4_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv4_4_b[i]);
    end
    for (i = 0; i < 512; i = i + 1) begin
      for (j = 0; j < 512; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv5_1_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv5_1_b[i]);
    end
    for (i = 0; i < 512; i = i + 1) begin
      for (j = 0; j < 512; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv5_2_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv5_2_b[i]);
    end
    for (i = 0; i < 512; i = i + 1) begin
      for (j = 0; j < 512; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv5_3_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv5_3_b[i]);
    end
    for (i = 0; i < 512; i = i + 1) begin
      for (j = 0; j < 512; j = j + 1) begin
        for (k = 0; k < 3; k = k + 1) begin
          for (l = 0; l < 3; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", conv5_4_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", conv5_4_b[i]);
    end
    for (i = 0; i < 4096; i = i + 1) begin
      for (j = 0; j < 512; j = j + 1) begin
        for (k = 0; k < 7; k = k + 1) begin
          for (l = 0; l < 7; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", fc_1_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", fc_1_b[i]);
    end
    for (i = 0; i < 4096; i = i + 1) begin
      for (j = 0; j < 4096; j = j + 1) begin
        for (k = 0; k < 1; k = k + 1) begin
          for (l = 0; l < 1; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", fc_2_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", fc_2_b[i]);
    end
    for (i = 0; i < 1000; i = i + 1) begin
      for (j = 0; j < 4096; j = j + 1) begin
        for (k = 0; k < 1; k = k + 1) begin
          for (l = 0; l < 1; l = l + 1) begin
            read = $fscanf(vgg19_weight, "%f", fc_3_w[k][l][j][i]);
          end
        end
      end
      read = $fscanf(vgg19_bias, "%f", fc_3_b[i]);
    end
    $fclose(vgg19_weight);
    $fclose(vgg19_bias);
  end

  // pcpi control signal
  wire pcpi_insn_valid = pcpi_valid && pcpi_insn[6:0] == 7'b0101011 && pcpi_insn[31:25] == 7'b0000001;

  // output memory write signals
  assign mem_write = 1'b0;
  assign mem_wdata = 32'd0;

  // output signals 
  reg pcpi_wr;
  reg [31:0] pcpi_rd;
  reg pcpi_wait;
  reg pcpi_ready;
  reg mem_valid;
  reg [31:0] mem_addr;

  // parameters
  parameter [5:0] IDLE      = 6'b00_0000;
  parameter [5:0] READ      = 6'b00_0001;
  parameter [5:0] READ_WAIT = 6'b00_0010;

  parameter [5:0] CONV1_1   = 6'b00_0011;
  parameter [5:0] RELU1_1   = 6'b00_0100;
  parameter [5:0] CONV1_2   = 6'b00_0101;
  parameter [5:0] RELU1_2   = 6'b00_0110;
  parameter [5:0] MAXPOOL1  = 6'b00_0111;

  parameter [5:0] CONV2_1   = 6'b00_1000;
  parameter [5:0] RELU2_1   = 6'b00_1001;
  parameter [5:0] CONV2_2   = 6'b00_1010;
  parameter [5:0] RELU2_2   = 6'b00_1011;
  parameter [5:0] MAXPOOL2  = 6'b00_1100;

  parameter [5:0] CONV3_1   = 6'b00_1101;
  parameter [5:0] RELU3_1   = 6'b00_1110;
  parameter [5:0] CONV3_2   = 6'b00_1111;
  parameter [5:0] RELU3_2   = 6'b01_0000;
  parameter [5:0] CONV3_3   = 6'b01_0001;
  parameter [5:0] RELU3_3   = 6'b01_0010;
  parameter [5:0] CONV3_4   = 6'b01_0011;
  parameter [5:0] RELU3_4   = 6'b01_0100;
  parameter [5:0] MAXPOOL3  = 6'b01_0101;

  parameter [5:0] CONV4_1   = 6'b01_0110;
  parameter [5:0] RELU4_1   = 6'b01_0111;
  parameter [5:0] CONV4_2   = 6'b01_1000;
  parameter [5:0] RELU4_2   = 6'b01_1001;
  parameter [5:0] CONV4_3   = 6'b01_1010;
  parameter [5:0] RELU4_3   = 6'b01_1011;
  parameter [5:0] CONV4_4   = 6'b01_1100;
  parameter [5:0] RELU4_4   = 6'b01_1101;
  parameter [5:0] MAXPOOL4  = 6'b01_1110;

  parameter [5:0] CONV5_1   = 6'b01_1111;
  parameter [5:0] RELU5_1   = 6'b10_0000;
  parameter [5:0] CONV5_2   = 6'b10_0001;
  parameter [5:0] RELU5_2   = 6'b10_0010;
  parameter [5:0] CONV5_3   = 6'b10_0011;
  parameter [5:0] RELU5_3   = 6'b10_0100;
  parameter [5:0] CONV5_4   = 6'b10_0101;
  parameter [5:0] RELU5_4   = 6'b10_0110;
  parameter [5:0] MAXPOOL5  = 6'b10_0111;

  parameter [5:0] FC1       = 6'b10_1000;
  parameter [5:0] RELU_FC1  = 6'b10_1001;
  parameter [5:0] FC2       = 6'b10_1010;
  parameter [5:0] RELU_FC2  = 6'b10_1011;
  parameter [5:0] FC3       = 6'b10_1100;
  parameter [5:0] SOFTMAX   = 6'b10_1101;

  parameter [5:0] DONE      = 6'b10_1110;

  // image array with 0 padding before each convolutional
  real image    [0:223 + 2] [0:223 + 2] [0:2];
  real conv1_1  [0:223 + 2] [0:223 + 2] [0:63];
  real conv1_2  [0:223 + 2] [0:223 + 2] [0:63];
  real maxpool1 [0:111 + 2] [0:111 + 2] [0:63];
  real conv2_1  [0:111 + 2] [0:111 + 2] [0:127];
  real conv2_2  [0:111 + 2] [0:111 + 2] [0:127];
  real maxpool2 [0:55 + 2]  [0:55 + 2]  [0:127];
  real conv3_1  [0:55 + 2]  [0:55 + 2]  [0:255];
  real conv3_2  [0:55 + 2]  [0:55 + 2]  [0:255];
  real conv3_3  [0:55 + 2]  [0:55 + 2]  [0:255];
  real conv3_4  [0:55 + 2]  [0:55 + 2]  [0:255];
  real maxpool3 [0:27 + 2]  [0:27 + 2]  [0:255];
  real conv4_1  [0:27 + 2]  [0:27 + 2]  [0:511];
  real conv4_2  [0:27 + 2]  [0:27 + 2]  [0:511];
  real conv4_3  [0:27 + 2]  [0:27 + 2]  [0:511];
  real conv4_4  [0:27 + 2]  [0:27 + 2]  [0:511];
  real maxpool4 [0:13 + 2]  [0:13 + 2]  [0:511]; 
  real conv5_1  [0:13 + 2]  [0:13 + 2]  [0:511];
  real conv5_2  [0:13 + 2]  [0:13 + 2]  [0:511];
  real conv5_3  [0:13 + 2]  [0:13 + 2]  [0:511];
  real conv5_4  [0:13 + 2]  [0:13 + 2]  [0:511];
  real maxpool5 [0:6 + 2]   [0:6 + 2]   [0:511];
  real fc1      [0:0]       [0:0]       [0:4095];
  real fc2      [0:0]       [0:0]       [0:4095];
  real fc3      [0:0]       [0:0]       [0:999]; 

  initial begin
    for (i = 0; i < 3; i = i + 1)
      for (j = 0; j < 226; j = j + 1)
        for (k = 0; k < 226; k = k + 1)
          image[k][j][i] = 0;
    for (i = 0; i < 64; i = i + 1)
      for (j = 0; j < 226; j = j + 1)
        for (k = 0; k < 226; k = k + 1)
          conv1_1[k][j][i] = 0;
    for (i = 0; i < 64; i = i + 1)
      for (j = 0; j < 226; j = j + 1)
        for (k = 0; k < 226; k = k + 1)
          conv1_2[k][j][i] = 0;
    for (i = 0; i < 64; i = i + 1)
      for (j = 0; j < 114; j = j + 1)
        for (k = 0; k < 114; k = k + 1)
          maxpool1[k][j][i] = 0;
    for (i = 0; i < 128; i = i + 1)
      for (j = 0; j < 114; j = j + 1)
        for (k = 0; k < 114; k = k + 1)
          conv2_1[k][j][i] = 0;
    for (i = 0; i < 128; i = i + 1)
      for (j = 0; j < 114; j = j + 1)
        for (k = 0; k < 114; k = k + 1)
          conv2_2[k][j][i] = 0;
    for (i = 0; i < 128; i = i + 1)
      for (j = 0; j < 58; j = j + 1)
        for (k = 0; k < 58; k = k + 1)
          maxpool2[k][j][i] = 0;
    for (i = 0; i < 256; i = i + 1)
      for (j = 0; j < 58; j = j + 1)
        for (k = 0; k < 58; k = k + 1)
          conv3_1[k][j][i] = 0;
    for (i = 0; i < 256; i = i + 1)
      for (j = 0; j < 58; j = j + 1)
        for (k = 0; k < 58; k = k + 1)
          conv3_2[k][j][i] = 0;
    for (i = 0; i < 256; i = i + 1)
      for (j = 0; j < 58; j = j + 1)
        for (k = 0; k < 58; k = k + 1)
          conv3_3[k][j][i] = 0;
    for (i = 0; i < 256; i = i + 1)
      for (j = 0; j < 58; j = j + 1)
        for (k = 0; k < 58; k = k + 1)
          conv3_4[k][j][i] = 0;
    for (i = 0; i < 256; i = i + 1)
      for (j = 0; j < 30; j = j + 1)
        for (k = 0; k < 30; k = k + 1)
          maxpool3[k][j][i] = 0;
    for (i = 0; i < 512; i = i + 1)
      for (j = 0; j < 30; j = j + 1)
        for (k = 0; k < 30; k = k + 1)
          conv4_1[k][j][i] = 0;
    for (i = 0; i < 512; i = i + 1)
      for (j = 0; j < 30; j = j + 1)
        for (k = 0; k < 30; k = k + 1)
          conv4_2[k][j][i] = 0;
    for (i = 0; i < 512; i = i + 1)
      for (j = 0; j < 30; j = j + 1)
        for (k = 0; k < 30; k = k + 1)
          conv4_3[k][j][i] = 0;
    for (i = 0; i < 512; i = i + 1)
      for (j = 0; j < 30; j = j + 1)
        for (k = 0; k < 30; k = k + 1)
          conv4_4[k][j][i] = 0;
    for (i = 0; i < 512; i = i + 1)
      for (j = 0; j < 16; j = j + 1)
        for (k = 0; k < 16; k = k + 1)
          maxpool4[k][j][i] = 0;
    for (i = 0; i < 512; i = i + 1)
      for (j = 0; j < 16; j = j + 1)
        for (k = 0; k < 16; k = k + 1)
          conv5_1[k][j][i] = 0;
    for (i = 0; i < 512; i = i + 1)
      for (j = 0; j < 16; j = j + 1)
        for (k = 0; k < 16; k = k + 1)
          conv5_2[k][j][i] = 0;
    for (i = 0; i < 512; i = i + 1)
      for (j = 0; j < 16; j = j + 1)
        for (k = 0; k < 16; k = k + 1)
          conv5_3[k][j][i] = 0;
    for (i = 0; i < 512; i = i + 1)
      for (j = 0; j < 16; j = j + 1)
        for (k = 0; k < 16; k = k + 1)
          conv5_4[k][j][i] = 0;
    for (i = 0; i < 512; i = i + 1)
      for (j = 0; j < 9; j = j + 1)
        for (k = 0; k < 9; k = k + 1)
          maxpool5[k][j][i] = 0;
    for (i = 0; i < 4096; i = i + 1)
      for (j = 0; j < 1; j = j + 1)
        for (k = 0; k < 1; k = k + 1)
          fc1[k][j][i] = 0;
    for (i = 0; i < 4096; i = i + 1)
      for (j = 0; j < 1; j = j + 1)
        for (k = 0; k < 1; k = k + 1)
          fc2[k][j][i] = 0;
    for (i = 0; i < 1000; i = i + 1)
      for (j = 0; j < 1; j = j + 1)
        for (k = 0; k < 1; k = k + 1)
          fc3[k][j][i] = 0;
  end

  // internal signals
  reg [5:0]  state,    state_next;
  reg [31:0] rs1,      rs2;
  reg [31:0] count,    count_next;
  reg [11:0] count_i,  count_i_next;
  reg [11:0] count_j,  count_j_next;
  reg [2:0]  count_k,  count_k_next;
  reg [2:0]  count_l,  count_l_next;
  real       conv_sum, conv_sum_next;
  real       max; // for max-pooling

  always @(posedge clk or negedge resetn) begin
    if (!resetn) begin
      state    = IDLE;
      count    = 32'd0;
      count_i  = 12'd0;
      count_j  = 12'd0;
      count_k  = 3'd0;
      count_l  = 3'd0;
      conv_sum = 0;
      max      = 0;
    end
    else begin
      state    = state_next;
      count    = count_next;
      count_i  = count_i_next;
      count_j  = count_j_next;
      count_k  = count_k_next;
      count_l  = count_l_next;
      conv_sum = conv_sum_next;
    end
  end

  always @* begin
        pcpi_wr = 1'b0;
        pcpi_rd = 32'd0;
        pcpi_wait = 1'b1;
        pcpi_ready = 1'b0;
        mem_valid = 1'b0;
        mem_addr = 32'd0;
        state_next = state;
        count_next = count;
        count_i_next = count_i;
        count_j_next = count_j;
        count_k_next = count_k;
        count_l_next = count_l;
        conv_sum_next = conv_sum;
        case (state)
          IDLE: begin
            if (pcpi_insn_valid) begin
              state_next = READ;
              rs1 = pcpi_rs1;
              rs2 = pcpi_rs2;
            end
            else
              pcpi_wait = 1'b0;
          end
          READ: begin
              state_next = READ_WAIT;
              mem_valid = 1'b1;
              mem_addr = (`IMG_OFFSET + count) << 2;
          end
          READ_WAIT: begin
              if (mem_ready) begin
                  if (count < 50176) begin
                    image[count / 224 + 1][count % 224 + 1][0] = mem_rdata - mean_pixel[2];
                  end
                  else if (count < 100352) begin
                    image[(count - 50176) / 224 + 1][(count - 50176) % 224 + 1][1] = mem_rdata - mean_pixel[1];
                  end
                  else begin
                    image[(count - 100352) / 224 + 1][(count - 100352) % 224 + 1][2] = mem_rdata - mean_pixel[0];
                  end
                  if (count == 150527) begin
                      state_next = CONV1_1;
                      count_next = 32'd0;
                  end
                  else begin
                      state_next = READ;
                      count_next = count + 1'b1;
                  end
              end
              else begin
                  mem_valid = 1'b1;
                  mem_addr = (`IMG_OFFSET + count) << 2;
              end
          end
          CONV1_1: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
                 + image[count / 224][count % 224][count_j] * conv1_1_w[0][0][count_j][count_i]
                 + image[count / 224][count % 224 + 1][count_j] * conv1_1_w[0][1][count_j][count_i]
                 + image[count / 224][count % 224 + 2][count_j] * conv1_1_w[0][2][count_j][count_i]
                 + image[count / 224 + 1][count % 224][count_j] * conv1_1_w[1][0][count_j][count_i]
                 + image[count / 224 + 1][count % 224 + 1][count_j] * conv1_1_w[1][1][count_j][count_i]
                 + image[count / 224 + 1][count % 224 + 2][count_j] * conv1_1_w[1][2][count_j][count_i]
                 + image[count / 224 + 2][count % 224][count_j] * conv1_1_w[2][0][count_j][count_i]
                 + image[count / 224 + 2][count % 224 + 1][count_j] * conv1_1_w[2][1][count_j][count_i]
                 + image[count / 224 + 2][count % 224 + 2][count_j] * conv1_1_w[2][2][count_j][count_i];
            if (count_j == 2) begin
              conv1_1[count / 224 + 1][count % 224 + 1][count_i] = conv_sum_next + conv1_1_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 50175) begin
                count_next = 32'd0;
                if (count_i == 63) begin
                  state_next = RELU1_1;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU1_1: begin
            if (conv1_1[count / 224 + 1][count % 224 + 1][count_i] < 0)
              conv1_1[count / 224 + 1][count % 224 + 1][count_i] = 0;
            if (count == 50175) begin
              count_next = 32'd0;
              if (count_i == 63) begin
                state_next = CONV1_2;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          CONV1_2: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + conv1_1[count / 224][count % 224][count_j] * conv1_2_w[0][0][count_j][count_i]
               + conv1_1[count / 224][count % 224 + 1][count_j] * conv1_2_w[0][1][count_j][count_i]
               + conv1_1[count / 224][count % 224 + 2][count_j] * conv1_2_w[0][2][count_j][count_i]
               + conv1_1[count / 224 + 1][count % 224][count_j] * conv1_2_w[1][0][count_j][count_i]
               + conv1_1[count / 224 + 1][count % 224 + 1][count_j] * conv1_2_w[1][1][count_j][count_i]
               + conv1_1[count / 224 + 1][count % 224 + 2][count_j] * conv1_2_w[1][2][count_j][count_i]
               + conv1_1[count / 224 + 2][count % 224][count_j] * conv1_2_w[2][0][count_j][count_i]
               + conv1_1[count / 224 + 2][count % 224 + 1][count_j] * conv1_2_w[2][1][count_j][count_i]
               + conv1_1[count / 224 + 2][count % 224 + 2][count_j] * conv1_2_w[2][2][count_j][count_i];
            if (count_j == 63) begin
              conv1_2[count / 224 + 1][count % 224 + 1][count_i] = conv_sum_next + conv1_2_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 50175) begin
                count_next = 32'd0;
                if (count_i == 63) begin
                  state_next = RELU1_2;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU1_2: begin
            if (conv1_2[count / 224 + 1][count % 224 + 1][count_i] < 0)
              conv1_2[count / 224 + 1][count % 224 + 1][count_i] = 0;
            if (count == 50175) begin
              count_next = 32'd0;
              if (count_i == 63) begin
                state_next = MAXPOOL1;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          MAXPOOL1: begin
            max = -1.0;
            if (conv1_2[count / 224 + 1][count % 224 + 1][count_i] > max)
              max = conv1_2[count / 224 + 1][count % 224 + 1][count_i];
            if (conv1_2[count / 224 + 1][count % 224 + 1 + 1][count_i] > max)
              max = conv1_2[count / 224 + 1][count % 224 + 1 + 1][count_i];
            if (conv1_2[count / 224 + 1 + 1][count % 224 + 1][count_i] > max > max)
              max = conv1_2[count / 224 + 1 + 1][count % 224 + 1][count_i];
            if (conv1_2[count / 224 + 1 + 1][count % 224 + 1 + 1][count_i] > max)
              max = conv1_2[count / 224 + 1 + 1][count % 224 + 1 + 1][count_i];
            if (max < 0) $display("Wrong maxpool");
            maxpool1[(count / 224 + 1 + 1) / 2][(count % 224 + 1 + 1) / 2][count_i] = max;
            if (count == 49950) begin
              count_next = 32'd0;
              if (count_i == 63) begin
                state_next = CONV2_1;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
            end
            else begin
              if (count % 224 == 222)
                count_next = count + 2 + 224;
              else
                count_next = count + 2;
            end
          end
          CONV2_1: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
              + maxpool1[count / 112][count % 112][count_j] * conv2_1_w[0][0][count_j][count_i]
              + maxpool1[count / 112][count % 112 + 1][count_j] * conv2_1_w[0][1][count_j][count_i]
              + maxpool1[count / 112][count % 112 + 2][count_j] * conv2_1_w[0][2][count_j][count_i]
              + maxpool1[count / 112 + 1][count % 112][count_j] * conv2_1_w[1][0][count_j][count_i]
              + maxpool1[count / 112 + 1][count % 112 + 1][count_j] * conv2_1_w[1][1][count_j][count_i]
              + maxpool1[count / 112 + 1][count % 112 + 2][count_j] * conv2_1_w[1][2][count_j][count_i]
              + maxpool1[count / 112 + 2][count % 112][count_j] * conv2_1_w[2][0][count_j][count_i]
              + maxpool1[count / 112 + 2][count % 112 + 1][count_j] * conv2_1_w[2][1][count_j][count_i]
              + maxpool1[count / 112 + 2][count % 112 + 2][count_j] * conv2_1_w[2][2][count_j][count_i];
            if (count_j == 63) begin
              conv2_1[count / 112 + 1][count % 112 + 1][count_i] = conv_sum_next + conv2_1_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 12543) begin
                count_next = 32'd0;
                if (count_i == 127) begin
                  state_next = RELU2_1;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU2_1: begin
            if (conv2_1[count / 112 + 1][count % 112 + 1][count_i] < 0)
              conv2_1[count / 112 + 1][count % 112 + 1][count_i] = 0;
            if (count == 12543) begin
              count_next = 32'd0;
              if (count_i == 127) begin
                state_next = CONV2_2;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          CONV2_2: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + conv2_1[count / 112][count % 112][count_j] * conv2_2_w[0][0][count_j][count_i]
               + conv2_1[count / 112][count % 112 + 1][count_j] * conv2_2_w[0][1][count_j][count_i]
               + conv2_1[count / 112][count % 112 + 2][count_j] * conv2_2_w[0][2][count_j][count_i]
               + conv2_1[count / 112 + 1][count % 112][count_j] * conv2_2_w[1][0][count_j][count_i]
               + conv2_1[count / 112 + 1][count % 112 + 1][count_j] * conv2_2_w[1][1][count_j][count_i]
               + conv2_1[count / 112 + 1][count % 112 + 2][count_j] * conv2_2_w[1][2][count_j][count_i]
               + conv2_1[count / 112 + 2][count % 112][count_j] * conv2_2_w[2][0][count_j][count_i]
               + conv2_1[count / 112 + 2][count % 112 + 1][count_j] * conv2_2_w[2][1][count_j][count_i]
               + conv2_1[count / 112 + 2][count % 112 + 2][count_j] * conv2_2_w[2][2][count_j][count_i];
            if (count_j == 127) begin
              conv2_2[count / 112 + 1][count % 112 + 1][count_i] = conv_sum_next + conv2_2_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 12543) begin
                count_next = 32'd0;
                if (count_i == 127) begin
                  state_next = RELU2_2;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU2_2: begin
            if (conv2_2[count / 112 + 1][count % 112 + 1][count_i] < 0)
              conv2_2[count / 112 + 1][count % 112 + 1][count_i] = 0;
            if (count == 12543) begin
              count_next = 32'd0;
              if (count_i == 127) begin
                state_next = MAXPOOL2;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          MAXPOOL2: begin
            max = -1.0;
            if (conv2_2[count / 112 + 1][count % 112 + 1][count_i] > max)
              max = conv2_2[count / 112 + 1][count % 112 + 1][count_i];
            if (conv2_2[count / 112 + 1][count % 112 + 1 + 1][count_i] > max)
              max = conv2_2[count / 112 + 1][count % 112 + 1 + 1][count_i];
            if (conv2_2[count / 112 + 1 + 1][count % 112 + 1][count_i] > max > max)
              max = conv2_2[count / 112 + 1 + 1][count % 112 + 1][count_i];
            if (conv2_2[count / 112 + 1 + 1][count % 112 + 1 + 1][count_i] > max)
              max = conv2_2[count / 112 + 1 + 1][count % 112 + 1 + 1][count_i];
            if (max < 0) $display("Wrong maxpool");
            maxpool2[(count / 112 + 1 + 1) / 2][(count % 112 + 1 + 1) / 2][count_i] = max;
            if (count == 12430) begin
              count_next = 32'd0;
              if (count_i == 127) begin
                state_next = CONV3_1;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
            end
            else begin
              if (count % 112 == 110)
                count_next = count + 2 + 112;
              else
                count_next = count + 2;
            end
          end
          CONV3_1: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + maxpool2[count / 56][count % 56][count_j] * conv3_1_w[0][0][count_j][count_i]
               + maxpool2[count / 56][count % 56 + 1][count_j] * conv3_1_w[0][1][count_j][count_i]
               + maxpool2[count / 56][count % 56 + 2][count_j] * conv3_1_w[0][2][count_j][count_i]
               + maxpool2[count / 56 + 1][count % 56][count_j] * conv3_1_w[1][0][count_j][count_i]
               + maxpool2[count / 56 + 1][count % 56 + 1][count_j] * conv3_1_w[1][1][count_j][count_i]
               + maxpool2[count / 56 + 1][count % 56 + 2][count_j] * conv3_1_w[1][2][count_j][count_i]
               + maxpool2[count / 56 + 2][count % 56][count_j] * conv3_1_w[2][0][count_j][count_i]
               + maxpool2[count / 56 + 2][count % 56 + 1][count_j] * conv3_1_w[2][1][count_j][count_i]
               + maxpool2[count / 56 + 2][count % 56 + 2][count_j] * conv3_1_w[2][2][count_j][count_i];
            if (count_j == 127) begin
              conv3_1[count / 56 + 1][count % 56 + 1][count_i] = conv_sum_next + conv3_1_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 3135) begin
                count_next = 32'd0;
                if (count_i == 255) begin
                  state_next = RELU3_1;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU3_1: begin
            if (conv3_1[count / 56 + 1][count % 56 + 1][count_i] < 0)
              conv3_1[count / 56 + 1][count % 56 + 1][count_i] = 0;
            if (count == 3135) begin
              count_next = 32'd0;
              if (count_i == 255) begin
                state_next = CONV3_2;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          CONV3_2: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + conv3_1[count / 56][count % 56][count_j] * conv3_2_w[0][0][count_j][count_i]
               + conv3_1[count / 56][count % 56 + 1][count_j] * conv3_2_w[0][1][count_j][count_i]
               + conv3_1[count / 56][count % 56 + 2][count_j] * conv3_2_w[0][2][count_j][count_i]
               + conv3_1[count / 56 + 1][count % 56][count_j] * conv3_2_w[1][0][count_j][count_i]
               + conv3_1[count / 56 + 1][count % 56 + 1][count_j] * conv3_2_w[1][1][count_j][count_i]
               + conv3_1[count / 56 + 1][count % 56 + 2][count_j] * conv3_2_w[1][2][count_j][count_i]
               + conv3_1[count / 56 + 2][count % 56][count_j] * conv3_2_w[2][0][count_j][count_i]
               + conv3_1[count / 56 + 2][count % 56 + 1][count_j] * conv3_2_w[2][1][count_j][count_i]
               + conv3_1[count / 56 + 2][count % 56 + 2][count_j] * conv3_2_w[2][2][count_j][count_i];
            if (count_j == 255) begin
              conv3_2[count / 56 + 1][count % 56 + 1][count_i] = conv_sum_next + conv3_2_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 3135) begin
                count_next = 32'd0;
                if (count_i == 255) begin
                  state_next = RELU3_2;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU3_2: begin
            if (conv3_2[count / 56 + 1][count % 56 + 1][count_i] < 0)
              conv3_2[count / 56 + 1][count % 56 + 1][count_i] = 0;
            if (count == 3135) begin
              count_next = 32'd0;
              if (count_i == 255) begin
                state_next = CONV3_3;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          CONV3_3: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + conv3_2[count / 56][count % 56][count_j] * conv3_3_w[0][0][count_j][count_i]
               + conv3_2[count / 56][count % 56 + 1][count_j] * conv3_3_w[0][1][count_j][count_i]
               + conv3_2[count / 56][count % 56 + 2][count_j] * conv3_3_w[0][2][count_j][count_i]
               + conv3_2[count / 56 + 1][count % 56][count_j] * conv3_3_w[1][0][count_j][count_i]
               + conv3_2[count / 56 + 1][count % 56 + 1][count_j] * conv3_3_w[1][1][count_j][count_i]
               + conv3_2[count / 56 + 1][count % 56 + 2][count_j] * conv3_3_w[1][2][count_j][count_i]
               + conv3_2[count / 56 + 2][count % 56][count_j] * conv3_3_w[2][0][count_j][count_i]
               + conv3_2[count / 56 + 2][count % 56 + 1][count_j] * conv3_3_w[2][1][count_j][count_i]
               + conv3_2[count / 56 + 2][count % 56 + 2][count_j] * conv3_3_w[2][2][count_j][count_i];
            if (count_j == 255) begin
              conv3_3[count / 56 + 1][count % 56 + 1][count_i] = conv_sum_next + conv3_3_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 3135) begin
                count_next = 32'd0;
                if (count_i == 255) begin
                  state_next = RELU3_3;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU3_3: begin
            if (conv3_3[count / 56 + 1][count % 56 + 1][count_i] < 0)
              conv3_3[count / 56 + 1][count % 56 + 1][count_i] = 0;
            if (count == 3135) begin
              count_next = 32'd0;
              if (count_i == 255) begin
                state_next = CONV3_4;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          CONV3_4: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + conv3_3[count / 56][count % 56][count_j] * conv3_4_w[0][0][count_j][count_i]
               + conv3_3[count / 56][count % 56 + 1][count_j] * conv3_4_w[0][1][count_j][count_i]
               + conv3_3[count / 56][count % 56 + 2][count_j] * conv3_4_w[0][2][count_j][count_i]
               + conv3_3[count / 56 + 1][count % 56][count_j] * conv3_4_w[1][0][count_j][count_i]
               + conv3_3[count / 56 + 1][count % 56 + 1][count_j] * conv3_4_w[1][1][count_j][count_i]
               + conv3_3[count / 56 + 1][count % 56 + 2][count_j] * conv3_4_w[1][2][count_j][count_i]
               + conv3_3[count / 56 + 2][count % 56][count_j] * conv3_4_w[2][0][count_j][count_i]
               + conv3_3[count / 56 + 2][count % 56 + 1][count_j] * conv3_4_w[2][1][count_j][count_i]
               + conv3_3[count / 56 + 2][count % 56 + 2][count_j] * conv3_4_w[2][2][count_j][count_i];
            if (count_j== 255) begin
              conv3_4[count / 56 + 1][count % 56 + 1][count_i] = conv_sum_next + conv3_4_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 3135) begin
                count_next = 32'd0;
                if (count_i == 255) begin
                  state_next = RELU3_4;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU3_4: begin
            if (conv3_4[count / 56 + 1][count % 56 + 1][count_i] < 0)
              conv3_4[count / 56 + 1][count % 56 + 1][count_i] = 0;
            if (count == 3135) begin
              count_next = 32'd0;
              if (count_i == 255) begin
                state_next = MAXPOOL3;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          MAXPOOL3: begin
            max = -1.0;
            if (conv3_4[count / 56 + 1][count % 56 + 1][count_i] > max)
              max = conv3_4[count / 56 + 1][count % 56 + 1][count_i];
            if (conv3_4[count / 56 + 1][count % 56 + 1 + 1][count_i] > max)
              max = conv3_4[count / 56 + 1][count % 56 + 1 + 1][count_i];
            if (conv3_4[count / 56 + 1 + 1][count % 56 + 1][count_i] > max > max)
              max = conv3_4[count / 56 + 1 + 1][count % 56 + 1][count_i];
            if (conv3_4[count / 56 + 1 + 1][count % 56 + 1 + 1][count_i] > max)
              max = conv3_4[count / 56 + 1 + 1][count % 56 + 1 + 1][count_i];
            if (max < 0) $display("Wrong maxpool");
            maxpool3[(count / 56 + 1 + 1) / 2][(count % 56 + 1 + 1) / 2][count_i] = max;
            if (count == 3078) begin
              count_next = 32'd0;
              if (count_i == 255) begin
                state_next = CONV4_1;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
            end
            else begin
              if (count % 56 == 54)
                count_next = count + 2 + 56;
              else
                count_next = count + 2;
            end
          end
          CONV4_1: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + maxpool3[count / 28][count % 28][count_j] * conv4_1_w[0][0][count_j][count_i]
               + maxpool3[count / 28][count % 28 + 1][count_j] * conv4_1_w[0][1][count_j][count_i]
               + maxpool3[count / 28][count % 28 + 2][count_j] * conv4_1_w[0][2][count_j][count_i]
               + maxpool3[count / 28 + 1][count % 28][count_j] * conv4_1_w[1][0][count_j][count_i]
               + maxpool3[count / 28 + 1][count % 28 + 1][count_j] * conv4_1_w[1][1][count_j][count_i]
               + maxpool3[count / 28 + 1][count % 28 + 2][count_j] * conv4_1_w[1][2][count_j][count_i]
               + maxpool3[count / 28 + 2][count % 28][count_j] * conv4_1_w[2][0][count_j][count_i]
               + maxpool3[count / 28 + 2][count % 28 + 1][count_j] * conv4_1_w[2][1][count_j][count_i]
               + maxpool3[count / 28 + 2][count % 28 + 2][count_j] * conv4_1_w[2][2][count_j][count_i];
            if (count_j == 255) begin
              conv4_1[count / 28 + 1][count % 28 + 1][count_i] = conv_sum_next + conv4_1_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 783) begin
                count_next = 32'd0;
                if (count_i == 511) begin
                  state_next = RELU4_1;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU4_1: begin
            if (conv4_1[count / 28 + 1][count % 28 + 1][count_i] < 0)
              conv4_1[count / 28 + 1][count % 28 + 1][count_i] = 0;
            if (count == 783) begin
              count_next = 32'd0;
              if (count_i == 511) begin
                state_next = CONV4_2;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          CONV4_2: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + conv4_1[count / 28][count % 28][count_j] * conv4_2_w[0][0][count_j][count_i]
               + conv4_1[count / 28][count % 28 + 1][count_j] * conv4_2_w[0][1][count_j][count_i]
               + conv4_1[count / 28][count % 28 + 2][count_j] * conv4_2_w[0][2][count_j][count_i]
               + conv4_1[count / 28 + 1][count % 28][count_j] * conv4_2_w[1][0][count_j][count_i]
               + conv4_1[count / 28 + 1][count % 28 + 1][count_j] * conv4_2_w[1][1][count_j][count_i]
               + conv4_1[count / 28 + 1][count % 28 + 2][count_j] * conv4_2_w[1][2][count_j][count_i]
               + conv4_1[count / 28 + 2][count % 28][count_j] * conv4_2_w[2][0][count_j][count_i]
               + conv4_1[count / 28 + 2][count % 28 + 1][count_j] * conv4_2_w[2][1][count_j][count_i]
               + conv4_1[count / 28 + 2][count % 28 + 2][count_j] * conv4_2_w[2][2][count_j][count_i];
            if (count_j == 511) begin
              conv4_2[count / 28 + 1][count % 28 + 1][count_i] = conv_sum_next + conv4_2_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 783) begin
                count_next = 32'd0;
                if (count_i == 511) begin
                  state_next = RELU4_2;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU4_2: begin
            if (conv4_2[count / 28 + 1][count % 28 + 1][count_i] < 0)
              conv4_2[count / 28 + 1][count % 28 + 1][count_i] = 0;
            if (count == 783) begin
              count_next = 32'd0;
              if (count_i == 511) begin
                state_next = CONV4_3;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          CONV4_3: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + conv4_2[count / 28][count % 28][count_j] * conv4_3_w[0][0][count_j][count_i]
               + conv4_2[count / 28][count % 28 + 1][count_j] * conv4_3_w[0][1][count_j][count_i]
               + conv4_2[count / 28][count % 28 + 2][count_j] * conv4_3_w[0][2][count_j][count_i]
               + conv4_2[count / 28 + 1][count % 28][count_j] * conv4_3_w[1][0][count_j][count_i]
               + conv4_2[count / 28 + 1][count % 28 + 1][count_j] * conv4_3_w[1][1][count_j][count_i]
               + conv4_2[count / 28 + 1][count % 28 + 2][count_j] * conv4_3_w[1][2][count_j][count_i]
               + conv4_2[count / 28 + 2][count % 28][count_j] * conv4_3_w[2][0][count_j][count_i]
               + conv4_2[count / 28 + 2][count % 28 + 1][count_j] * conv4_3_w[2][1][count_j][count_i]
               + conv4_2[count / 28 + 2][count % 28 + 2][count_j] * conv4_3_w[2][2][count_j][count_i];
            if (count_j == 511) begin
              conv4_3[count / 28 + 1][count % 28 + 1][count_i] = conv_sum_next + conv4_3_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 783) begin
                count_next = 32'd0;
                if (count_i == 511) begin
                  state_next = RELU4_3;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU4_3: begin
            if (conv4_3[count / 28 + 1][count % 28 + 1][count_i] < 0)
              conv4_3[count / 28 + 1][count % 28 + 1][count_i] = 0;
            if (count == 783) begin
              count_next = 32'd0;
              if (count_i == 511) begin
                state_next = CONV4_4;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          CONV4_4: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + conv4_3[count / 28][count % 28][count_j] * conv4_4_w[0][0][count_j][count_i]
               + conv4_3[count / 28][count % 28 + 1][count_j] * conv4_4_w[0][1][count_j][count_i]
               + conv4_3[count / 28][count % 28 + 2][count_j] * conv4_4_w[0][2][count_j][count_i]
               + conv4_3[count / 28 + 1][count % 28][count_j] * conv4_4_w[1][0][count_j][count_i]
               + conv4_3[count / 28 + 1][count % 28 + 1][count_j] * conv4_4_w[1][1][count_j][count_i]
               + conv4_3[count / 28 + 1][count % 28 + 2][count_j] * conv4_4_w[1][2][count_j][count_i]
               + conv4_3[count / 28 + 2][count % 28][count_j] * conv4_4_w[2][0][count_j][count_i]
               + conv4_3[count / 28 + 2][count % 28 + 1][count_j] * conv4_4_w[2][1][count_j][count_i]
               + conv4_3[count / 28 + 2][count % 28 + 2][count_j] * conv4_4_w[2][2][count_j][count_i];
            if (count_j == 511) begin
              conv4_4[count / 28 + 1][count % 28 + 1][count_i] = conv_sum_next + conv4_4_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 783) begin
                count_next = 32'd0;
                if (count_i == 511) begin
                  state_next = RELU4_4;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU4_4: begin
            if (conv4_4[count / 28 + 1][count % 28 + 1][count_i] < 0)
              conv4_4[count / 28 + 1][count % 28 + 1][count_i] = 0;
            if (count == 783) begin
              count_next = 32'd0;
              if (count_i == 511) begin
                state_next = MAXPOOL4;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          MAXPOOL4: begin
            max = -1.0;
            if (conv4_4[count / 28 + 1][count % 28 + 1][count_i] > max)
              max = conv4_4[count / 28 + 1][count % 28 + 1][count_i];
            if (conv4_4[count / 28 + 1][count % 28 + 1 + 1][count_i] > max)
              max = conv4_4[count / 28 + 1][count % 28 + 1 + 1][count_i];
            if (conv4_4[count / 28 + 1 + 1][count % 28 + 1][count_i] > max > max)
              max = conv4_4[count / 28 + 1 + 1][count % 28 + 1][count_i];
            if (conv4_4[count / 28 + 1 + 1][count % 28 + 1 + 1][count_i] > max)
              max = conv4_4[count / 28 + 1 + 1][count % 28 + 1 + 1][count_i];
            if (max < 0) $display("Wrong maxpool");
            maxpool4[(count / 28 + 1 + 1) / 2][(count % 28 + 1 + 1) / 2][count_i] = max;
            if (count == 754) begin
              count_next = 32'd0;
              if (count_i == 511) begin
                state_next = CONV5_1;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
            end
            else begin
              if (count % 28 == 26)
                count_next = count + 2 + 28;
              else
                count_next = count + 2;
            end
          end
          CONV5_1: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + maxpool4[count / 14][count % 14][count_j] * conv5_1_w[0][0][count_j][count_i]
               + maxpool4[count / 14][count % 14 + 1][count_j] * conv5_1_w[0][1][count_j][count_i]
               + maxpool4[count / 14][count % 14 + 2][count_j] * conv5_1_w[0][2][count_j][count_i]
               + maxpool4[count / 14 + 1][count % 14][count_j] * conv5_1_w[1][0][count_j][count_i]
               + maxpool4[count / 14 + 1][count % 14 + 1][count_j] * conv5_1_w[1][1][count_j][count_i]
               + maxpool4[count / 14 + 1][count % 14 + 2][count_j] * conv5_1_w[1][2][count_j][count_i]
               + maxpool4[count / 14 + 2][count % 14][count_j] * conv5_1_w[2][0][count_j][count_i]
               + maxpool4[count / 14 + 2][count % 14 + 1][count_j] * conv5_1_w[2][1][count_j][count_i]
               + maxpool4[count / 14 + 2][count % 14 + 2][count_j] * conv5_1_w[2][2][count_j][count_i];
            if (count_j == 511) begin
              conv5_1[count / 14 + 1][count % 14 + 1][count_i] = conv_sum_next + conv5_1_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 195) begin
                count_next = 32'd0;
                if (count_i == 511) begin
                  state_next = RELU5_1;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU5_1: begin
            if (conv5_1[count / 14 + 1][count % 14 + 1][count_i] < 0)
              conv5_1[count / 14 + 1][count % 14 + 1][count_i] = 0;
            if (count == 195) begin
              count_next = 32'd0;
              if (count_i == 511) begin
                state_next = CONV5_2;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          CONV5_2: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + conv5_1[count / 14][count % 14][count_j] * conv5_2_w[0][0][count_j][count_i] 
               + conv5_1[count / 14][count % 14 + 1][count_j] * conv5_2_w[0][1][count_j][count_i]
               + conv5_1[count / 14][count % 14 + 2][count_j] * conv5_2_w[0][2][count_j][count_i]
               + conv5_1[count / 14 + 1][count % 14][count_j] * conv5_2_w[1][0][count_j][count_i]
               + conv5_1[count / 14 + 1][count % 14 + 1][count_j] * conv5_2_w[1][1][count_j][count_i]
               + conv5_1[count / 14 + 1][count % 14 + 2][count_j] * conv5_2_w[1][2][count_j][count_i]
               + conv5_1[count / 14 + 2][count % 14][count_j] * conv5_2_w[2][0][count_j][count_i]
               + conv5_1[count / 14 + 2][count % 14 + 1][count_j] * conv5_2_w[2][1][count_j][count_i]
               + conv5_1[count / 14 + 2][count % 14 + 2][count_j] * conv5_2_w[2][2][count_j][count_i];
            if (count_j == 511) begin
              conv5_2[count / 14 + 1][count % 14 + 1][count_i] = conv_sum_next + conv5_2_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 195) begin
                count_next = 32'd0;
                if (count_i == 511) begin
                  state_next = RELU5_2;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU5_2: begin
            if (conv5_2[count / 14 + 1][count % 14 + 1][count_i] < 0)
              conv5_2[count / 14 + 1][count % 14 + 1][count_i] = 0;
            if (count == 195) begin
              count_next = 32'd0;
              if (count_i == 511) begin
                state_next = CONV5_3;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          CONV5_3: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + conv5_2[count / 14][count % 14][count_j] * conv5_3_w[0][0][count_j][count_i]
               + conv5_2[count / 14][count % 14 + 1][count_j] * conv5_3_w[0][1][count_j][count_i]
               + conv5_2[count / 14][count % 14 + 2][count_j] * conv5_3_w[0][2][count_j][count_i]
               + conv5_2[count / 14 + 1][count % 14][count_j] * conv5_3_w[1][0][count_j][count_i]
               + conv5_2[count / 14 + 1][count % 14 + 1][count_j] * conv5_3_w[1][1][count_j][count_i]
               + conv5_2[count / 14 + 1][count % 14 + 2][count_j] * conv5_3_w[1][2][count_j][count_i]
               + conv5_2[count / 14 + 2][count % 14][count_j] * conv5_3_w[2][0][count_j][count_i]
               + conv5_2[count / 14 + 2][count % 14 + 1][count_j] * conv5_3_w[2][1][count_j][count_i]
               + conv5_2[count / 14 + 2][count % 14 + 2][count_j] * conv5_3_w[2][2][count_j][count_i];
            if (count_j == 511) begin
              conv5_3[count / 14 + 1][count % 14 + 1][count_i] = conv_sum_next + conv5_3_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 195) begin
                count_next = 32'd0;
                if (count_i == 511) begin
                  state_next = RELU5_3;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU5_3: begin
            if (conv5_3[count / 14 + 1][count % 14 + 1][count_i] < 0)
              conv5_3[count / 14 + 1][count % 14 + 1][count_i] = 0;
            if (count == 195) begin
              count_next = 32'd0;
              if (count_i == 511) begin
                state_next = CONV5_4;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          CONV5_4: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + conv5_3[count / 14][count % 14][count_j] * conv5_4_w[0][0][count_j][count_i]
               + conv5_3[count / 14][count % 14 + 1][count_j] * conv5_4_w[0][1][count_j][count_i]
               + conv5_3[count / 14][count % 14 + 2][count_j] * conv5_4_w[0][2][count_j][count_i]
               + conv5_3[count / 14 + 1][count % 14][count_j] * conv5_4_w[1][0][count_j][count_i]
               + conv5_3[count / 14 + 1][count % 14 + 1][count_j] * conv5_4_w[1][1][count_j][count_i]
               + conv5_3[count / 14 + 1][count % 14 + 2][count_j] * conv5_4_w[1][2][count_j][count_i]
               + conv5_3[count / 14 + 2][count % 14][count_j] * conv5_4_w[2][0][count_j][count_i]
               + conv5_3[count / 14 + 2][count % 14 + 1][count_j] * conv5_4_w[2][1][count_j][count_i] 
               + conv5_3[count / 14 + 2][count % 14 + 2][count_j] * conv5_4_w[2][2][count_j][count_i];
            if (count_j == 511) begin
              conv5_4[count / 14 + 1][count % 14 + 1][count_i] = conv_sum_next + conv5_4_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count == 195) begin
                count_next = 32'd0;
                if (count_i == 511) begin
                  state_next = RELU5_4;
                  count_i_next = 12'd0;
                end
                else
                  count_i_next = count_i + 1'b1;
              end
              else
                count_next = count + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU5_4: begin
            if (conv5_4[count / 14 + 1][count % 14 + 1][count_i] < 0)
              conv5_4[count / 14 + 1][count % 14 + 1][count_i] = 0;
            if (count == 195) begin
              count_next = 32'd0;
              if (count_i == 511) begin
                state_next = MAXPOOL5;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_next = count + 1'b1;
          end
          MAXPOOL5: begin
            max = -1.0;
            if (conv5_4[count / 14 + 1][count % 14 + 1][count_i] > max)
              max = conv5_4[count / 14 + 1][count % 14 + 1][count_i];
            if (conv5_4[count / 14 + 1][count % 14 + 1 + 1][count_i] > max)
              max = conv5_4[count / 14 + 1][count % 14 + 1 + 1][count_i];
            if (conv5_4[count / 14 + 1 + 1][count % 14 + 1][count_i] > max > max)
              max = conv5_4[count / 14 + 1 + 1][count % 14 + 1][count_i];
            if (conv5_4[count / 14 + 1 + 1][count % 14 + 1 + 1][count_i] > max)
              max = conv5_4[count / 14 + 1 + 1][count % 14 + 1 + 1][count_i];
            if (max < 0) $display("Wrong maxpool");
            maxpool5[(count / 14 + 1 + 1) / 2][(count % 14 + 1 + 1) / 2][count_i] = max;
            if (count == 180) begin
              count_next = 32'd0;
              if (count_i == 511) begin
                state_next = FC1;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
            end
            else begin
              if (count % 14 == 12)
                count_next = count + 2 + 14;
              else
                count_next = count + 2;
            end
          end
          FC1: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum
               + maxpool5[1][1][count_j] * fc_1_w[0][0][count_j][count_i]
               + maxpool5[1][2][count_j] * fc_1_w[0][1][count_j][count_i]
               + maxpool5[1][3][count_j] * fc_1_w[0][2][count_j][count_i]
               + maxpool5[1][4][count_j] * fc_1_w[0][3][count_j][count_i] 
               + maxpool5[1][5][count_j] * fc_1_w[0][4][count_j][count_i]
               + maxpool5[1][6][count_j] * fc_1_w[0][5][count_j][count_i] 
               + maxpool5[1][7][count_j] * fc_1_w[0][6][count_j][count_i]
               + maxpool5[2][1][count_j] * fc_1_w[1][0][count_j][count_i]
               + maxpool5[2][2][count_j] * fc_1_w[1][1][count_j][count_i]
               + maxpool5[2][3][count_j] * fc_1_w[1][2][count_j][count_i] 
               + maxpool5[2][4][count_j] * fc_1_w[1][3][count_j][count_i]
               + maxpool5[2][5][count_j] * fc_1_w[1][4][count_j][count_i]
               + maxpool5[2][6][count_j] * fc_1_w[1][5][count_j][count_i]
               + maxpool5[2][7][count_j] * fc_1_w[1][6][count_j][count_i]
               + maxpool5[3][1][count_j] * fc_1_w[2][0][count_j][count_i]
               + maxpool5[3][2][count_j] * fc_1_w[2][1][count_j][count_i]
               + maxpool5[3][3][count_j] * fc_1_w[2][2][count_j][count_i]
               + maxpool5[3][4][count_j] * fc_1_w[2][3][count_j][count_i] 
               + maxpool5[3][5][count_j] * fc_1_w[2][4][count_j][count_i]
               + maxpool5[3][6][count_j] * fc_1_w[2][5][count_j][count_i]
               + maxpool5[3][7][count_j] * fc_1_w[2][6][count_j][count_i]
               + maxpool5[4][1][count_j] * fc_1_w[3][0][count_j][count_i]
               + maxpool5[4][2][count_j] * fc_1_w[3][1][count_j][count_i]
               + maxpool5[4][3][count_j] * fc_1_w[3][2][count_j][count_i]
               + maxpool5[4][4][count_j] * fc_1_w[3][3][count_j][count_i]
               + maxpool5[4][5][count_j] * fc_1_w[3][4][count_j][count_i]
               + maxpool5[4][6][count_j] * fc_1_w[3][5][count_j][count_i]
               + maxpool5[4][7][count_j] * fc_1_w[3][6][count_j][count_i]
               + maxpool5[5][1][count_j] * fc_1_w[4][0][count_j][count_i]
               + maxpool5[5][2][count_j] * fc_1_w[4][1][count_j][count_i]
               + maxpool5[5][3][count_j] * fc_1_w[4][2][count_j][count_i]
               + maxpool5[5][4][count_j] * fc_1_w[4][3][count_j][count_i] 
               + maxpool5[5][5][count_j] * fc_1_w[4][4][count_j][count_i]
               + maxpool5[5][6][count_j] * fc_1_w[4][5][count_j][count_i]
               + maxpool5[5][7][count_j] * fc_1_w[4][6][count_j][count_i]
               + maxpool5[6][1][count_j] * fc_1_w[5][0][count_j][count_i]
               + maxpool5[6][2][count_j] * fc_1_w[5][1][count_j][count_i]
               + maxpool5[6][3][count_j] * fc_1_w[5][2][count_j][count_i]
               + maxpool5[6][4][count_j] * fc_1_w[5][3][count_j][count_i] 
               + maxpool5[6][5][count_j] * fc_1_w[5][4][count_j][count_i] 
               + maxpool5[6][6][count_j] * fc_1_w[5][5][count_j][count_i] 
               + maxpool5[6][7][count_j] * fc_1_w[5][6][count_j][count_i]
               + maxpool5[7][1][count_j] * fc_1_w[6][0][count_j][count_i]
               + maxpool5[7][2][count_j] * fc_1_w[6][1][count_j][count_i] 
               + maxpool5[7][3][count_j] * fc_1_w[6][2][count_j][count_i]
               + maxpool5[7][4][count_j] * fc_1_w[6][3][count_j][count_i]
               + maxpool5[7][5][count_j] * fc_1_w[6][4][count_j][count_i]
               + maxpool5[7][6][count_j] * fc_1_w[6][5][count_j][count_i] 
               + maxpool5[7][7][count_j] * fc_1_w[6][6][count_j][count_i];
            if (count_j == 511) begin
              fc1[0][0][count_i] = conv_sum_next + fc_1_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count_i == 4095) begin
                state_next = RELU_FC1;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU_FC1: begin
            if (fc1[0][0][count_i] < 0)
              fc1[0][0][count_i] = 0;
            if (count_i == 4095) begin
              state_next = FC2;
              count_i_next = 12'd0;
            end
            else
              count_i_next = count_i + 1'b1;
          end
          FC2: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum + fc1[0][0][count_j] * fc_2_w[0][0][count_j][count_i];
            if (count_j == 4095) begin
              fc2[0][0][count_i] = conv_sum_next + fc_2_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count_i == 4095) begin
                state_next = RELU_FC2;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          RELU_FC2: begin
            if (fc2[0][0][count_i] < 0)
              fc2[0][0][count_i] = 0;
            if (count_i == 4095) begin
              state_next = FC3;
              count_i_next = 12'd0;
            end
            else
              count_i_next = count_i + 1'b1;
          end
          FC3: begin
            if (count_j == 0 && conv_sum != 0) $display("conv_sum should be 0");
            conv_sum_next = conv_sum + fc2[0][0][count_j] * fc_3_w[0][0][count_j][count_i];
            if (count_j == 4095) begin
              fc3[0][0][count_i] = conv_sum_next + fc_3_b[count_i];
              conv_sum_next = 0;
              count_j_next = 12'd0;
              if (count_i == 999) begin
                state_next = SOFTMAX;
                count_i_next = 12'd0;
              end
              else
                count_i_next = count_i + 1'b1;
              end
            else
              count_j_next = count_j + 1'b1;
          end
          SOFTMAX: begin
            $fwrite(vgg19_out, "%f\n", fc3[0][0][count_i]);
            if (count_i == 999) begin
              state_next = DONE;
              count_i_next = 12'd0;
            end
            else
              count_i_next = count_i + 1'b1;
          end
          DONE: begin
            pcpi_wr = 1'b1;
            pcpi_rd = 32'd55;
            pcpi_wait = 1'b0;
            pcpi_ready = 1'b1;
            state_next = IDLE;
          end
        endcase
  end

endmodule
