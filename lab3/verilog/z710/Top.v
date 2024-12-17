module Memory(
  input         clock,
  input  [31:0] io_bundle_address, // @[src/main/scala/peripheral/Memory.scala 56:14]
  input  [31:0] io_bundle_write_data, // @[src/main/scala/peripheral/Memory.scala 56:14]
  input         io_bundle_write_enable, // @[src/main/scala/peripheral/Memory.scala 56:14]
  input         io_bundle_write_strobe_0, // @[src/main/scala/peripheral/Memory.scala 56:14]
  input         io_bundle_write_strobe_1, // @[src/main/scala/peripheral/Memory.scala 56:14]
  input         io_bundle_write_strobe_2, // @[src/main/scala/peripheral/Memory.scala 56:14]
  input         io_bundle_write_strobe_3, // @[src/main/scala/peripheral/Memory.scala 56:14]
  output [31:0] io_bundle_read_data, // @[src/main/scala/peripheral/Memory.scala 56:14]
  output [31:0] io_instruction, // @[src/main/scala/peripheral/Memory.scala 56:14]
  input  [31:0] io_instruction_address // @[src/main/scala/peripheral/Memory.scala 56:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_21;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem_0 [0:8191]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_0_io_bundle_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_0_io_bundle_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_0_io_bundle_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_0_io_debug_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_0_io_debug_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_0_io_debug_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_0_io_instruction_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_0_io_instruction_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_0_io_instruction_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_0_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_0_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_0_MPORT_mask; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_0_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  reg  mem_0_io_bundle_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_0_io_bundle_read_data_MPORT_addr_pipe_0;
  reg  mem_0_io_debug_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_0_io_debug_read_data_MPORT_addr_pipe_0;
  reg  mem_0_io_instruction_MPORT_en_pipe_0;
  reg [12:0] mem_0_io_instruction_MPORT_addr_pipe_0;
  reg [7:0] mem_1 [0:8191]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_1_io_bundle_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_1_io_bundle_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_1_io_bundle_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_1_io_debug_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_1_io_debug_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_1_io_debug_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_1_io_instruction_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_1_io_instruction_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_1_io_instruction_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_1_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_1_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_1_MPORT_mask; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_1_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  reg  mem_1_io_bundle_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_1_io_bundle_read_data_MPORT_addr_pipe_0;
  reg  mem_1_io_debug_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_1_io_debug_read_data_MPORT_addr_pipe_0;
  reg  mem_1_io_instruction_MPORT_en_pipe_0;
  reg [12:0] mem_1_io_instruction_MPORT_addr_pipe_0;
  reg [7:0] mem_2 [0:8191]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_2_io_bundle_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_2_io_bundle_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_2_io_bundle_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_2_io_debug_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_2_io_debug_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_2_io_debug_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_2_io_instruction_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_2_io_instruction_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_2_io_instruction_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_2_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_2_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_2_MPORT_mask; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_2_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  reg  mem_2_io_bundle_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_2_io_bundle_read_data_MPORT_addr_pipe_0;
  reg  mem_2_io_debug_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_2_io_debug_read_data_MPORT_addr_pipe_0;
  reg  mem_2_io_instruction_MPORT_en_pipe_0;
  reg [12:0] mem_2_io_instruction_MPORT_addr_pipe_0;
  reg [7:0] mem_3 [0:8191]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_3_io_bundle_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_3_io_bundle_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_3_io_bundle_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_3_io_debug_read_data_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_3_io_debug_read_data_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_3_io_debug_read_data_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_3_io_instruction_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_3_io_instruction_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_3_io_instruction_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [7:0] mem_3_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire [12:0] mem_3_MPORT_addr; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_3_MPORT_mask; // @[src/main/scala/peripheral/Memory.scala 66:24]
  wire  mem_3_MPORT_en; // @[src/main/scala/peripheral/Memory.scala 66:24]
  reg  mem_3_io_bundle_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_3_io_bundle_read_data_MPORT_addr_pipe_0;
  reg  mem_3_io_debug_read_data_MPORT_en_pipe_0;
  reg [12:0] mem_3_io_debug_read_data_MPORT_addr_pipe_0;
  reg  mem_3_io_instruction_MPORT_en_pipe_0;
  reg [12:0] mem_3_io_instruction_MPORT_addr_pipe_0;
  wire [31:0] _T = {{2'd0}, io_bundle_address[31:2]}; // @[src/main/scala/peripheral/Memory.scala 72:34]
  wire [15:0] io_bundle_read_data_lo = {mem_1_io_bundle_read_data_MPORT_data,mem_0_io_bundle_read_data_MPORT_data}; // @[src/main/scala/peripheral/Memory.scala 74:78]
  wire [15:0] io_bundle_read_data_hi = {mem_3_io_bundle_read_data_MPORT_data,mem_2_io_bundle_read_data_MPORT_data}; // @[src/main/scala/peripheral/Memory.scala 74:78]
  wire [31:0] _io_instruction_T = {{2'd0}, io_instruction_address[31:2]}; // @[src/main/scala/peripheral/Memory.scala 76:54]
  wire [15:0] io_instruction_lo = {mem_1_io_instruction_MPORT_data,mem_0_io_instruction_MPORT_data}; // @[src/main/scala/peripheral/Memory.scala 76:78]
  wire [15:0] io_instruction_hi = {mem_3_io_instruction_MPORT_data,mem_2_io_instruction_MPORT_data}; // @[src/main/scala/peripheral/Memory.scala 76:78]
  assign mem_0_io_bundle_read_data_MPORT_en = mem_0_io_bundle_read_data_MPORT_en_pipe_0;
  assign mem_0_io_bundle_read_data_MPORT_addr = mem_0_io_bundle_read_data_MPORT_addr_pipe_0;
  assign mem_0_io_bundle_read_data_MPORT_data = mem_0[mem_0_io_bundle_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_0_io_debug_read_data_MPORT_en = mem_0_io_debug_read_data_MPORT_en_pipe_0;
  assign mem_0_io_debug_read_data_MPORT_addr = mem_0_io_debug_read_data_MPORT_addr_pipe_0;
  assign mem_0_io_debug_read_data_MPORT_data = mem_0[mem_0_io_debug_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_0_io_instruction_MPORT_en = mem_0_io_instruction_MPORT_en_pipe_0;
  assign mem_0_io_instruction_MPORT_addr = mem_0_io_instruction_MPORT_addr_pipe_0;
  assign mem_0_io_instruction_MPORT_data = mem_0[mem_0_io_instruction_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_0_MPORT_data = io_bundle_write_data[7:0];
  assign mem_0_MPORT_addr = _T[12:0];
  assign mem_0_MPORT_mask = io_bundle_write_strobe_0;
  assign mem_0_MPORT_en = io_bundle_write_enable;
  assign mem_1_io_bundle_read_data_MPORT_en = mem_1_io_bundle_read_data_MPORT_en_pipe_0;
  assign mem_1_io_bundle_read_data_MPORT_addr = mem_1_io_bundle_read_data_MPORT_addr_pipe_0;
  assign mem_1_io_bundle_read_data_MPORT_data = mem_1[mem_1_io_bundle_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_1_io_debug_read_data_MPORT_en = mem_1_io_debug_read_data_MPORT_en_pipe_0;
  assign mem_1_io_debug_read_data_MPORT_addr = mem_1_io_debug_read_data_MPORT_addr_pipe_0;
  assign mem_1_io_debug_read_data_MPORT_data = mem_1[mem_1_io_debug_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_1_io_instruction_MPORT_en = mem_1_io_instruction_MPORT_en_pipe_0;
  assign mem_1_io_instruction_MPORT_addr = mem_1_io_instruction_MPORT_addr_pipe_0;
  assign mem_1_io_instruction_MPORT_data = mem_1[mem_1_io_instruction_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_1_MPORT_data = io_bundle_write_data[15:8];
  assign mem_1_MPORT_addr = _T[12:0];
  assign mem_1_MPORT_mask = io_bundle_write_strobe_1;
  assign mem_1_MPORT_en = io_bundle_write_enable;
  assign mem_2_io_bundle_read_data_MPORT_en = mem_2_io_bundle_read_data_MPORT_en_pipe_0;
  assign mem_2_io_bundle_read_data_MPORT_addr = mem_2_io_bundle_read_data_MPORT_addr_pipe_0;
  assign mem_2_io_bundle_read_data_MPORT_data = mem_2[mem_2_io_bundle_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_2_io_debug_read_data_MPORT_en = mem_2_io_debug_read_data_MPORT_en_pipe_0;
  assign mem_2_io_debug_read_data_MPORT_addr = mem_2_io_debug_read_data_MPORT_addr_pipe_0;
  assign mem_2_io_debug_read_data_MPORT_data = mem_2[mem_2_io_debug_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_2_io_instruction_MPORT_en = mem_2_io_instruction_MPORT_en_pipe_0;
  assign mem_2_io_instruction_MPORT_addr = mem_2_io_instruction_MPORT_addr_pipe_0;
  assign mem_2_io_instruction_MPORT_data = mem_2[mem_2_io_instruction_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_2_MPORT_data = io_bundle_write_data[23:16];
  assign mem_2_MPORT_addr = _T[12:0];
  assign mem_2_MPORT_mask = io_bundle_write_strobe_2;
  assign mem_2_MPORT_en = io_bundle_write_enable;
  assign mem_3_io_bundle_read_data_MPORT_en = mem_3_io_bundle_read_data_MPORT_en_pipe_0;
  assign mem_3_io_bundle_read_data_MPORT_addr = mem_3_io_bundle_read_data_MPORT_addr_pipe_0;
  assign mem_3_io_bundle_read_data_MPORT_data = mem_3[mem_3_io_bundle_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_3_io_debug_read_data_MPORT_en = mem_3_io_debug_read_data_MPORT_en_pipe_0;
  assign mem_3_io_debug_read_data_MPORT_addr = mem_3_io_debug_read_data_MPORT_addr_pipe_0;
  assign mem_3_io_debug_read_data_MPORT_data = mem_3[mem_3_io_debug_read_data_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_3_io_instruction_MPORT_en = mem_3_io_instruction_MPORT_en_pipe_0;
  assign mem_3_io_instruction_MPORT_addr = mem_3_io_instruction_MPORT_addr_pipe_0;
  assign mem_3_io_instruction_MPORT_data = mem_3[mem_3_io_instruction_MPORT_addr]; // @[src/main/scala/peripheral/Memory.scala 66:24]
  assign mem_3_MPORT_data = io_bundle_write_data[31:24];
  assign mem_3_MPORT_addr = _T[12:0];
  assign mem_3_MPORT_mask = io_bundle_write_strobe_3;
  assign mem_3_MPORT_en = io_bundle_write_enable;
  assign io_bundle_read_data = {io_bundle_read_data_hi,io_bundle_read_data_lo}; // @[src/main/scala/peripheral/Memory.scala 74:78]
  assign io_instruction = {io_instruction_hi,io_instruction_lo}; // @[src/main/scala/peripheral/Memory.scala 76:78]
  always @(posedge clock) begin
    if (mem_0_MPORT_en & mem_0_MPORT_mask) begin
      mem_0[mem_0_MPORT_addr] <= mem_0_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
    end
    mem_0_io_bundle_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_0_io_bundle_read_data_MPORT_addr_pipe_0 <= _T[12:0];
    end
    mem_0_io_debug_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_0_io_debug_read_data_MPORT_addr_pipe_0 <= 13'h0;
    end
    mem_0_io_instruction_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_0_io_instruction_MPORT_addr_pipe_0 <= _io_instruction_T[12:0];
    end
    if (mem_1_MPORT_en & mem_1_MPORT_mask) begin
      mem_1[mem_1_MPORT_addr] <= mem_1_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
    end
    mem_1_io_bundle_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_1_io_bundle_read_data_MPORT_addr_pipe_0 <= _T[12:0];
    end
    mem_1_io_debug_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_1_io_debug_read_data_MPORT_addr_pipe_0 <= 13'h0;
    end
    mem_1_io_instruction_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_1_io_instruction_MPORT_addr_pipe_0 <= _io_instruction_T[12:0];
    end
    if (mem_2_MPORT_en & mem_2_MPORT_mask) begin
      mem_2[mem_2_MPORT_addr] <= mem_2_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
    end
    mem_2_io_bundle_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_2_io_bundle_read_data_MPORT_addr_pipe_0 <= _T[12:0];
    end
    mem_2_io_debug_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_2_io_debug_read_data_MPORT_addr_pipe_0 <= 13'h0;
    end
    mem_2_io_instruction_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_2_io_instruction_MPORT_addr_pipe_0 <= _io_instruction_T[12:0];
    end
    if (mem_3_MPORT_en & mem_3_MPORT_mask) begin
      mem_3[mem_3_MPORT_addr] <= mem_3_MPORT_data; // @[src/main/scala/peripheral/Memory.scala 66:24]
    end
    mem_3_io_bundle_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_3_io_bundle_read_data_MPORT_addr_pipe_0 <= _T[12:0];
    end
    mem_3_io_debug_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_3_io_debug_read_data_MPORT_addr_pipe_0 <= 13'h0;
    end
    mem_3_io_instruction_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_3_io_instruction_MPORT_addr_pipe_0 <= _io_instruction_T[12:0];
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    mem_0[initvar] = _RAND_0[7:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    mem_1[initvar] = _RAND_7[7:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    mem_2[initvar] = _RAND_14[7:0];
  _RAND_21 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8192; initvar = initvar+1)
    mem_3[initvar] = _RAND_21[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_0_io_bundle_read_data_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_0_io_bundle_read_data_MPORT_addr_pipe_0 = _RAND_2[12:0];
  _RAND_3 = {1{`RANDOM}};
  mem_0_io_debug_read_data_MPORT_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  mem_0_io_debug_read_data_MPORT_addr_pipe_0 = _RAND_4[12:0];
  _RAND_5 = {1{`RANDOM}};
  mem_0_io_instruction_MPORT_en_pipe_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  mem_0_io_instruction_MPORT_addr_pipe_0 = _RAND_6[12:0];
  _RAND_8 = {1{`RANDOM}};
  mem_1_io_bundle_read_data_MPORT_en_pipe_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  mem_1_io_bundle_read_data_MPORT_addr_pipe_0 = _RAND_9[12:0];
  _RAND_10 = {1{`RANDOM}};
  mem_1_io_debug_read_data_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mem_1_io_debug_read_data_MPORT_addr_pipe_0 = _RAND_11[12:0];
  _RAND_12 = {1{`RANDOM}};
  mem_1_io_instruction_MPORT_en_pipe_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  mem_1_io_instruction_MPORT_addr_pipe_0 = _RAND_13[12:0];
  _RAND_15 = {1{`RANDOM}};
  mem_2_io_bundle_read_data_MPORT_en_pipe_0 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  mem_2_io_bundle_read_data_MPORT_addr_pipe_0 = _RAND_16[12:0];
  _RAND_17 = {1{`RANDOM}};
  mem_2_io_debug_read_data_MPORT_en_pipe_0 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  mem_2_io_debug_read_data_MPORT_addr_pipe_0 = _RAND_18[12:0];
  _RAND_19 = {1{`RANDOM}};
  mem_2_io_instruction_MPORT_en_pipe_0 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  mem_2_io_instruction_MPORT_addr_pipe_0 = _RAND_20[12:0];
  _RAND_22 = {1{`RANDOM}};
  mem_3_io_bundle_read_data_MPORT_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  mem_3_io_bundle_read_data_MPORT_addr_pipe_0 = _RAND_23[12:0];
  _RAND_24 = {1{`RANDOM}};
  mem_3_io_debug_read_data_MPORT_en_pipe_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  mem_3_io_debug_read_data_MPORT_addr_pipe_0 = _RAND_25[12:0];
  _RAND_26 = {1{`RANDOM}};
  mem_3_io_instruction_MPORT_en_pipe_0 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  mem_3_io_instruction_MPORT_addr_pipe_0 = _RAND_27[12:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Timer(
  input         clock,
  input         reset,
  input  [31:0] io_bundle_address, // @[src/main/scala/peripheral/Timer.scala 22:14]
  input  [31:0] io_bundle_write_data, // @[src/main/scala/peripheral/Timer.scala 22:14]
  input         io_bundle_write_enable, // @[src/main/scala/peripheral/Timer.scala 22:14]
  output [31:0] io_bundle_read_data, // @[src/main/scala/peripheral/Timer.scala 22:14]
  output        io_signal_interrupt // @[src/main/scala/peripheral/Timer.scala 22:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] count; // @[src/main/scala/peripheral/Timer.scala 30:22]
  reg [31:0] limit; // @[src/main/scala/peripheral/Timer.scala 31:22]
  reg  enabled; // @[src/main/scala/peripheral/Timer.scala 33:24]
  wire [31:0] _io_bundle_read_data_T_1 = 32'h4 == io_bundle_address ? limit : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _GEN_0 = io_bundle_address == 32'h8 ? io_bundle_write_data != 32'h0 : enabled; // @[src/main/scala/peripheral/Timer.scala 48:45 49:15 33:24]
  wire  _GEN_3 = io_bundle_address == 32'h4 ? enabled : _GEN_0; // @[src/main/scala/peripheral/Timer.scala 33:24 45:39]
  wire  _GEN_6 = io_bundle_write_enable ? _GEN_3 : enabled; // @[src/main/scala/peripheral/Timer.scala 33:24 44:32]
  wire [31:0] _io_signal_interrupt_T_1 = limit - 32'ha; // @[src/main/scala/peripheral/Timer.scala 53:54]
  wire [31:0] _count_T_1 = count + 32'h1; // @[src/main/scala/peripheral/Timer.scala 58:20]
  assign io_bundle_read_data = 32'h8 == io_bundle_address ? {{31'd0}, enabled} : _io_bundle_read_data_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_signal_interrupt = enabled & count >= _io_signal_interrupt_T_1; // @[src/main/scala/peripheral/Timer.scala 53:34]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/Timer.scala 30:22]
      count <= 32'h0; // @[src/main/scala/peripheral/Timer.scala 30:22]
    end else if (count >= limit) begin // @[src/main/scala/peripheral/Timer.scala 55:24]
      count <= 32'h0; // @[src/main/scala/peripheral/Timer.scala 56:11]
    end else begin
      count <= _count_T_1; // @[src/main/scala/peripheral/Timer.scala 58:11]
    end
    if (reset) begin // @[src/main/scala/peripheral/Timer.scala 31:22]
      limit <= 32'h5f5e100; // @[src/main/scala/peripheral/Timer.scala 31:22]
    end else if (io_bundle_write_enable) begin // @[src/main/scala/peripheral/Timer.scala 44:32]
      if (io_bundle_address == 32'h4) begin // @[src/main/scala/peripheral/Timer.scala 45:39]
        limit <= io_bundle_write_data; // @[src/main/scala/peripheral/Timer.scala 46:13]
      end
    end
    enabled <= reset | _GEN_6; // @[src/main/scala/peripheral/Timer.scala 33:{24,24}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  count = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  limit = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  enabled = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Tx(
  input        clock,
  input        reset,
  output       io_txd, // @[src/main/scala/peripheral/UART.scala 30:14]
  output       io_channel_ready, // @[src/main/scala/peripheral/UART.scala 30:14]
  input        io_channel_valid, // @[src/main/scala/peripheral/UART.scala 30:14]
  input  [7:0] io_channel_bits // @[src/main/scala/peripheral/UART.scala 30:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [10:0] shiftReg; // @[src/main/scala/peripheral/UART.scala 38:25]
  reg [19:0] cntReg; // @[src/main/scala/peripheral/UART.scala 39:23]
  reg [3:0] bitsReg; // @[src/main/scala/peripheral/UART.scala 40:24]
  wire  _io_channel_ready_T = cntReg == 20'h0; // @[src/main/scala/peripheral/UART.scala 42:31]
  wire [9:0] shift = shiftReg[10:1]; // @[src/main/scala/peripheral/UART.scala 49:28]
  wire [10:0] _shiftReg_T_1 = {1'h1,shift}; // @[src/main/scala/peripheral/UART.scala 50:22]
  wire [3:0] _bitsReg_T_1 = bitsReg - 4'h1; // @[src/main/scala/peripheral/UART.scala 51:26]
  wire [10:0] _shiftReg_T_3 = {2'h3,io_channel_bits,1'h0}; // @[src/main/scala/peripheral/UART.scala 54:24]
  wire [19:0] _cntReg_T_1 = cntReg - 20'h1; // @[src/main/scala/peripheral/UART.scala 62:22]
  assign io_txd = shiftReg[0]; // @[src/main/scala/peripheral/UART.scala 43:21]
  assign io_channel_ready = cntReg == 20'h0 & bitsReg == 4'h0; // @[src/main/scala/peripheral/UART.scala 42:40]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 38:25]
      shiftReg <= 11'h7ff; // @[src/main/scala/peripheral/UART.scala 38:25]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/peripheral/UART.scala 45:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 48:27]
        shiftReg <= _shiftReg_T_1; // @[src/main/scala/peripheral/UART.scala 50:16]
      end else if (io_channel_valid) begin // @[src/main/scala/peripheral/UART.scala 53:30]
        shiftReg <= _shiftReg_T_3; // @[src/main/scala/peripheral/UART.scala 54:18]
      end else begin
        shiftReg <= 11'h7ff; // @[src/main/scala/peripheral/UART.scala 57:18]
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 39:23]
      cntReg <= 20'h0; // @[src/main/scala/peripheral/UART.scala 39:23]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/peripheral/UART.scala 45:24]
      cntReg <= 20'hd8; // @[src/main/scala/peripheral/UART.scala 47:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[src/main/scala/peripheral/UART.scala 62:12]
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 40:24]
      bitsReg <= 4'h0; // @[src/main/scala/peripheral/UART.scala 40:24]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/peripheral/UART.scala 45:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 48:27]
        bitsReg <= _bitsReg_T_1; // @[src/main/scala/peripheral/UART.scala 51:15]
      end else if (io_channel_valid) begin // @[src/main/scala/peripheral/UART.scala 53:30]
        bitsReg <= 4'hb; // @[src/main/scala/peripheral/UART.scala 55:17]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  shiftReg = _RAND_0[10:0];
  _RAND_1 = {1{`RANDOM}};
  cntReg = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  bitsReg = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Buffer(
  input        clock,
  input        reset,
  input        io_in_valid, // @[src/main/scala/peripheral/UART.scala 119:14]
  input  [7:0] io_in_bits, // @[src/main/scala/peripheral/UART.scala 119:14]
  input        io_out_ready, // @[src/main/scala/peripheral/UART.scala 119:14]
  output       io_out_valid, // @[src/main/scala/peripheral/UART.scala 119:14]
  output [7:0] io_out_bits // @[src/main/scala/peripheral/UART.scala 119:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[src/main/scala/peripheral/UART.scala 125:25]
  reg [7:0] dataReg; // @[src/main/scala/peripheral/UART.scala 126:24]
  wire  _io_in_ready_T = ~stateReg; // @[src/main/scala/peripheral/UART.scala 128:27]
  wire  _GEN_1 = io_in_valid | stateReg; // @[src/main/scala/peripheral/UART.scala 132:23 134:16 125:25]
  assign io_out_valid = stateReg; // @[src/main/scala/peripheral/UART.scala 129:28]
  assign io_out_bits = dataReg; // @[src/main/scala/peripheral/UART.scala 141:15]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 125:25]
      stateReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 125:25]
    end else if (_io_in_ready_T) begin // @[src/main/scala/peripheral/UART.scala 131:28]
      stateReg <= _GEN_1;
    end else if (io_out_ready) begin // @[src/main/scala/peripheral/UART.scala 137:24]
      stateReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 138:16]
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 126:24]
      dataReg <= 8'h0; // @[src/main/scala/peripheral/UART.scala 126:24]
    end else if (_io_in_ready_T) begin // @[src/main/scala/peripheral/UART.scala 131:28]
      if (io_in_valid) begin // @[src/main/scala/peripheral/UART.scala 132:23]
        dataReg <= io_in_bits; // @[src/main/scala/peripheral/UART.scala 133:15]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dataReg = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BufferedTx(
  input        clock,
  input        reset,
  output       io_txd, // @[src/main/scala/peripheral/UART.scala 148:14]
  input        io_channel_valid, // @[src/main/scala/peripheral/UART.scala 148:14]
  input  [7:0] io_channel_bits // @[src/main/scala/peripheral/UART.scala 148:14]
);
  wire  tx_clock; // @[src/main/scala/peripheral/UART.scala 153:18]
  wire  tx_reset; // @[src/main/scala/peripheral/UART.scala 153:18]
  wire  tx_io_txd; // @[src/main/scala/peripheral/UART.scala 153:18]
  wire  tx_io_channel_ready; // @[src/main/scala/peripheral/UART.scala 153:18]
  wire  tx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 153:18]
  wire [7:0] tx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 153:18]
  wire  buf__clock; // @[src/main/scala/peripheral/UART.scala 154:19]
  wire  buf__reset; // @[src/main/scala/peripheral/UART.scala 154:19]
  wire  buf__io_in_valid; // @[src/main/scala/peripheral/UART.scala 154:19]
  wire [7:0] buf__io_in_bits; // @[src/main/scala/peripheral/UART.scala 154:19]
  wire  buf__io_out_ready; // @[src/main/scala/peripheral/UART.scala 154:19]
  wire  buf__io_out_valid; // @[src/main/scala/peripheral/UART.scala 154:19]
  wire [7:0] buf__io_out_bits; // @[src/main/scala/peripheral/UART.scala 154:19]
  Tx tx ( // @[src/main/scala/peripheral/UART.scala 153:18]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_ready(tx_io_channel_ready),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  Buffer buf_ ( // @[src/main/scala/peripheral/UART.scala 154:19]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_in_valid(buf__io_in_valid),
    .io_in_bits(buf__io_in_bits),
    .io_out_ready(buf__io_out_ready),
    .io_out_valid(buf__io_out_valid),
    .io_out_bits(buf__io_out_bits)
  );
  assign io_txd = tx_io_txd; // @[src/main/scala/peripheral/UART.scala 158:10]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = buf__io_out_valid; // @[src/main/scala/peripheral/UART.scala 157:17]
  assign tx_io_channel_bits = buf__io_out_bits; // @[src/main/scala/peripheral/UART.scala 157:17]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_in_valid = io_channel_valid; // @[src/main/scala/peripheral/UART.scala 156:13]
  assign buf__io_in_bits = io_channel_bits; // @[src/main/scala/peripheral/UART.scala 156:13]
  assign buf__io_out_ready = tx_io_channel_ready; // @[src/main/scala/peripheral/UART.scala 157:17]
endmodule
module Rx(
  input        clock,
  input        reset,
  input        io_rxd, // @[src/main/scala/peripheral/UART.scala 75:14]
  input        io_channel_ready, // @[src/main/scala/peripheral/UART.scala 75:14]
  output       io_channel_valid, // @[src/main/scala/peripheral/UART.scala 75:14]
  output [7:0] io_channel_bits // @[src/main/scala/peripheral/UART.scala 75:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  rxReg_REG; // @[src/main/scala/peripheral/UART.scala 85:30]
  reg  rxReg; // @[src/main/scala/peripheral/UART.scala 85:22]
  reg [7:0] shiftReg; // @[src/main/scala/peripheral/UART.scala 87:25]
  reg [19:0] cntReg; // @[src/main/scala/peripheral/UART.scala 88:23]
  reg [3:0] bitsReg; // @[src/main/scala/peripheral/UART.scala 89:24]
  reg  valReg; // @[src/main/scala/peripheral/UART.scala 90:23]
  wire [19:0] _cntReg_T_1 = cntReg - 20'h1; // @[src/main/scala/peripheral/UART.scala 93:22]
  wire [7:0] _shiftReg_T_1 = {rxReg,shiftReg[7:1]}; // @[src/main/scala/peripheral/UART.scala 96:20]
  wire [3:0] _bitsReg_T_1 = bitsReg - 4'h1; // @[src/main/scala/peripheral/UART.scala 97:24]
  wire  _GEN_0 = bitsReg == 4'h1 | valReg; // @[src/main/scala/peripheral/UART.scala 100:14 90:23 99:27]
  assign io_channel_valid = valReg; // @[src/main/scala/peripheral/UART.scala 112:20]
  assign io_channel_bits = shiftReg; // @[src/main/scala/peripheral/UART.scala 111:19]
  always @(posedge clock) begin
    rxReg_REG <= reset | io_rxd; // @[src/main/scala/peripheral/UART.scala 85:{30,30,30}]
    rxReg <= reset | rxReg_REG; // @[src/main/scala/peripheral/UART.scala 85:{22,22,22}]
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 87:25]
      shiftReg <= 8'h0; // @[src/main/scala/peripheral/UART.scala 87:25]
    end else if (!(cntReg != 20'h0)) begin // @[src/main/scala/peripheral/UART.scala 92:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 94:31]
        shiftReg <= _shiftReg_T_1; // @[src/main/scala/peripheral/UART.scala 96:14]
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 88:23]
      cntReg <= 20'h0; // @[src/main/scala/peripheral/UART.scala 88:23]
    end else if (cntReg != 20'h0) begin // @[src/main/scala/peripheral/UART.scala 92:24]
      cntReg <= _cntReg_T_1; // @[src/main/scala/peripheral/UART.scala 93:12]
    end else if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 94:31]
      cntReg <= 20'hd8; // @[src/main/scala/peripheral/UART.scala 95:12]
    end else if (~rxReg) begin // @[src/main/scala/peripheral/UART.scala 102:29]
      cntReg <= 20'h145; // @[src/main/scala/peripheral/UART.scala 103:12]
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 89:24]
      bitsReg <= 4'h0; // @[src/main/scala/peripheral/UART.scala 89:24]
    end else if (!(cntReg != 20'h0)) begin // @[src/main/scala/peripheral/UART.scala 92:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 94:31]
        bitsReg <= _bitsReg_T_1; // @[src/main/scala/peripheral/UART.scala 97:13]
      end else if (~rxReg) begin // @[src/main/scala/peripheral/UART.scala 102:29]
        bitsReg <= 4'h8; // @[src/main/scala/peripheral/UART.scala 104:13]
      end
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 90:23]
      valReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 90:23]
    end else if (valReg & io_channel_ready) begin // @[src/main/scala/peripheral/UART.scala 107:36]
      valReg <= 1'h0; // @[src/main/scala/peripheral/UART.scala 108:12]
    end else if (!(cntReg != 20'h0)) begin // @[src/main/scala/peripheral/UART.scala 92:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/peripheral/UART.scala 94:31]
        valReg <= _GEN_0;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rxReg_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rxReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  shiftReg = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  cntReg = _RAND_3[19:0];
  _RAND_4 = {1{`RANDOM}};
  bitsReg = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  valReg = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Uart(
  input         clock,
  input         reset,
  input  [31:0] io_bundle_address, // @[src/main/scala/peripheral/UART.scala 162:14]
  input  [31:0] io_bundle_write_data, // @[src/main/scala/peripheral/UART.scala 162:14]
  input         io_bundle_write_enable, // @[src/main/scala/peripheral/UART.scala 162:14]
  output [31:0] io_bundle_read_data, // @[src/main/scala/peripheral/UART.scala 162:14]
  input         io_rxd, // @[src/main/scala/peripheral/UART.scala 162:14]
  output        io_txd, // @[src/main/scala/peripheral/UART.scala 162:14]
  output        io_signal_interrupt // @[src/main/scala/peripheral/UART.scala 162:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  tx_clock; // @[src/main/scala/peripheral/UART.scala 172:18]
  wire  tx_reset; // @[src/main/scala/peripheral/UART.scala 172:18]
  wire  tx_io_txd; // @[src/main/scala/peripheral/UART.scala 172:18]
  wire  tx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 172:18]
  wire [7:0] tx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 172:18]
  wire  rx_clock; // @[src/main/scala/peripheral/UART.scala 173:18]
  wire  rx_reset; // @[src/main/scala/peripheral/UART.scala 173:18]
  wire  rx_io_rxd; // @[src/main/scala/peripheral/UART.scala 173:18]
  wire  rx_io_channel_ready; // @[src/main/scala/peripheral/UART.scala 173:18]
  wire  rx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 173:18]
  wire [7:0] rx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 173:18]
  reg  interrupt; // @[src/main/scala/peripheral/UART.scala 169:26]
  reg [7:0] rxData; // @[src/main/scala/peripheral/UART.scala 170:23]
  wire [7:0] _GEN_0 = io_bundle_address == 32'hc ? rxData : 8'h0; // @[src/main/scala/peripheral/UART.scala 175:23 178:43 179:25]
  wire  _GEN_1 = io_bundle_address == 32'hc ? 1'h0 : interrupt; // @[src/main/scala/peripheral/UART.scala 178:43 180:15 169:26]
  wire [16:0] _GEN_2 = io_bundle_address == 32'h4 ? 17'h1c200 : {{9'd0}, _GEN_0}; // @[src/main/scala/peripheral/UART.scala 176:37 177:25]
  wire  _GEN_3 = io_bundle_address == 32'h4 ? interrupt : _GEN_1; // @[src/main/scala/peripheral/UART.scala 169:26 176:37]
  wire  _T_3 = io_bundle_address == 32'h10; // @[src/main/scala/peripheral/UART.scala 188:34]
  wire [31:0] _GEN_5 = io_bundle_address == 32'h10 ? io_bundle_write_data : 32'h0; // @[src/main/scala/peripheral/UART.scala 184:22 188:46 190:26]
  wire  _GEN_6 = io_bundle_address == 32'h8 ? io_bundle_write_data != 32'h0 : _GEN_3; // @[src/main/scala/peripheral/UART.scala 186:39 187:17]
  wire  _GEN_7 = io_bundle_address == 32'h8 ? 1'h0 : _T_3; // @[src/main/scala/peripheral/UART.scala 183:23 186:39]
  wire [31:0] _GEN_8 = io_bundle_address == 32'h8 ? 32'h0 : _GEN_5; // @[src/main/scala/peripheral/UART.scala 184:22 186:39]
  wire  _GEN_9 = io_bundle_write_enable ? _GEN_6 : _GEN_3; // @[src/main/scala/peripheral/UART.scala 185:32]
  wire [31:0] _GEN_11 = io_bundle_write_enable ? _GEN_8 : 32'h0; // @[src/main/scala/peripheral/UART.scala 184:22 185:32]
  wire  _GEN_14 = rx_io_channel_valid | _GEN_9; // @[src/main/scala/peripheral/UART.scala 199:29 202:15]
  BufferedTx tx ( // @[src/main/scala/peripheral/UART.scala 172:18]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  Rx rx ( // @[src/main/scala/peripheral/UART.scala 173:18]
    .clock(rx_clock),
    .reset(rx_reset),
    .io_rxd(rx_io_rxd),
    .io_channel_ready(rx_io_channel_ready),
    .io_channel_valid(rx_io_channel_valid),
    .io_channel_bits(rx_io_channel_bits)
  );
  assign io_bundle_read_data = {{15'd0}, _GEN_2};
  assign io_txd = tx_io_txd; // @[src/main/scala/peripheral/UART.scala 194:10]
  assign io_signal_interrupt = interrupt; // @[src/main/scala/peripheral/UART.scala 197:23]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = io_bundle_write_enable & _GEN_7; // @[src/main/scala/peripheral/UART.scala 183:23 185:32]
  assign tx_io_channel_bits = _GEN_11[7:0];
  assign rx_clock = clock;
  assign rx_reset = reset;
  assign rx_io_rxd = io_rxd; // @[src/main/scala/peripheral/UART.scala 195:13]
  assign rx_io_channel_ready = rx_io_channel_valid; // @[src/main/scala/peripheral/UART.scala 198:23 199:29 200:25]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 169:26]
      interrupt <= 1'h0; // @[src/main/scala/peripheral/UART.scala 169:26]
    end else begin
      interrupt <= _GEN_14;
    end
    if (reset) begin // @[src/main/scala/peripheral/UART.scala 170:23]
      rxData <= 8'h0; // @[src/main/scala/peripheral/UART.scala 170:23]
    end else if (rx_io_channel_valid) begin // @[src/main/scala/peripheral/UART.scala 199:29]
      rxData <= rx_io_channel_bits; // @[src/main/scala/peripheral/UART.scala 201:12]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  interrupt = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rxData = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module InstructionROM(
  input         clock,
  input  [31:0] io_address, // @[src/main/scala/peripheral/InstructionROM.scala 28:14]
  output [31:0] io_data // @[src/main/scala/peripheral/InstructionROM.scala 28:14]
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] mem [0:1049]; // @[src/main/scala/peripheral/InstructionROM.scala 34:16]
  wire  mem_io_data_MPORT_en; // @[src/main/scala/peripheral/InstructionROM.scala 34:16]
  wire [10:0] mem_io_data_MPORT_addr; // @[src/main/scala/peripheral/InstructionROM.scala 34:16]
  wire [31:0] mem_io_data_MPORT_data; // @[src/main/scala/peripheral/InstructionROM.scala 34:16]
  assign mem_io_data_MPORT_en = 1'h1;
  assign mem_io_data_MPORT_addr = io_address[10:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_io_data_MPORT_data = mem[mem_io_data_MPORT_addr]; // @[src/main/scala/peripheral/InstructionROM.scala 34:16]
  `else
  assign mem_io_data_MPORT_data = mem_io_data_MPORT_addr >= 11'h41a ? _RAND_0[31:0] : mem[mem_io_data_MPORT_addr]; // @[src/main/scala/peripheral/InstructionROM.scala 34:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign io_data = mem_io_data_MPORT_data; // @[src/main/scala/peripheral/InstructionROM.scala 40:11]
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
  integer initvar;
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_0 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
initial begin
  $readmemh("/workspaces/2023-fall-yatcpu-repo/lab3/verilog/say_goodbye.asmbin.txt", mem);
end
endmodule
module ROMLoader(
  input         clock,
  input         reset,
  output [31:0] io_bundle_address, // @[src/main/scala/peripheral/ROMLoader.scala 21:14]
  output [31:0] io_bundle_write_data, // @[src/main/scala/peripheral/ROMLoader.scala 21:14]
  output        io_bundle_write_enable, // @[src/main/scala/peripheral/ROMLoader.scala 21:14]
  output        io_bundle_write_strobe_0, // @[src/main/scala/peripheral/ROMLoader.scala 21:14]
  output        io_bundle_write_strobe_1, // @[src/main/scala/peripheral/ROMLoader.scala 21:14]
  output        io_bundle_write_strobe_2, // @[src/main/scala/peripheral/ROMLoader.scala 21:14]
  output        io_bundle_write_strobe_3, // @[src/main/scala/peripheral/ROMLoader.scala 21:14]
  output [31:0] io_rom_address, // @[src/main/scala/peripheral/ROMLoader.scala 21:14]
  input  [31:0] io_rom_data, // @[src/main/scala/peripheral/ROMLoader.scala 21:14]
  output        io_load_finished // @[src/main/scala/peripheral/ROMLoader.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] address; // @[src/main/scala/peripheral/ROMLoader.scala 31:24]
  reg  valid; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
  wire [33:0] _GEN_10 = {address, 2'h0}; // @[src/main/scala/peripheral/ROMLoader.scala 41:35]
  wire [34:0] _io_bundle_address_T = {{1'd0}, _GEN_10}; // @[src/main/scala/peripheral/ROMLoader.scala 41:35]
  wire [34:0] _io_bundle_address_T_2 = _io_bundle_address_T + 35'h1000; // @[src/main/scala/peripheral/ROMLoader.scala 41:50]
  wire [31:0] _address_T_1 = address + 32'h1; // @[src/main/scala/peripheral/ROMLoader.scala 43:24]
  wire  _GEN_0 = address == 32'h419 | valid; // @[src/main/scala/peripheral/ROMLoader.scala 44:40 45:13 32:22]
  wire [34:0] _GEN_3 = address <= 32'h419 ? _io_bundle_address_T_2 : 35'h0; // @[src/main/scala/peripheral/ROMLoader.scala 35:21 38:37 41:23]
  assign io_bundle_address = _GEN_3[31:0];
  assign io_bundle_write_data = address <= 32'h419 ? io_rom_data : 32'h0; // @[src/main/scala/peripheral/ROMLoader.scala 36:24 38:37 40:26]
  assign io_bundle_write_enable = address <= 32'h419; // @[src/main/scala/peripheral/ROMLoader.scala 38:16]
  assign io_bundle_write_strobe_0 = address <= 32'h419; // @[src/main/scala/peripheral/ROMLoader.scala 38:16]
  assign io_bundle_write_strobe_1 = address <= 32'h419; // @[src/main/scala/peripheral/ROMLoader.scala 38:16]
  assign io_bundle_write_strobe_2 = address <= 32'h419; // @[src/main/scala/peripheral/ROMLoader.scala 38:16]
  assign io_bundle_write_strobe_3 = address <= 32'h419; // @[src/main/scala/peripheral/ROMLoader.scala 38:16]
  assign io_rom_address = address; // @[src/main/scala/peripheral/ROMLoader.scala 49:18]
  assign io_load_finished = valid; // @[src/main/scala/peripheral/ROMLoader.scala 48:20]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/peripheral/ROMLoader.scala 31:24]
      address <= 32'h0; // @[src/main/scala/peripheral/ROMLoader.scala 31:24]
    end else if (address <= 32'h419) begin // @[src/main/scala/peripheral/ROMLoader.scala 38:37]
      address <= _address_T_1; // @[src/main/scala/peripheral/ROMLoader.scala 43:13]
    end
    if (reset) begin // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
      valid <= 1'h0; // @[src/main/scala/peripheral/ROMLoader.scala 32:22]
    end else if (address <= 32'h419) begin // @[src/main/scala/peripheral/ROMLoader.scala 38:37]
      valid <= _GEN_0;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  address = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  valid = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Control(
  input        io_jump_flag, // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
  input        io_jump_instruction_id, // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
  input  [4:0] io_rs1_id, // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
  input  [4:0] io_rs2_id, // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
  input        io_memory_read_enable_ex, // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
  input  [4:0] io_rd_ex, // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
  input        io_memory_read_enable_mem, // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
  input  [4:0] io_rd_mem, // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
  output       io_if_flush, // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
  output       io_id_flush, // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
  output       io_pc_stall, // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
  output       io_if_stall // @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]
);
  wire  _id_hazard_T_13 = io_jump_instruction_id & io_memory_read_enable_mem & io_rd_mem != 5'h0 & (io_rd_mem ==
    io_rs1_id | io_rd_mem == io_rs2_id); // @[src/main/scala/riscv/core/fivestage_final/Control.scala 39:78]
  wire  id_hazard = (io_memory_read_enable_ex | io_jump_instruction_id) & io_rd_ex != 5'h0 & (io_rd_ex == io_rs1_id |
    io_rd_ex == io_rs2_id) | _id_hazard_T_13; // @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:146]
  assign io_if_flush = io_jump_flag & ~id_hazard; // @[src/main/scala/riscv/core/fivestage_final/Control.scala 40:31]
  assign io_id_flush = (io_memory_read_enable_ex | io_jump_instruction_id) & io_rd_ex != 5'h0 & (io_rd_ex == io_rs1_id
     | io_rd_ex == io_rs2_id) | _id_hazard_T_13; // @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:146]
  assign io_pc_stall = (io_memory_read_enable_ex | io_jump_instruction_id) & io_rd_ex != 5'h0 & (io_rd_ex == io_rs1_id
     | io_rd_ex == io_rs2_id) | _id_hazard_T_13; // @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:146]
  assign io_if_stall = (io_memory_read_enable_ex | io_jump_instruction_id) & io_rd_ex != 5'h0 & (io_rd_ex == io_rs1_id
     | io_rd_ex == io_rs2_id) | _id_hazard_T_13; // @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:146]
endmodule
module RegisterFile(
  input         clock,
  input         reset,
  input         io_write_enable, // @[src/main/scala/riscv/core/RegisterFile.scala 33:14]
  input  [4:0]  io_write_address, // @[src/main/scala/riscv/core/RegisterFile.scala 33:14]
  input  [31:0] io_write_data, // @[src/main/scala/riscv/core/RegisterFile.scala 33:14]
  input  [4:0]  io_read_address1, // @[src/main/scala/riscv/core/RegisterFile.scala 33:14]
  input  [4:0]  io_read_address2, // @[src/main/scala/riscv/core/RegisterFile.scala 33:14]
  output [31:0] io_read_data1, // @[src/main/scala/riscv/core/RegisterFile.scala 33:14]
  output [31:0] io_read_data2 // @[src/main/scala/riscv/core/RegisterFile.scala 33:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] registers_0; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_1; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_2; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_3; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_4; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_5; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_6; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_7; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_8; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_9; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_10; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_11; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_12; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_13; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_14; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_15; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_16; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_17; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_18; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_19; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_20; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_21; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_22; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_23; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_24; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_25; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_26; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_27; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_28; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_29; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_30; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  reg [31:0] registers_31; // @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
  wire  _io_read_data1_T = io_read_address1 == 5'h0; // @[src/main/scala/riscv/core/RegisterFile.scala 57:25]
  wire  _io_read_data1_T_2 = io_read_address1 == io_write_address & io_write_enable; // @[src/main/scala/riscv/core/RegisterFile.scala 58:46]
  wire [31:0] _GEN_97 = 5'h1 == io_read_address1 ? registers_1 : registers_0; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_98 = 5'h2 == io_read_address1 ? registers_2 : _GEN_97; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_99 = 5'h3 == io_read_address1 ? registers_3 : _GEN_98; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_100 = 5'h4 == io_read_address1 ? registers_4 : _GEN_99; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_101 = 5'h5 == io_read_address1 ? registers_5 : _GEN_100; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_102 = 5'h6 == io_read_address1 ? registers_6 : _GEN_101; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_103 = 5'h7 == io_read_address1 ? registers_7 : _GEN_102; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_104 = 5'h8 == io_read_address1 ? registers_8 : _GEN_103; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_105 = 5'h9 == io_read_address1 ? registers_9 : _GEN_104; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_106 = 5'ha == io_read_address1 ? registers_10 : _GEN_105; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_107 = 5'hb == io_read_address1 ? registers_11 : _GEN_106; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_108 = 5'hc == io_read_address1 ? registers_12 : _GEN_107; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_109 = 5'hd == io_read_address1 ? registers_13 : _GEN_108; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_110 = 5'he == io_read_address1 ? registers_14 : _GEN_109; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_111 = 5'hf == io_read_address1 ? registers_15 : _GEN_110; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_112 = 5'h10 == io_read_address1 ? registers_16 : _GEN_111; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_113 = 5'h11 == io_read_address1 ? registers_17 : _GEN_112; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_114 = 5'h12 == io_read_address1 ? registers_18 : _GEN_113; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_115 = 5'h13 == io_read_address1 ? registers_19 : _GEN_114; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_116 = 5'h14 == io_read_address1 ? registers_20 : _GEN_115; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_117 = 5'h15 == io_read_address1 ? registers_21 : _GEN_116; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_118 = 5'h16 == io_read_address1 ? registers_22 : _GEN_117; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_119 = 5'h17 == io_read_address1 ? registers_23 : _GEN_118; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_120 = 5'h18 == io_read_address1 ? registers_24 : _GEN_119; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_121 = 5'h19 == io_read_address1 ? registers_25 : _GEN_120; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_122 = 5'h1a == io_read_address1 ? registers_26 : _GEN_121; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_123 = 5'h1b == io_read_address1 ? registers_27 : _GEN_122; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_124 = 5'h1c == io_read_address1 ? registers_28 : _GEN_123; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_125 = 5'h1d == io_read_address1 ? registers_29 : _GEN_124; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_126 = 5'h1e == io_read_address1 ? registers_30 : _GEN_125; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_127 = 5'h1f == io_read_address1 ? registers_31 : _GEN_126; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _io_read_data1_T_3 = _io_read_data1_T_2 ? io_write_data : _GEN_127; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  wire  _io_read_data2_T = io_read_address2 == 5'h0; // @[src/main/scala/riscv/core/RegisterFile.scala 65:25]
  wire  _io_read_data2_T_2 = io_read_address2 == io_write_address & io_write_enable; // @[src/main/scala/riscv/core/RegisterFile.scala 66:46]
  wire [31:0] _GEN_129 = 5'h1 == io_read_address2 ? registers_1 : registers_0; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_130 = 5'h2 == io_read_address2 ? registers_2 : _GEN_129; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_131 = 5'h3 == io_read_address2 ? registers_3 : _GEN_130; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_132 = 5'h4 == io_read_address2 ? registers_4 : _GEN_131; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_133 = 5'h5 == io_read_address2 ? registers_5 : _GEN_132; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_134 = 5'h6 == io_read_address2 ? registers_6 : _GEN_133; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_135 = 5'h7 == io_read_address2 ? registers_7 : _GEN_134; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_136 = 5'h8 == io_read_address2 ? registers_8 : _GEN_135; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_137 = 5'h9 == io_read_address2 ? registers_9 : _GEN_136; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_138 = 5'ha == io_read_address2 ? registers_10 : _GEN_137; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_139 = 5'hb == io_read_address2 ? registers_11 : _GEN_138; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_140 = 5'hc == io_read_address2 ? registers_12 : _GEN_139; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_141 = 5'hd == io_read_address2 ? registers_13 : _GEN_140; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_142 = 5'he == io_read_address2 ? registers_14 : _GEN_141; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_143 = 5'hf == io_read_address2 ? registers_15 : _GEN_142; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_144 = 5'h10 == io_read_address2 ? registers_16 : _GEN_143; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_145 = 5'h11 == io_read_address2 ? registers_17 : _GEN_144; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_146 = 5'h12 == io_read_address2 ? registers_18 : _GEN_145; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_147 = 5'h13 == io_read_address2 ? registers_19 : _GEN_146; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_148 = 5'h14 == io_read_address2 ? registers_20 : _GEN_147; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_149 = 5'h15 == io_read_address2 ? registers_21 : _GEN_148; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_150 = 5'h16 == io_read_address2 ? registers_22 : _GEN_149; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_151 = 5'h17 == io_read_address2 ? registers_23 : _GEN_150; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_152 = 5'h18 == io_read_address2 ? registers_24 : _GEN_151; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_153 = 5'h19 == io_read_address2 ? registers_25 : _GEN_152; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_154 = 5'h1a == io_read_address2 ? registers_26 : _GEN_153; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_155 = 5'h1b == io_read_address2 ? registers_27 : _GEN_154; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_156 = 5'h1c == io_read_address2 ? registers_28 : _GEN_155; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_157 = 5'h1d == io_read_address2 ? registers_29 : _GEN_156; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_158 = 5'h1e == io_read_address2 ? registers_30 : _GEN_157; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _GEN_159 = 5'h1f == io_read_address2 ? registers_31 : _GEN_158; // @[src/main/scala/chisel3/util/Mux.scala 141:{16,16}]
  wire [31:0] _io_read_data2_T_3 = _io_read_data2_T_2 ? io_write_data : _GEN_159; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_read_data1 = _io_read_data1_T ? 32'h0 : _io_read_data1_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  assign io_read_data2 = _io_read_data2_T ? 32'h0 : _io_read_data2_T_3; // @[src/main/scala/chisel3/util/Mux.scala 141:16]
  always @(posedge clock) begin
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h0 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_0 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h1 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_1 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h2 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_2 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h3 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_3 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h4 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_4 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h5 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_5 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h6 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_6 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h7 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_7 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h8 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_8 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h9 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_9 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'ha == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_10 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'hb == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_11 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'hc == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_12 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'hd == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_13 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'he == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_14 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'hf == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_15 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h10 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_16 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h11 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_17 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h12 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_18 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h13 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_19 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h14 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_20 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h15 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_21 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h16 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_22 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h17 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_23 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h18 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_24 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h19 == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_25 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h1a == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_26 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h1b == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_27 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h1c == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_28 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h1d == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_29 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h1e == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_30 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
    if (~reset) begin // @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      if (io_write_enable & io_write_address != 5'h0) begin // @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        if (5'h1f == io_write_address) begin // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
          registers_31 <= io_write_data; // @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  registers_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  registers_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  registers_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  registers_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  registers_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  registers_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  registers_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  registers_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  registers_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  registers_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  registers_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  registers_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  registers_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  registers_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  registers_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  registers_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  registers_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  registers_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  registers_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  registers_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  registers_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  registers_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  registers_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  registers_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  registers_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  registers_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  registers_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  registers_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  registers_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  registers_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  registers_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  registers_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module InstructionFetch(
  input         clock,
  input         reset,
  input         io_stall_flag_ctrl, // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 26:14]
  input         io_jump_flag_id, // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 26:14]
  input  [31:0] io_jump_address_id, // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 26:14]
  input  [31:0] io_rom_instruction, // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 26:14]
  input         io_instruction_valid, // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 26:14]
  output [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 26:14]
  output [31:0] io_id_instruction // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 26:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pc; // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 36:19]
  wire [31:0] _pc_T_1 = pc + 32'h4; // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 39:8]
  wire  _pc_T_3 = io_jump_flag_id & ~io_stall_flag_ctrl; // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 41:24]
  wire  _pc_T_5 = io_stall_flag_ctrl | ~io_instruction_valid; // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 42:27]
  assign io_instruction_address = pc; // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 46:26]
  assign io_id_instruction = io_instruction_valid ? io_rom_instruction : 32'h13; // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 47:27]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 36:19]
      pc <= 32'h1000; // @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 36:19]
    end else if (_pc_T_3) begin // @[src/main/scala/chisel3/util/Mux.scala 141:16]
      pc <= io_jump_address_id;
    end else if (!(_pc_T_5)) begin // @[src/main/scala/chisel3/util/Mux.scala 141:16]
      pc <= _pc_T_1;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  input         io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  input  [31:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  output [31:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
      reg_ <= 32'h13; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg_ <= 32'h13; // @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    end else if (~io_stall) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
      reg_ <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_1(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  input         io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  input  [31:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  output [31:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
      reg_ <= 32'h1000; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg_ <= 32'h1000; // @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    end else if (~io_stall) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
      reg_ <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_2(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  input         io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  input  [31:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  output [31:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
      reg_ <= 32'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg_ <= 32'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    end else if (~io_stall) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
      reg_ <= io_in; // @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IF2ID(
  input         clock,
  input         reset,
  input         io_stall, // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 22:14]
  input         io_flush, // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 22:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 22:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 22:14]
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 22:14]
  output [31:0] io_output_instruction, // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 22:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 22:14]
  output [31:0] io_output_interrupt_flag // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 22:14]
);
  wire  instruction_clock; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 34:27]
  wire  instruction_reset; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 34:27]
  wire  instruction_io_stall; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 34:27]
  wire  instruction_io_flush; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 34:27]
  wire [31:0] instruction_io_in; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 34:27]
  wire [31:0] instruction_io_out; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 34:27]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 40:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 40:35]
  wire  instruction_address_io_stall; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 40:35]
  wire  instruction_address_io_flush; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 40:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 40:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 40:35]
  wire  interrupt_flag_clock; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 46:30]
  wire  interrupt_flag_reset; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 46:30]
  wire  interrupt_flag_io_stall; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 46:30]
  wire  interrupt_flag_io_flush; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 46:30]
  wire [31:0] interrupt_flag_io_in; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 46:30]
  wire [31:0] interrupt_flag_io_out; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 46:30]
  PipelineRegister instruction ( // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 34:27]
    .clock(instruction_clock),
    .reset(instruction_reset),
    .io_stall(instruction_io_stall),
    .io_flush(instruction_io_flush),
    .io_in(instruction_io_in),
    .io_out(instruction_io_out)
  );
  PipelineRegister_1 instruction_address ( // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 40:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_stall(instruction_address_io_stall),
    .io_flush(instruction_address_io_flush),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_2 interrupt_flag ( // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 46:30]
    .clock(interrupt_flag_clock),
    .reset(interrupt_flag_reset),
    .io_stall(interrupt_flag_io_stall),
    .io_flush(interrupt_flag_io_flush),
    .io_in(interrupt_flag_io_in),
    .io_out(interrupt_flag_io_out)
  );
  assign io_output_instruction = instruction_io_out; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 38:25]
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 44:33]
  assign io_output_interrupt_flag = interrupt_flag_io_out; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 50:28]
  assign instruction_clock = clock;
  assign instruction_reset = reset;
  assign instruction_io_stall = io_stall; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 36:24]
  assign instruction_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 37:24]
  assign instruction_io_in = io_instruction; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 35:21]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_stall = io_stall; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 42:32]
  assign instruction_address_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 43:32]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 41:29]
  assign interrupt_flag_clock = clock;
  assign interrupt_flag_reset = reset;
  assign interrupt_flag_io_stall = io_stall; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 48:27]
  assign interrupt_flag_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 49:27]
  assign interrupt_flag_io_in = io_interrupt_flag; // @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 47:24]
endmodule
module InstructionDecode(
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  input  [31:0] io_reg1_data, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  input  [31:0] io_forward_from_mem, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  input  [31:0] io_forward_from_wb, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  input  [1:0]  io_reg1_forward, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  input  [1:0]  io_reg2_forward, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  input         io_interrupt_assert, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  input  [31:0] io_interrupt_handler_address, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output [4:0]  io_regs_reg1_read_address, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output [4:0]  io_regs_reg2_read_address, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output [31:0] io_ex_immediate, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output        io_ex_aluop1_source, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output        io_ex_aluop2_source, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output        io_ex_memory_read_enable, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output        io_ex_memory_write_enable, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output [1:0]  io_ex_reg_write_source, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output        io_ex_reg_write_enable, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output [4:0]  io_ex_reg_write_address, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output [11:0] io_ex_csr_address, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output        io_ex_csr_write_enable, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output        io_ctrl_jump_instruction, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output        io_clint_jump_flag, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output [31:0] io_clint_jump_address, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output        io_if_jump_flag, // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
  output [31:0] io_if_jump_address // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]
);
  wire [6:0] opcode = io_instruction[6:0]; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 166:30]
  wire [2:0] funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 167:30]
  wire [4:0] rd = io_instruction[11:7]; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 169:26]
  wire [4:0] rs1 = io_instruction[19:15]; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 170:27]
  wire  _io_regs_reg1_read_address_T = opcode == 7'h37; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 173:43]
  wire [19:0] _io_ex_immediate_T_2 = io_instruction[31] ? 20'hfffff : 20'h0; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 177:13]
  wire [31:0] _io_ex_immediate_T_4 = {_io_ex_immediate_T_2,io_instruction[31:20]}; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 177:8]
  wire [20:0] _io_ex_immediate_T_7 = io_instruction[31] ? 21'h1fffff : 21'h0; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 179:37]
  wire [31:0] _io_ex_immediate_T_9 = {_io_ex_immediate_T_7,io_instruction[30:20]}; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 179:32]
  wire [31:0] _io_ex_immediate_T_25 = {_io_ex_immediate_T_7,io_instruction[30:25],rd}; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 182:32]
  wire [31:0] _io_ex_immediate_T_32 = {_io_ex_immediate_T_2,io_instruction[7],io_instruction[30:25],io_instruction[11:8]
    ,1'h0}; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 183:32]
  wire [31:0] _io_ex_immediate_T_34 = {io_instruction[31:12],12'h0}; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 184:30]
  wire [11:0] _io_ex_immediate_T_39 = io_instruction[31] ? 12'hfff : 12'h0; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:35]
  wire [31:0] _io_ex_immediate_T_43 = {_io_ex_immediate_T_39,io_instruction[19:12],io_instruction[20],io_instruction[30:
    21],1'h0}; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:30]
  wire [31:0] _io_ex_immediate_T_45 = 7'h13 == opcode ? _io_ex_immediate_T_9 : _io_ex_immediate_T_4; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_ex_immediate_T_47 = 7'h3 == opcode ? _io_ex_immediate_T_9 : _io_ex_immediate_T_45; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_ex_immediate_T_49 = 7'h67 == opcode ? _io_ex_immediate_T_9 : _io_ex_immediate_T_47; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_ex_immediate_T_51 = 7'h23 == opcode ? _io_ex_immediate_T_25 : _io_ex_immediate_T_49; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_ex_immediate_T_53 = 7'h63 == opcode ? _io_ex_immediate_T_32 : _io_ex_immediate_T_51; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_ex_immediate_T_55 = 7'h37 == opcode ? _io_ex_immediate_T_34 : _io_ex_immediate_T_53; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_ex_immediate_T_57 = 7'h17 == opcode ? _io_ex_immediate_T_34 : _io_ex_immediate_T_55; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_ex_aluop1_source_T = opcode == 7'h17; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 190:12]
  wire  _io_ex_aluop1_source_T_1 = opcode == 7'h63; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 190:45]
  wire  _io_ex_aluop1_source_T_3 = opcode == 7'h6f; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 190:78]
  wire  _io_ex_aluop2_source_T = opcode == 7'h33; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 195:12]
  wire  _io_ex_memory_read_enable_T = opcode == 7'h3; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 199:38]
  wire [1:0] _io_ex_reg_write_source_T_1 = 7'h3 == opcode ? 2'h1 : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _io_ex_reg_write_source_T_3 = 7'h73 == opcode ? 2'h2 : _io_ex_reg_write_source_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _io_ex_reg_write_source_T_5 = 7'h6f == opcode ? 2'h3 : _io_ex_reg_write_source_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_ex_reg_write_enable_T_4 = _io_ex_aluop2_source_T | opcode == 7'h13 | _io_ex_memory_read_enable_T; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 211:97]
  wire  _io_ex_reg_write_enable_T_10 = _io_ex_reg_write_enable_T_4 | _io_ex_aluop1_source_T |
    _io_regs_reg1_read_address_T | _io_ex_aluop1_source_T_3; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 212:105]
  wire  _io_ex_reg_write_enable_T_11 = opcode == 7'h67; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 213:46]
  wire  _io_ex_reg_write_enable_T_13 = opcode == 7'h73; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 213:80]
  wire  _io_ex_csr_write_enable_T_4 = funct3 == 3'h2; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 218:14]
  wire  _io_ex_csr_write_enable_T_5 = funct3 == 3'h1 | funct3 == 3'h5 | _io_ex_csr_write_enable_T_4; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 217:83]
  wire  _io_ex_csr_write_enable_T_8 = funct3 == 3'h3; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 219:14]
  wire  _io_ex_csr_write_enable_T_9 = _io_ex_csr_write_enable_T_5 | funct3 == 3'h6 | _io_ex_csr_write_enable_T_8; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 218:85]
  wire  _io_ex_csr_write_enable_T_11 = _io_ex_csr_write_enable_T_9 | funct3 == 3'h7; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 219:44]
  wire [31:0] _reg1_data_T_1 = 2'h1 == io_reg1_forward ? io_forward_from_mem : io_reg1_data; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] reg1_data = 2'h2 == io_reg1_forward ? io_forward_from_wb : _reg1_data_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _reg2_data_T_1 = 2'h1 == io_reg2_forward ? io_forward_from_mem : io_reg2_data; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] reg2_data = 2'h2 == io_reg2_forward ? io_forward_from_wb : _reg2_data_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_ctrl_jump_instruction_T_2 = _io_ex_aluop1_source_T_3 | _io_ex_reg_write_enable_T_11; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 239:61]
  wire  _instruction_jump_flag_T_4 = reg1_data == reg2_data; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 247:45]
  wire  _instruction_jump_flag_T_5 = reg1_data != reg2_data; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 248:45]
  wire [31:0] _instruction_jump_flag_T_6 = 2'h2 == io_reg1_forward ? io_forward_from_wb : _reg1_data_T_1; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 249:45]
  wire [31:0] _instruction_jump_flag_T_7 = 2'h2 == io_reg2_forward ? io_forward_from_wb : _reg2_data_T_1; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 249:64]
  wire  _instruction_jump_flag_T_8 = $signed(_instruction_jump_flag_T_6) < $signed(_instruction_jump_flag_T_7); // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 249:52]
  wire  _instruction_jump_flag_T_11 = $signed(_instruction_jump_flag_T_6) >= $signed(_instruction_jump_flag_T_7); // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 250:52]
  wire  _instruction_jump_flag_T_12 = reg1_data < reg2_data; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 251:53]
  wire  _instruction_jump_flag_T_13 = reg1_data >= reg2_data; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 252:53]
  wire  _instruction_jump_flag_T_17 = 3'h1 == funct3 ? _instruction_jump_flag_T_5 : 3'h0 == funct3 &
    _instruction_jump_flag_T_4; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _instruction_jump_flag_T_19 = 3'h4 == funct3 ? _instruction_jump_flag_T_8 : _instruction_jump_flag_T_17; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _instruction_jump_flag_T_21 = 3'h5 == funct3 ? _instruction_jump_flag_T_11 : _instruction_jump_flag_T_19; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _instruction_jump_flag_T_23 = 3'h6 == funct3 ? _instruction_jump_flag_T_12 : _instruction_jump_flag_T_21; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _instruction_jump_flag_T_25 = 3'h7 == funct3 ? _instruction_jump_flag_T_13 : _instruction_jump_flag_T_23; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _instruction_jump_flag_T_26 = _io_ex_aluop1_source_T_1 & _instruction_jump_flag_T_25; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 243:37]
  wire  instruction_jump_flag = _io_ctrl_jump_instruction_T_2 | _instruction_jump_flag_T_26; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 242:36]
  wire [31:0] _instruction_jump_address_T_1 = _io_ex_reg_write_enable_T_11 ? reg1_data : io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 255:55]
  wire [31:0] instruction_jump_address = io_ex_immediate + _instruction_jump_address_T_1; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 255:50]
  assign io_regs_reg1_read_address = opcode == 7'h37 ? 5'h0 : rs1; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 173:35]
  assign io_regs_reg2_read_address = io_instruction[24:20]; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 171:27]
  assign io_ex_immediate = 7'h6f == opcode ? _io_ex_immediate_T_43 : _io_ex_immediate_T_57; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_ex_aluop1_source = opcode == 7'h17 | opcode == 7'h63 | opcode == 7'h6f; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 190:68]
  assign io_ex_aluop2_source = _io_ex_aluop2_source_T ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 194:29]
  assign io_ex_memory_read_enable = opcode == 7'h3; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 199:38]
  assign io_ex_memory_write_enable = opcode == 7'h23; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 200:39]
  assign io_ex_reg_write_source = 7'h67 == opcode ? 2'h3 : _io_ex_reg_write_source_T_5; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_ex_reg_write_enable = _io_ex_reg_write_enable_T_10 | opcode == 7'h67 | opcode == 7'h73; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 213:69]
  assign io_ex_reg_write_address = io_instruction[11:7]; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 214:44]
  assign io_ex_csr_address = io_instruction[31:20]; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 215:38]
  assign io_ex_csr_write_enable = _io_ex_reg_write_enable_T_13 & _io_ex_csr_write_enable_T_11; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 216:59]
  assign io_ctrl_jump_instruction = _io_ctrl_jump_instruction_T_2 | _io_ex_aluop1_source_T_1; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 240:36]
  assign io_clint_jump_flag = _io_ctrl_jump_instruction_T_2 | _instruction_jump_flag_T_26; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 242:36]
  assign io_clint_jump_address = io_ex_immediate + _instruction_jump_address_T_1; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 255:50]
  assign io_if_jump_flag = io_interrupt_assert | instruction_jump_flag; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 258:42]
  assign io_if_jump_address = io_interrupt_assert ? io_interrupt_handler_address : instruction_jump_address; // @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 259:28]
endmodule
module PipelineRegister_5(
  input        clock,
  input        reset,
  input        io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  input  [4:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  output [4:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
      reg_ <= 5'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg_ <= 5'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    end else begin
      reg_ <= io_in;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_7(
  input   clock,
  input   reset,
  input   io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  input   io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  output  io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
      reg_ <= 1'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg_ <= 1'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    end else begin
      reg_ <= io_in;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_9(
  input        clock,
  input        reset,
  input        io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  input  [1:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  output [1:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
      reg_ <= 2'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg_ <= 2'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    end else begin
      reg_ <= io_in;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineRegister_16(
  input         clock,
  input         reset,
  input         io_flush, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  input  [11:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  output [11:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
      reg_ <= 12'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    end else if (io_flush) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg_ <= 12'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    end else begin
      reg_ <= io_in;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ID2EX(
  input         clock,
  input         reset,
  input         io_flush, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input  [4:0]  io_regs_reg1_read_address, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input  [4:0]  io_regs_reg2_read_address, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input         io_regs_write_enable, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input  [4:0]  io_regs_write_address, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input  [31:0] io_reg1_data, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input  [31:0] io_immediate, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input         io_aluop1_source, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input         io_aluop2_source, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input         io_csr_write_enable, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input  [11:0] io_csr_address, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input         io_memory_read_enable, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input         io_memory_write_enable, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output [31:0] io_output_instruction, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output [4:0]  io_output_regs_reg1_read_address, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output [4:0]  io_output_regs_reg2_read_address, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output        io_output_regs_write_enable, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output [4:0]  io_output_regs_write_address, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output [1:0]  io_output_regs_write_source, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output [31:0] io_output_reg1_data, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output [31:0] io_output_reg2_data, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output [31:0] io_output_immediate, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output        io_output_aluop1_source, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output        io_output_aluop2_source, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output        io_output_csr_write_enable, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output [11:0] io_output_csr_address, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output        io_output_memory_read_enable, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output        io_output_memory_write_enable, // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
  output [31:0] io_output_csr_read_data // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]
);
  wire  instruction_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 62:27]
  wire  instruction_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 62:27]
  wire  instruction_io_stall; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 62:27]
  wire  instruction_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 62:27]
  wire [31:0] instruction_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 62:27]
  wire [31:0] instruction_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 62:27]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 68:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 68:35]
  wire  instruction_address_io_stall; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 68:35]
  wire  instruction_address_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 68:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 68:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 68:35]
  wire  regs_reg1_read_address_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 74:38]
  wire  regs_reg1_read_address_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 74:38]
  wire  regs_reg1_read_address_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 74:38]
  wire [4:0] regs_reg1_read_address_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 74:38]
  wire [4:0] regs_reg1_read_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 74:38]
  wire  regs_reg2_read_address_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 80:38]
  wire  regs_reg2_read_address_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 80:38]
  wire  regs_reg2_read_address_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 80:38]
  wire [4:0] regs_reg2_read_address_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 80:38]
  wire [4:0] regs_reg2_read_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 80:38]
  wire  regs_write_enable_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 86:33]
  wire  regs_write_enable_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 86:33]
  wire  regs_write_enable_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 86:33]
  wire  regs_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 86:33]
  wire  regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 86:33]
  wire  regs_write_address_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 92:34]
  wire  regs_write_address_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 92:34]
  wire  regs_write_address_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 92:34]
  wire [4:0] regs_write_address_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 92:34]
  wire [4:0] regs_write_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 92:34]
  wire  regs_write_source_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 98:33]
  wire  regs_write_source_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 98:33]
  wire  regs_write_source_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 98:33]
  wire [1:0] regs_write_source_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 98:33]
  wire [1:0] regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 98:33]
  wire  reg1_data_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 104:25]
  wire  reg1_data_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 104:25]
  wire  reg1_data_io_stall; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 104:25]
  wire  reg1_data_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 104:25]
  wire [31:0] reg1_data_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 104:25]
  wire [31:0] reg1_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 104:25]
  wire  reg2_data_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 110:25]
  wire  reg2_data_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 110:25]
  wire  reg2_data_io_stall; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 110:25]
  wire  reg2_data_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 110:25]
  wire [31:0] reg2_data_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 110:25]
  wire [31:0] reg2_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 110:25]
  wire  immediate_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 116:25]
  wire  immediate_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 116:25]
  wire  immediate_io_stall; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 116:25]
  wire  immediate_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 116:25]
  wire [31:0] immediate_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 116:25]
  wire [31:0] immediate_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 116:25]
  wire  aluop1_source_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 122:29]
  wire  aluop1_source_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 122:29]
  wire  aluop1_source_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 122:29]
  wire  aluop1_source_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 122:29]
  wire  aluop1_source_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 122:29]
  wire  aluop2_source_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 128:29]
  wire  aluop2_source_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 128:29]
  wire  aluop2_source_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 128:29]
  wire  aluop2_source_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 128:29]
  wire  aluop2_source_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 128:29]
  wire  csr_write_enable_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 134:32]
  wire  csr_write_enable_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 134:32]
  wire  csr_write_enable_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 134:32]
  wire  csr_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 134:32]
  wire  csr_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 134:32]
  wire  csr_address_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 140:27]
  wire  csr_address_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 140:27]
  wire  csr_address_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 140:27]
  wire [11:0] csr_address_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 140:27]
  wire [11:0] csr_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 140:27]
  wire  memory_read_enable_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 146:34]
  wire  memory_read_enable_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 146:34]
  wire  memory_read_enable_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 146:34]
  wire  memory_read_enable_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 146:34]
  wire  memory_read_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 146:34]
  wire  memory_write_enable_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 152:35]
  wire  memory_write_enable_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 152:35]
  wire  memory_write_enable_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 152:35]
  wire  memory_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 152:35]
  wire  memory_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 152:35]
  wire  csr_read_data_clock; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 158:29]
  wire  csr_read_data_reset; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 158:29]
  wire  csr_read_data_io_stall; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 158:29]
  wire  csr_read_data_io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 158:29]
  wire [31:0] csr_read_data_io_in; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 158:29]
  wire [31:0] csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 158:29]
  PipelineRegister instruction ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 62:27]
    .clock(instruction_clock),
    .reset(instruction_reset),
    .io_stall(instruction_io_stall),
    .io_flush(instruction_io_flush),
    .io_in(instruction_io_in),
    .io_out(instruction_io_out)
  );
  PipelineRegister_1 instruction_address ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 68:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_stall(instruction_address_io_stall),
    .io_flush(instruction_address_io_flush),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_5 regs_reg1_read_address ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 74:38]
    .clock(regs_reg1_read_address_clock),
    .reset(regs_reg1_read_address_reset),
    .io_flush(regs_reg1_read_address_io_flush),
    .io_in(regs_reg1_read_address_io_in),
    .io_out(regs_reg1_read_address_io_out)
  );
  PipelineRegister_5 regs_reg2_read_address ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 80:38]
    .clock(regs_reg2_read_address_clock),
    .reset(regs_reg2_read_address_reset),
    .io_flush(regs_reg2_read_address_io_flush),
    .io_in(regs_reg2_read_address_io_in),
    .io_out(regs_reg2_read_address_io_out)
  );
  PipelineRegister_7 regs_write_enable ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 86:33]
    .clock(regs_write_enable_clock),
    .reset(regs_write_enable_reset),
    .io_flush(regs_write_enable_io_flush),
    .io_in(regs_write_enable_io_in),
    .io_out(regs_write_enable_io_out)
  );
  PipelineRegister_5 regs_write_address ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 92:34]
    .clock(regs_write_address_clock),
    .reset(regs_write_address_reset),
    .io_flush(regs_write_address_io_flush),
    .io_in(regs_write_address_io_in),
    .io_out(regs_write_address_io_out)
  );
  PipelineRegister_9 regs_write_source ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 98:33]
    .clock(regs_write_source_clock),
    .reset(regs_write_source_reset),
    .io_flush(regs_write_source_io_flush),
    .io_in(regs_write_source_io_in),
    .io_out(regs_write_source_io_out)
  );
  PipelineRegister_2 reg1_data ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 104:25]
    .clock(reg1_data_clock),
    .reset(reg1_data_reset),
    .io_stall(reg1_data_io_stall),
    .io_flush(reg1_data_io_flush),
    .io_in(reg1_data_io_in),
    .io_out(reg1_data_io_out)
  );
  PipelineRegister_2 reg2_data ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 110:25]
    .clock(reg2_data_clock),
    .reset(reg2_data_reset),
    .io_stall(reg2_data_io_stall),
    .io_flush(reg2_data_io_flush),
    .io_in(reg2_data_io_in),
    .io_out(reg2_data_io_out)
  );
  PipelineRegister_2 immediate ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 116:25]
    .clock(immediate_clock),
    .reset(immediate_reset),
    .io_stall(immediate_io_stall),
    .io_flush(immediate_io_flush),
    .io_in(immediate_io_in),
    .io_out(immediate_io_out)
  );
  PipelineRegister_7 aluop1_source ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 122:29]
    .clock(aluop1_source_clock),
    .reset(aluop1_source_reset),
    .io_flush(aluop1_source_io_flush),
    .io_in(aluop1_source_io_in),
    .io_out(aluop1_source_io_out)
  );
  PipelineRegister_7 aluop2_source ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 128:29]
    .clock(aluop2_source_clock),
    .reset(aluop2_source_reset),
    .io_flush(aluop2_source_io_flush),
    .io_in(aluop2_source_io_in),
    .io_out(aluop2_source_io_out)
  );
  PipelineRegister_7 csr_write_enable ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 134:32]
    .clock(csr_write_enable_clock),
    .reset(csr_write_enable_reset),
    .io_flush(csr_write_enable_io_flush),
    .io_in(csr_write_enable_io_in),
    .io_out(csr_write_enable_io_out)
  );
  PipelineRegister_16 csr_address ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 140:27]
    .clock(csr_address_clock),
    .reset(csr_address_reset),
    .io_flush(csr_address_io_flush),
    .io_in(csr_address_io_in),
    .io_out(csr_address_io_out)
  );
  PipelineRegister_7 memory_read_enable ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 146:34]
    .clock(memory_read_enable_clock),
    .reset(memory_read_enable_reset),
    .io_flush(memory_read_enable_io_flush),
    .io_in(memory_read_enable_io_in),
    .io_out(memory_read_enable_io_out)
  );
  PipelineRegister_7 memory_write_enable ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 152:35]
    .clock(memory_write_enable_clock),
    .reset(memory_write_enable_reset),
    .io_flush(memory_write_enable_io_flush),
    .io_in(memory_write_enable_io_in),
    .io_out(memory_write_enable_io_out)
  );
  PipelineRegister_2 csr_read_data ( // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 158:29]
    .clock(csr_read_data_clock),
    .reset(csr_read_data_reset),
    .io_stall(csr_read_data_io_stall),
    .io_flush(csr_read_data_io_flush),
    .io_in(csr_read_data_io_in),
    .io_out(csr_read_data_io_out)
  );
  assign io_output_instruction = instruction_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 66:25]
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 72:33]
  assign io_output_regs_reg1_read_address = regs_reg1_read_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 78:36]
  assign io_output_regs_reg2_read_address = regs_reg2_read_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 84:36]
  assign io_output_regs_write_enable = regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 90:31]
  assign io_output_regs_write_address = regs_write_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 96:32]
  assign io_output_regs_write_source = regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 102:31]
  assign io_output_reg1_data = reg1_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 108:23]
  assign io_output_reg2_data = reg2_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 114:23]
  assign io_output_immediate = immediate_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 120:23]
  assign io_output_aluop1_source = aluop1_source_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 126:27]
  assign io_output_aluop2_source = aluop2_source_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 132:27]
  assign io_output_csr_write_enable = csr_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 138:30]
  assign io_output_csr_address = csr_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 144:25]
  assign io_output_memory_read_enable = memory_read_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 150:32]
  assign io_output_memory_write_enable = memory_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 156:33]
  assign io_output_csr_read_data = csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 162:27]
  assign instruction_clock = clock;
  assign instruction_reset = reset;
  assign instruction_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 64:24]
  assign instruction_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 65:24]
  assign instruction_io_in = io_instruction; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 63:21]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 70:32]
  assign instruction_address_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 71:32]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 69:29]
  assign regs_reg1_read_address_clock = clock;
  assign regs_reg1_read_address_reset = reset;
  assign regs_reg1_read_address_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 77:35]
  assign regs_reg1_read_address_io_in = io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 75:32]
  assign regs_reg2_read_address_clock = clock;
  assign regs_reg2_read_address_reset = reset;
  assign regs_reg2_read_address_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 83:35]
  assign regs_reg2_read_address_io_in = io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 81:32]
  assign regs_write_enable_clock = clock;
  assign regs_write_enable_reset = reset;
  assign regs_write_enable_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 89:30]
  assign regs_write_enable_io_in = io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 87:27]
  assign regs_write_address_clock = clock;
  assign regs_write_address_reset = reset;
  assign regs_write_address_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 95:31]
  assign regs_write_address_io_in = io_regs_write_address; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 93:28]
  assign regs_write_source_clock = clock;
  assign regs_write_source_reset = reset;
  assign regs_write_source_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 101:30]
  assign regs_write_source_io_in = io_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 99:27]
  assign reg1_data_clock = clock;
  assign reg1_data_reset = reset;
  assign reg1_data_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 106:22]
  assign reg1_data_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 107:22]
  assign reg1_data_io_in = io_reg1_data; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 105:19]
  assign reg2_data_clock = clock;
  assign reg2_data_reset = reset;
  assign reg2_data_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 112:22]
  assign reg2_data_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 113:22]
  assign reg2_data_io_in = io_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 111:19]
  assign immediate_clock = clock;
  assign immediate_reset = reset;
  assign immediate_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 118:22]
  assign immediate_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 119:22]
  assign immediate_io_in = io_immediate; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 117:19]
  assign aluop1_source_clock = clock;
  assign aluop1_source_reset = reset;
  assign aluop1_source_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 125:26]
  assign aluop1_source_io_in = io_aluop1_source; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 123:23]
  assign aluop2_source_clock = clock;
  assign aluop2_source_reset = reset;
  assign aluop2_source_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 131:26]
  assign aluop2_source_io_in = io_aluop2_source; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 129:23]
  assign csr_write_enable_clock = clock;
  assign csr_write_enable_reset = reset;
  assign csr_write_enable_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 137:29]
  assign csr_write_enable_io_in = io_csr_write_enable; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 135:26]
  assign csr_address_clock = clock;
  assign csr_address_reset = reset;
  assign csr_address_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 143:24]
  assign csr_address_io_in = io_csr_address; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 141:21]
  assign memory_read_enable_clock = clock;
  assign memory_read_enable_reset = reset;
  assign memory_read_enable_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 149:31]
  assign memory_read_enable_io_in = io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 147:28]
  assign memory_write_enable_clock = clock;
  assign memory_write_enable_reset = reset;
  assign memory_write_enable_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 155:32]
  assign memory_write_enable_io_in = io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 153:29]
  assign csr_read_data_clock = clock;
  assign csr_read_data_reset = reset;
  assign csr_read_data_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 160:26]
  assign csr_read_data_io_flush = io_flush; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 161:26]
  assign csr_read_data_io_in = io_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 159:23]
endmodule
module ALU(
  input  [3:0]  io_func, // @[src/main/scala/riscv/core/ALU.scala 27:14]
  input  [31:0] io_op1, // @[src/main/scala/riscv/core/ALU.scala 27:14]
  input  [31:0] io_op2, // @[src/main/scala/riscv/core/ALU.scala 27:14]
  output [31:0] io_result // @[src/main/scala/riscv/core/ALU.scala 27:14]
);
  wire [31:0] _io_result_T_1 = io_op1 + io_op2; // @[src/main/scala/riscv/core/ALU.scala 39:27]
  wire [31:0] _io_result_T_3 = io_op1 - io_op2; // @[src/main/scala/riscv/core/ALU.scala 42:27]
  wire [62:0] _GEN_10 = {{31'd0}, io_op1}; // @[src/main/scala/riscv/core/ALU.scala 45:27]
  wire [62:0] _io_result_T_5 = _GEN_10 << io_op2[4:0]; // @[src/main/scala/riscv/core/ALU.scala 45:27]
  wire [31:0] _io_result_T_6 = io_op1; // @[src/main/scala/riscv/core/ALU.scala 48:27]
  wire [31:0] _io_result_T_7 = io_op2; // @[src/main/scala/riscv/core/ALU.scala 48:43]
  wire [31:0] _io_result_T_9 = io_op1 ^ io_op2; // @[src/main/scala/riscv/core/ALU.scala 51:27]
  wire [31:0] _io_result_T_10 = io_op1 | io_op2; // @[src/main/scala/riscv/core/ALU.scala 54:27]
  wire [31:0] _io_result_T_11 = io_op1 & io_op2; // @[src/main/scala/riscv/core/ALU.scala 57:27]
  wire [31:0] _io_result_T_13 = io_op1 >> io_op2[4:0]; // @[src/main/scala/riscv/core/ALU.scala 60:27]
  wire [31:0] _io_result_T_17 = $signed(io_op1) >>> io_op2[4:0]; // @[src/main/scala/riscv/core/ALU.scala 63:52]
  wire  _GEN_0 = 4'ha == io_func & io_op1 < io_op2; // @[src/main/scala/riscv/core/ALU.scala 36:13 37:19 66:17]
  wire [31:0] _GEN_1 = 4'h9 == io_func ? _io_result_T_17 : {{31'd0}, _GEN_0}; // @[src/main/scala/riscv/core/ALU.scala 37:19 63:17]
  wire [31:0] _GEN_2 = 4'h8 == io_func ? _io_result_T_13 : _GEN_1; // @[src/main/scala/riscv/core/ALU.scala 37:19 60:17]
  wire [31:0] _GEN_3 = 4'h7 == io_func ? _io_result_T_11 : _GEN_2; // @[src/main/scala/riscv/core/ALU.scala 37:19 57:17]
  wire [31:0] _GEN_4 = 4'h6 == io_func ? _io_result_T_10 : _GEN_3; // @[src/main/scala/riscv/core/ALU.scala 37:19 54:17]
  wire [31:0] _GEN_5 = 4'h5 == io_func ? _io_result_T_9 : _GEN_4; // @[src/main/scala/riscv/core/ALU.scala 37:19 51:17]
  wire [31:0] _GEN_6 = 4'h4 == io_func ? {{31'd0}, $signed(_io_result_T_6) < $signed(_io_result_T_7)} : _GEN_5; // @[src/main/scala/riscv/core/ALU.scala 37:19 48:17]
  wire [62:0] _GEN_7 = 4'h3 == io_func ? _io_result_T_5 : {{31'd0}, _GEN_6}; // @[src/main/scala/riscv/core/ALU.scala 37:19 45:17]
  wire [62:0] _GEN_8 = 4'h2 == io_func ? {{31'd0}, _io_result_T_3} : _GEN_7; // @[src/main/scala/riscv/core/ALU.scala 37:19 42:17]
  wire [62:0] _GEN_9 = 4'h1 == io_func ? {{31'd0}, _io_result_T_1} : _GEN_8; // @[src/main/scala/riscv/core/ALU.scala 37:19 39:17]
  assign io_result = _GEN_9[31:0];
endmodule
module ALUControl(
  input  [6:0] io_opcode, // @[src/main/scala/riscv/core/ALUControl.scala 22:14]
  input  [2:0] io_funct3, // @[src/main/scala/riscv/core/ALUControl.scala 22:14]
  input  [6:0] io_funct7, // @[src/main/scala/riscv/core/ALUControl.scala 22:14]
  output [3:0] io_alu_funct // @[src/main/scala/riscv/core/ALUControl.scala 22:14]
);
  wire [3:0] _io_alu_funct_T_1 = io_funct7[5] ? 4'h9 : 4'h8; // @[src/main/scala/riscv/core/ALUControl.scala 45:39]
  wire [1:0] _io_alu_funct_T_3 = 3'h1 == io_funct3 ? 2'h3 : 2'h1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [2:0] _io_alu_funct_T_5 = 3'h2 == io_funct3 ? 3'h4 : {{1'd0}, _io_alu_funct_T_3}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_7 = 3'h3 == io_funct3 ? 4'ha : {{1'd0}, _io_alu_funct_T_5}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_9 = 3'h4 == io_funct3 ? 4'h5 : _io_alu_funct_T_7; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_11 = 3'h6 == io_funct3 ? 4'h6 : _io_alu_funct_T_9; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_13 = 3'h7 == io_funct3 ? 4'h7 : _io_alu_funct_T_11; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_15 = 3'h5 == io_funct3 ? _io_alu_funct_T_1 : _io_alu_funct_T_13; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _io_alu_funct_T_17 = io_funct7[5] ? 2'h2 : 2'h1; // @[src/main/scala/riscv/core/ALUControl.scala 54:43]
  wire [1:0] _io_alu_funct_T_21 = 3'h1 == io_funct3 ? 2'h3 : _io_alu_funct_T_17; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [2:0] _io_alu_funct_T_23 = 3'h2 == io_funct3 ? 3'h4 : {{1'd0}, _io_alu_funct_T_21}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_25 = 3'h3 == io_funct3 ? 4'ha : {{1'd0}, _io_alu_funct_T_23}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_27 = 3'h4 == io_funct3 ? 4'h5 : _io_alu_funct_T_25; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_29 = 3'h6 == io_funct3 ? 4'h6 : _io_alu_funct_T_27; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_31 = 3'h7 == io_funct3 ? 4'h7 : _io_alu_funct_T_29; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_alu_funct_T_33 = 3'h5 == io_funct3 ? _io_alu_funct_T_1 : _io_alu_funct_T_31; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _GEN_1 = 7'h37 == io_opcode | 7'h17 == io_opcode; // @[src/main/scala/riscv/core/ALUControl.scala 32:21 81:20]
  wire  _GEN_2 = 7'h67 == io_opcode | _GEN_1; // @[src/main/scala/riscv/core/ALUControl.scala 32:21 78:20]
  wire  _GEN_3 = 7'h6f == io_opcode | _GEN_2; // @[src/main/scala/riscv/core/ALUControl.scala 32:21 75:20]
  wire  _GEN_4 = 7'h23 == io_opcode | _GEN_3; // @[src/main/scala/riscv/core/ALUControl.scala 32:21 72:20]
  wire  _GEN_5 = 7'h3 == io_opcode | _GEN_4; // @[src/main/scala/riscv/core/ALUControl.scala 32:21 69:20]
  wire  _GEN_6 = 7'h63 == io_opcode | _GEN_5; // @[src/main/scala/riscv/core/ALUControl.scala 32:21 66:20]
  wire [3:0] _GEN_7 = 7'h33 == io_opcode ? _io_alu_funct_T_33 : {{3'd0}, _GEN_6}; // @[src/main/scala/riscv/core/ALUControl.scala 32:21 50:20]
  assign io_alu_funct = 7'h13 == io_opcode ? _io_alu_funct_T_15 : _GEN_7; // @[src/main/scala/riscv/core/ALUControl.scala 32:21 34:20]
endmodule
module Execute(
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  input  [31:0] io_reg1_data, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  input  [31:0] io_immediate, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  input         io_aluop1_source, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  input         io_aluop2_source, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  input  [31:0] io_forward_from_mem, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  input  [31:0] io_forward_from_wb, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  input  [1:0]  io_reg1_forward, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  input  [1:0]  io_reg2_forward, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  output [31:0] io_mem_alu_result, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  output [31:0] io_mem_reg2_data, // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
  output [31:0] io_csr_write_data // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]
);
  wire [3:0] alu_io_func; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 48:19]
  wire [31:0] alu_io_op1; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 48:19]
  wire [31:0] alu_io_op2; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 48:19]
  wire [31:0] alu_io_result; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 48:19]
  wire [6:0] alu_ctrl_io_opcode; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 49:24]
  wire [2:0] alu_ctrl_io_funct3; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 49:24]
  wire [6:0] alu_ctrl_io_funct7; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 49:24]
  wire [3:0] alu_ctrl_io_alu_funct; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 49:24]
  wire [2:0] funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 44:30]
  wire [4:0] uimm = io_instruction[19:15]; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 46:28]
  wire [31:0] _reg1_data_T_1 = 2'h1 == io_reg1_forward ? io_forward_from_mem : io_reg1_data; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] reg1_data = 2'h2 == io_reg1_forward ? io_forward_from_wb : _reg1_data_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _reg2_data_T_1 = 2'h1 == io_reg2_forward ? io_forward_from_mem : io_reg2_data; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] reg2_data = 2'h2 == io_reg2_forward ? io_forward_from_wb : _reg2_data_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_csr_write_data_T = ~reg1_data; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 87:54]
  wire [31:0] _io_csr_write_data_T_1 = io_csr_read_data & _io_csr_write_data_T; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 87:52]
  wire [31:0] _io_csr_write_data_T_2 = io_csr_read_data | reg1_data; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 88:52]
  wire [31:0] _io_csr_write_data_T_3 = {27'h0,uimm}; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 89:38]
  wire [31:0] _io_csr_write_data_T_5 = ~_io_csr_write_data_T_3; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 90:55]
  wire [31:0] _io_csr_write_data_T_6 = io_csr_read_data & _io_csr_write_data_T_5; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 90:53]
  wire [31:0] _io_csr_write_data_T_8 = io_csr_read_data | _io_csr_write_data_T_3; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 91:53]
  wire [31:0] _io_csr_write_data_T_10 = 3'h1 == funct3 ? reg1_data : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_csr_write_data_T_12 = 3'h3 == funct3 ? _io_csr_write_data_T_1 : _io_csr_write_data_T_10; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_csr_write_data_T_14 = 3'h2 == funct3 ? _io_csr_write_data_T_2 : _io_csr_write_data_T_12; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_csr_write_data_T_16 = 3'h5 == funct3 ? _io_csr_write_data_T_3 : _io_csr_write_data_T_14; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_csr_write_data_T_18 = 3'h7 == funct3 ? _io_csr_write_data_T_6 : _io_csr_write_data_T_16; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  ALU alu ( // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 48:19]
    .io_func(alu_io_func),
    .io_op1(alu_io_op1),
    .io_op2(alu_io_op2),
    .io_result(alu_io_result)
  );
  ALUControl alu_ctrl ( // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 49:24]
    .io_opcode(alu_ctrl_io_opcode),
    .io_funct3(alu_ctrl_io_funct3),
    .io_funct7(alu_ctrl_io_funct7),
    .io_alu_funct(alu_ctrl_io_alu_funct)
  );
  assign io_mem_alu_result = alu_io_result; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 83:21]
  assign io_mem_reg2_data = 2'h2 == io_reg2_forward ? io_forward_from_wb : _reg2_data_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_csr_write_data = 3'h6 == funct3 ? _io_csr_write_data_T_8 : _io_csr_write_data_T_18; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign alu_io_func = alu_ctrl_io_alu_funct; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 54:15]
  assign alu_io_op1 = io_aluop1_source ? io_instruction_address : reg1_data; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 64:20]
  assign alu_io_op2 = io_aluop2_source ? io_immediate : reg2_data; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 78:20]
  assign alu_ctrl_io_opcode = io_instruction[6:0]; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 43:30]
  assign alu_ctrl_io_funct3 = io_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 44:30]
  assign alu_ctrl_io_funct7 = io_instruction[31:25]; // @[src/main/scala/riscv/core/fivestage_final/Execute.scala 45:30]
endmodule
module PipelineRegister_24(
  input        clock,
  input        reset,
  input  [2:0] io_in, // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
  output [2:0] io_out // @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
  assign io_out = reg_; // @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
      reg_ <= 3'h0; // @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    end else begin
      reg_ <= io_in;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module EX2MEM(
  input         clock,
  input         reset,
  input         io_regs_write_enable, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  input  [31:0] io_regs_write_address, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  input  [2:0]  io_funct3, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  input         io_memory_read_enable, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  input         io_memory_write_enable, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  output        io_output_regs_write_enable, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  output [1:0]  io_output_regs_write_source, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  output [31:0] io_output_regs_write_address, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  output [31:0] io_output_funct3, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  output [31:0] io_output_reg2_data, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  output        io_output_memory_read_enable, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  output        io_output_memory_write_enable, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  output [31:0] io_output_alu_result, // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
  output [31:0] io_output_csr_read_data // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]
);
  wire  regs_write_enable_clock; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 49:33]
  wire  regs_write_enable_reset; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 49:33]
  wire  regs_write_enable_io_flush; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 49:33]
  wire  regs_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 49:33]
  wire  regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 49:33]
  wire  regs_write_source_clock; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 55:33]
  wire  regs_write_source_reset; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 55:33]
  wire  regs_write_source_io_flush; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 55:33]
  wire [1:0] regs_write_source_io_in; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 55:33]
  wire [1:0] regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 55:33]
  wire  regs_write_address_clock; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 61:34]
  wire  regs_write_address_reset; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 61:34]
  wire  regs_write_address_io_flush; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 61:34]
  wire [4:0] regs_write_address_io_in; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 61:34]
  wire [4:0] regs_write_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 61:34]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 67:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 67:35]
  wire  instruction_address_io_stall; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 67:35]
  wire  instruction_address_io_flush; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 67:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 67:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 67:35]
  wire  funct3_clock; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 73:22]
  wire  funct3_reset; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 73:22]
  wire [2:0] funct3_io_in; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 73:22]
  wire [2:0] funct3_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 73:22]
  wire  reg2_data_clock; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 79:25]
  wire  reg2_data_reset; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 79:25]
  wire  reg2_data_io_stall; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 79:25]
  wire  reg2_data_io_flush; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 79:25]
  wire [31:0] reg2_data_io_in; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 79:25]
  wire [31:0] reg2_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 79:25]
  wire  alu_result_clock; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 85:26]
  wire  alu_result_reset; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 85:26]
  wire  alu_result_io_stall; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 85:26]
  wire  alu_result_io_flush; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 85:26]
  wire [31:0] alu_result_io_in; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 85:26]
  wire [31:0] alu_result_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 85:26]
  wire  memory_read_enable_clock; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 91:34]
  wire  memory_read_enable_reset; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 91:34]
  wire  memory_read_enable_io_flush; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 91:34]
  wire  memory_read_enable_io_in; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 91:34]
  wire  memory_read_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 91:34]
  wire  memory_write_enable_clock; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 97:35]
  wire  memory_write_enable_reset; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 97:35]
  wire  memory_write_enable_io_flush; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 97:35]
  wire  memory_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 97:35]
  wire  memory_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 97:35]
  wire  csr_read_data_clock; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 103:29]
  wire  csr_read_data_reset; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 103:29]
  wire  csr_read_data_io_stall; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 103:29]
  wire  csr_read_data_io_flush; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 103:29]
  wire [31:0] csr_read_data_io_in; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 103:29]
  wire [31:0] csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 103:29]
  PipelineRegister_7 regs_write_enable ( // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 49:33]
    .clock(regs_write_enable_clock),
    .reset(regs_write_enable_reset),
    .io_flush(regs_write_enable_io_flush),
    .io_in(regs_write_enable_io_in),
    .io_out(regs_write_enable_io_out)
  );
  PipelineRegister_9 regs_write_source ( // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 55:33]
    .clock(regs_write_source_clock),
    .reset(regs_write_source_reset),
    .io_flush(regs_write_source_io_flush),
    .io_in(regs_write_source_io_in),
    .io_out(regs_write_source_io_out)
  );
  PipelineRegister_5 regs_write_address ( // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 61:34]
    .clock(regs_write_address_clock),
    .reset(regs_write_address_reset),
    .io_flush(regs_write_address_io_flush),
    .io_in(regs_write_address_io_in),
    .io_out(regs_write_address_io_out)
  );
  PipelineRegister_2 instruction_address ( // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 67:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_stall(instruction_address_io_stall),
    .io_flush(instruction_address_io_flush),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_24 funct3 ( // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 73:22]
    .clock(funct3_clock),
    .reset(funct3_reset),
    .io_in(funct3_io_in),
    .io_out(funct3_io_out)
  );
  PipelineRegister_2 reg2_data ( // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 79:25]
    .clock(reg2_data_clock),
    .reset(reg2_data_reset),
    .io_stall(reg2_data_io_stall),
    .io_flush(reg2_data_io_flush),
    .io_in(reg2_data_io_in),
    .io_out(reg2_data_io_out)
  );
  PipelineRegister_2 alu_result ( // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 85:26]
    .clock(alu_result_clock),
    .reset(alu_result_reset),
    .io_stall(alu_result_io_stall),
    .io_flush(alu_result_io_flush),
    .io_in(alu_result_io_in),
    .io_out(alu_result_io_out)
  );
  PipelineRegister_7 memory_read_enable ( // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 91:34]
    .clock(memory_read_enable_clock),
    .reset(memory_read_enable_reset),
    .io_flush(memory_read_enable_io_flush),
    .io_in(memory_read_enable_io_in),
    .io_out(memory_read_enable_io_out)
  );
  PipelineRegister_7 memory_write_enable ( // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 97:35]
    .clock(memory_write_enable_clock),
    .reset(memory_write_enable_reset),
    .io_flush(memory_write_enable_io_flush),
    .io_in(memory_write_enable_io_in),
    .io_out(memory_write_enable_io_out)
  );
  PipelineRegister_2 csr_read_data ( // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 103:29]
    .clock(csr_read_data_clock),
    .reset(csr_read_data_reset),
    .io_stall(csr_read_data_io_stall),
    .io_flush(csr_read_data_io_flush),
    .io_in(csr_read_data_io_in),
    .io_out(csr_read_data_io_out)
  );
  assign io_output_regs_write_enable = regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 53:31]
  assign io_output_regs_write_source = regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 59:31]
  assign io_output_regs_write_address = {{27'd0}, regs_write_address_io_out}; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 65:32]
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 71:33]
  assign io_output_funct3 = {{29'd0}, funct3_io_out}; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 77:20]
  assign io_output_reg2_data = reg2_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 83:23]
  assign io_output_memory_read_enable = memory_read_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 95:32]
  assign io_output_memory_write_enable = memory_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 101:33]
  assign io_output_alu_result = alu_result_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 89:24]
  assign io_output_csr_read_data = csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 107:27]
  assign regs_write_enable_clock = clock;
  assign regs_write_enable_reset = reset;
  assign regs_write_enable_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 52:30]
  assign regs_write_enable_io_in = io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 50:27]
  assign regs_write_source_clock = clock;
  assign regs_write_source_reset = reset;
  assign regs_write_source_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 58:30]
  assign regs_write_source_io_in = io_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 56:27]
  assign regs_write_address_clock = clock;
  assign regs_write_address_reset = reset;
  assign regs_write_address_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 64:31]
  assign regs_write_address_io_in = io_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 62:28]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 69:32]
  assign instruction_address_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 70:32]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 68:29]
  assign funct3_clock = clock;
  assign funct3_reset = reset;
  assign funct3_io_in = io_funct3; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 74:16]
  assign reg2_data_clock = clock;
  assign reg2_data_reset = reset;
  assign reg2_data_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 81:22]
  assign reg2_data_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 82:22]
  assign reg2_data_io_in = io_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 80:19]
  assign alu_result_clock = clock;
  assign alu_result_reset = reset;
  assign alu_result_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 87:23]
  assign alu_result_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 88:23]
  assign alu_result_io_in = io_alu_result; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 86:20]
  assign memory_read_enable_clock = clock;
  assign memory_read_enable_reset = reset;
  assign memory_read_enable_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 94:31]
  assign memory_read_enable_io_in = io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 92:28]
  assign memory_write_enable_clock = clock;
  assign memory_write_enable_reset = reset;
  assign memory_write_enable_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 100:32]
  assign memory_write_enable_io_in = io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 98:29]
  assign csr_read_data_clock = clock;
  assign csr_read_data_reset = reset;
  assign csr_read_data_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 105:26]
  assign csr_read_data_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 106:26]
  assign csr_read_data_io_in = io_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 104:23]
endmodule
module MemoryAccess(
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  input  [31:0] io_reg2_data, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  input         io_memory_read_enable, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  input         io_memory_write_enable, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  input  [2:0]  io_funct3, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  output [31:0] io_wb_memory_read_data, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  output [31:0] io_forward_data, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  output [31:0] io_bundle_address, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  output [31:0] io_bundle_write_data, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  output        io_bundle_write_enable, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  output        io_bundle_write_strobe_0, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  output        io_bundle_write_strobe_1, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  output        io_bundle_write_strobe_2, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  output        io_bundle_write_strobe_3, // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
  input  [31:0] io_bundle_read_data // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]
);
  wire [1:0] mem_address_index = io_alu_result[1:0]; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 37:40]
  wire [23:0] _io_wb_memory_read_data_T_2 = io_bundle_read_data[31] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 53:19]
  wire [31:0] _io_wb_memory_read_data_T_4 = {_io_wb_memory_read_data_T_2,io_bundle_read_data[31:24]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 53:14]
  wire [23:0] _io_wb_memory_read_data_T_7 = io_bundle_read_data[7] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 55:28]
  wire [31:0] _io_wb_memory_read_data_T_9 = {_io_wb_memory_read_data_T_7,io_bundle_read_data[7:0]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 55:23]
  wire [23:0] _io_wb_memory_read_data_T_12 = io_bundle_read_data[15] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 56:28]
  wire [31:0] _io_wb_memory_read_data_T_14 = {_io_wb_memory_read_data_T_12,io_bundle_read_data[15:8]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 56:23]
  wire [23:0] _io_wb_memory_read_data_T_17 = io_bundle_read_data[23] ? 24'hffffff : 24'h0; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 57:28]
  wire [31:0] _io_wb_memory_read_data_T_19 = {_io_wb_memory_read_data_T_17,io_bundle_read_data[23:16]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 57:23]
  wire  _io_wb_memory_read_data_T_20 = 2'h0 == mem_address_index; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_21 = 2'h0 == mem_address_index ? _io_wb_memory_read_data_T_9 :
    _io_wb_memory_read_data_T_4; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_wb_memory_read_data_T_22 = 2'h1 == mem_address_index; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_23 = 2'h1 == mem_address_index ? _io_wb_memory_read_data_T_14 :
    _io_wb_memory_read_data_T_21; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_wb_memory_read_data_T_24 = 2'h2 == mem_address_index; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_25 = 2'h2 == mem_address_index ? _io_wb_memory_read_data_T_19 :
    _io_wb_memory_read_data_T_23; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_28 = {24'h0,io_bundle_read_data[31:24]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 62:14]
  wire [31:0] _io_wb_memory_read_data_T_31 = {24'h0,io_bundle_read_data[7:0]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 64:23]
  wire [31:0] _io_wb_memory_read_data_T_34 = {24'h0,io_bundle_read_data[15:8]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 65:23]
  wire [31:0] _io_wb_memory_read_data_T_37 = {24'h0,io_bundle_read_data[23:16]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 66:23]
  wire [31:0] _io_wb_memory_read_data_T_39 = 2'h0 == mem_address_index ? _io_wb_memory_read_data_T_31 :
    _io_wb_memory_read_data_T_28; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_41 = 2'h1 == mem_address_index ? _io_wb_memory_read_data_T_34 :
    _io_wb_memory_read_data_T_39; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_43 = 2'h2 == mem_address_index ? _io_wb_memory_read_data_T_37 :
    _io_wb_memory_read_data_T_41; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_wb_memory_read_data_T_44 = mem_address_index == 2'h0; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 70:29]
  wire [15:0] _io_wb_memory_read_data_T_47 = io_bundle_read_data[15] ? 16'hffff : 16'h0; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 71:19]
  wire [31:0] _io_wb_memory_read_data_T_49 = {_io_wb_memory_read_data_T_47,io_bundle_read_data[15:0]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 71:14]
  wire [15:0] _io_wb_memory_read_data_T_52 = io_bundle_read_data[31] ? 16'hffff : 16'h0; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 72:19]
  wire [31:0] _io_wb_memory_read_data_T_54 = {_io_wb_memory_read_data_T_52,io_bundle_read_data[31:16]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 72:14]
  wire [31:0] _io_wb_memory_read_data_T_55 = _io_wb_memory_read_data_T_44 ? _io_wb_memory_read_data_T_49 :
    _io_wb_memory_read_data_T_54; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 69:36]
  wire [31:0] _io_wb_memory_read_data_T_59 = {16'h0,io_bundle_read_data[15:0]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 76:14]
  wire [31:0] _io_wb_memory_read_data_T_62 = {16'h0,io_bundle_read_data[31:16]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 77:14]
  wire [31:0] _io_wb_memory_read_data_T_63 = _io_wb_memory_read_data_T_44 ? _io_wb_memory_read_data_T_59 :
    _io_wb_memory_read_data_T_62; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 74:37]
  wire [31:0] _io_wb_memory_read_data_T_65 = 3'h0 == io_funct3 ? _io_wb_memory_read_data_T_25 : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_67 = 3'h4 == io_funct3 ? _io_wb_memory_read_data_T_43 :
    _io_wb_memory_read_data_T_65; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_69 = 3'h1 == io_funct3 ? _io_wb_memory_read_data_T_55 :
    _io_wb_memory_read_data_T_67; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_71 = 3'h5 == io_funct3 ? _io_wb_memory_read_data_T_63 :
    _io_wb_memory_read_data_T_69; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_wb_memory_read_data_T_73 = 3'h2 == io_funct3 ? io_bundle_read_data : _io_wb_memory_read_data_T_71; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _GEN_3 = 2'h3 == mem_address_index; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 84:28 86:{49,49}]
  wire [4:0] _io_bundle_write_data_T_1 = {mem_address_index, 3'h0}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 87:90]
  wire [39:0] _GEN_0 = {{31'd0}, io_reg2_data[8:0]}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 87:68]
  wire [39:0] _io_bundle_write_data_T_2 = _GEN_0 << _io_bundle_write_data_T_1; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 87:68]
  wire [32:0] _io_bundle_write_data_T_5 = {io_reg2_data[16:0], 16'h0}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 98:96]
  wire [32:0] _GEN_6 = _io_wb_memory_read_data_T_44 ? {{16'd0}, io_reg2_data[16:0]} : _io_bundle_write_data_T_5; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 89:39 93:30 98:30]
  wire  _GEN_7 = _io_wb_memory_read_data_T_44 ? 1'h0 : 1'h1; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 84:28 89:39 96:37]
  wire  _T_3 = io_funct3 == 3'h2; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 101:26]
  wire  _GEN_13 = io_funct3 == 3'h1 ? _io_wb_memory_read_data_T_44 : _T_3; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 88:52]
  wire [32:0] _GEN_15 = io_funct3 == 3'h1 ? _GEN_6 : {{1'd0}, io_reg2_data}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 83:26 88:52]
  wire  _GEN_16 = io_funct3 == 3'h1 ? _GEN_7 : _T_3; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 88:52]
  wire  _GEN_18 = io_funct3 == 3'h0 ? _io_wb_memory_read_data_T_20 : _GEN_13; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 85:46]
  wire  _GEN_19 = io_funct3 == 3'h0 ? _io_wb_memory_read_data_T_22 : _GEN_13; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 85:46]
  wire  _GEN_20 = io_funct3 == 3'h0 ? _io_wb_memory_read_data_T_24 : _GEN_16; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 85:46]
  wire  _GEN_21 = io_funct3 == 3'h0 ? _GEN_3 : _GEN_16; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 85:46]
  wire [39:0] _GEN_22 = io_funct3 == 3'h0 ? _io_bundle_write_data_T_2 : {{7'd0}, _GEN_15}; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 85:46 87:28]
  wire [39:0] _GEN_23 = io_memory_write_enable ? _GEN_22 : 40'h0; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 40:24 82:38]
  wire  _GEN_24 = io_memory_write_enable & _GEN_18; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:26 82:38]
  wire  _GEN_25 = io_memory_write_enable & _GEN_19; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:26 82:38]
  wire  _GEN_26 = io_memory_write_enable & _GEN_20; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:26 82:38]
  wire  _GEN_27 = io_memory_write_enable & _GEN_21; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:26 82:38]
  wire [39:0] _GEN_29 = io_memory_read_enable ? 40'h0 : _GEN_23; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 40:24 45:31]
  assign io_wb_memory_read_data = io_memory_read_enable ? _io_wb_memory_read_data_T_73 : 32'h0; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 43:26 45:31 47:28]
  assign io_forward_data = io_regs_write_source == 2'h2 ? io_csr_read_data : io_alu_result; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 108:25]
  assign io_bundle_address = io_alu_result; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 41:21]
  assign io_bundle_write_data = _GEN_29[31:0];
  assign io_bundle_write_enable = io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 39:26]
  assign io_bundle_write_strobe_0 = io_memory_read_enable ? 1'h0 : _GEN_24; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:26 45:31]
  assign io_bundle_write_strobe_1 = io_memory_read_enable ? 1'h0 : _GEN_25; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:26 45:31]
  assign io_bundle_write_strobe_2 = io_memory_read_enable ? 1'h0 : _GEN_26; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:26 45:31]
  assign io_bundle_write_strobe_3 = io_memory_read_enable ? 1'h0 : _GEN_27; // @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:26 45:31]
endmodule
module MEM2WB(
  input         clock,
  input         reset,
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  input         io_regs_write_enable, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  input  [31:0] io_regs_write_address, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  input  [31:0] io_memory_read_data, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  output [31:0] io_output_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  output [31:0] io_output_alu_result, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  output        io_output_regs_write_enable, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  output [1:0]  io_output_regs_write_source, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  output [31:0] io_output_regs_write_address, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  output [31:0] io_output_memory_read_data, // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
  output [31:0] io_output_csr_read_data // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]
);
  wire  alu_result_clock; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 42:26]
  wire  alu_result_reset; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 42:26]
  wire  alu_result_io_stall; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 42:26]
  wire  alu_result_io_flush; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 42:26]
  wire [31:0] alu_result_io_in; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 42:26]
  wire [31:0] alu_result_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 42:26]
  wire  memory_read_data_clock; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 48:32]
  wire  memory_read_data_reset; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 48:32]
  wire  memory_read_data_io_stall; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 48:32]
  wire  memory_read_data_io_flush; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 48:32]
  wire [31:0] memory_read_data_io_in; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 48:32]
  wire [31:0] memory_read_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 48:32]
  wire  regs_write_enable_clock; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 54:33]
  wire  regs_write_enable_reset; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 54:33]
  wire  regs_write_enable_io_flush; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 54:33]
  wire  regs_write_enable_io_in; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 54:33]
  wire  regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 54:33]
  wire  regs_write_source_clock; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 60:33]
  wire  regs_write_source_reset; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 60:33]
  wire  regs_write_source_io_flush; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 60:33]
  wire [1:0] regs_write_source_io_in; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 60:33]
  wire [1:0] regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 60:33]
  wire  regs_write_address_clock; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 66:34]
  wire  regs_write_address_reset; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 66:34]
  wire  regs_write_address_io_flush; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 66:34]
  wire [4:0] regs_write_address_io_in; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 66:34]
  wire [4:0] regs_write_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 66:34]
  wire  instruction_address_clock; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 72:35]
  wire  instruction_address_reset; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 72:35]
  wire  instruction_address_io_stall; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 72:35]
  wire  instruction_address_io_flush; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 72:35]
  wire [31:0] instruction_address_io_in; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 72:35]
  wire [31:0] instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 72:35]
  wire  csr_read_data_clock; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 78:29]
  wire  csr_read_data_reset; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 78:29]
  wire  csr_read_data_io_stall; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 78:29]
  wire  csr_read_data_io_flush; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 78:29]
  wire [31:0] csr_read_data_io_in; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 78:29]
  wire [31:0] csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 78:29]
  PipelineRegister_2 alu_result ( // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 42:26]
    .clock(alu_result_clock),
    .reset(alu_result_reset),
    .io_stall(alu_result_io_stall),
    .io_flush(alu_result_io_flush),
    .io_in(alu_result_io_in),
    .io_out(alu_result_io_out)
  );
  PipelineRegister_2 memory_read_data ( // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 48:32]
    .clock(memory_read_data_clock),
    .reset(memory_read_data_reset),
    .io_stall(memory_read_data_io_stall),
    .io_flush(memory_read_data_io_flush),
    .io_in(memory_read_data_io_in),
    .io_out(memory_read_data_io_out)
  );
  PipelineRegister_7 regs_write_enable ( // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 54:33]
    .clock(regs_write_enable_clock),
    .reset(regs_write_enable_reset),
    .io_flush(regs_write_enable_io_flush),
    .io_in(regs_write_enable_io_in),
    .io_out(regs_write_enable_io_out)
  );
  PipelineRegister_9 regs_write_source ( // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 60:33]
    .clock(regs_write_source_clock),
    .reset(regs_write_source_reset),
    .io_flush(regs_write_source_io_flush),
    .io_in(regs_write_source_io_in),
    .io_out(regs_write_source_io_out)
  );
  PipelineRegister_5 regs_write_address ( // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 66:34]
    .clock(regs_write_address_clock),
    .reset(regs_write_address_reset),
    .io_flush(regs_write_address_io_flush),
    .io_in(regs_write_address_io_in),
    .io_out(regs_write_address_io_out)
  );
  PipelineRegister_2 instruction_address ( // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 72:35]
    .clock(instruction_address_clock),
    .reset(instruction_address_reset),
    .io_stall(instruction_address_io_stall),
    .io_flush(instruction_address_io_flush),
    .io_in(instruction_address_io_in),
    .io_out(instruction_address_io_out)
  );
  PipelineRegister_2 csr_read_data ( // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 78:29]
    .clock(csr_read_data_clock),
    .reset(csr_read_data_reset),
    .io_stall(csr_read_data_io_stall),
    .io_flush(csr_read_data_io_flush),
    .io_in(csr_read_data_io_in),
    .io_out(csr_read_data_io_out)
  );
  assign io_output_instruction_address = instruction_address_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 76:33]
  assign io_output_alu_result = alu_result_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 46:24]
  assign io_output_regs_write_enable = regs_write_enable_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 58:31]
  assign io_output_regs_write_source = regs_write_source_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 64:31]
  assign io_output_regs_write_address = {{27'd0}, regs_write_address_io_out}; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 70:32]
  assign io_output_memory_read_data = memory_read_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 52:30]
  assign io_output_csr_read_data = csr_read_data_io_out; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 82:27]
  assign alu_result_clock = clock;
  assign alu_result_reset = reset;
  assign alu_result_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 44:23]
  assign alu_result_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 45:23]
  assign alu_result_io_in = io_alu_result; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 43:20]
  assign memory_read_data_clock = clock;
  assign memory_read_data_reset = reset;
  assign memory_read_data_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 50:29]
  assign memory_read_data_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 51:29]
  assign memory_read_data_io_in = io_memory_read_data; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 49:26]
  assign regs_write_enable_clock = clock;
  assign regs_write_enable_reset = reset;
  assign regs_write_enable_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 57:30]
  assign regs_write_enable_io_in = io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 55:27]
  assign regs_write_source_clock = clock;
  assign regs_write_source_reset = reset;
  assign regs_write_source_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 63:30]
  assign regs_write_source_io_in = io_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 61:27]
  assign regs_write_address_clock = clock;
  assign regs_write_address_reset = reset;
  assign regs_write_address_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 69:31]
  assign regs_write_address_io_in = io_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 67:28]
  assign instruction_address_clock = clock;
  assign instruction_address_reset = reset;
  assign instruction_address_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 74:32]
  assign instruction_address_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 75:32]
  assign instruction_address_io_in = io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 73:29]
  assign csr_read_data_clock = clock;
  assign csr_read_data_reset = reset;
  assign csr_read_data_io_stall = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 80:26]
  assign csr_read_data_io_flush = 1'h0; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 81:26]
  assign csr_read_data_io_in = io_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 79:23]
endmodule
module WriteBack(
  input  [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/WriteBack.scala 22:14]
  input  [31:0] io_alu_result, // @[src/main/scala/riscv/core/fivestage_final/WriteBack.scala 22:14]
  input  [31:0] io_memory_read_data, // @[src/main/scala/riscv/core/fivestage_final/WriteBack.scala 22:14]
  input  [1:0]  io_regs_write_source, // @[src/main/scala/riscv/core/fivestage_final/WriteBack.scala 22:14]
  input  [31:0] io_csr_read_data, // @[src/main/scala/riscv/core/fivestage_final/WriteBack.scala 22:14]
  output [31:0] io_regs_write_data // @[src/main/scala/riscv/core/fivestage_final/WriteBack.scala 22:14]
);
  wire [31:0] _io_regs_write_data_T_1 = io_instruction_address + 32'h4; // @[src/main/scala/riscv/core/fivestage_final/WriteBack.scala 37:72]
  wire [31:0] _io_regs_write_data_T_3 = 2'h1 == io_regs_write_source ? io_memory_read_data : io_alu_result; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_regs_write_data_T_5 = 2'h2 == io_regs_write_source ? io_csr_read_data : _io_regs_write_data_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_regs_write_data = 2'h3 == io_regs_write_source ? _io_regs_write_data_T_1 : _io_regs_write_data_T_5; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
endmodule
module Forwarding(
  input  [4:0] io_rs1_id, // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
  input  [4:0] io_rs2_id, // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
  input  [4:0] io_rs1_ex, // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
  input  [4:0] io_rs2_ex, // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
  input  [4:0] io_rd_mem, // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
  input        io_reg_write_enable_mem, // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
  input  [4:0] io_rd_wb, // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
  input        io_reg_write_enable_wb, // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
  output [1:0] io_reg1_forward_id, // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
  output [1:0] io_reg2_forward_id, // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
  output [1:0] io_reg1_forward_ex, // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
  output [1:0] io_reg2_forward_ex // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]
);
  wire  _T_1 = io_reg_write_enable_mem & io_rd_mem != 5'h0; // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 44:32]
  wire  _T_5 = io_reg_write_enable_wb & io_rd_wb != 5'h0; // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 46:37]
  wire [1:0] _GEN_0 = io_reg_write_enable_wb & io_rd_wb != 5'h0 & io_rd_wb == io_rs1_id ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 46:84 47:24 49:24]
  wire [1:0] _GEN_2 = _T_5 & io_rd_wb == io_rs2_id ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 54:84 55:24 57:24]
  wire [1:0] _GEN_4 = _T_5 & io_rd_wb == io_rs1_ex ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 62:84 63:24 65:24]
  wire [1:0] _GEN_6 = _T_5 & io_rd_wb == io_rs2_ex ? 2'h2 : 2'h0; // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 70:84 71:24 73:24]
  assign io_reg1_forward_id = io_reg_write_enable_mem & io_rd_mem != 5'h0 & io_rd_mem == io_rs1_id ? 2'h1 : _GEN_0; // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 44:81 45:24]
  assign io_reg2_forward_id = _T_1 & io_rd_mem == io_rs2_id ? 2'h1 : _GEN_2; // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 52:81 53:24]
  assign io_reg1_forward_ex = _T_1 & io_rd_mem == io_rs1_ex ? 2'h1 : _GEN_4; // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 60:81 61:24]
  assign io_reg2_forward_ex = _T_1 & io_rd_mem == io_rs2_ex ? 2'h1 : _GEN_6; // @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 68:81 69:24]
endmodule
module CLINT(
  input  [31:0] io_interrupt_flag, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  input  [31:0] io_instruction_id, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  input  [31:0] io_instruction_address_if, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  input         io_jump_flag, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  input  [31:0] io_jump_address, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  output [31:0] io_id_interrupt_handler_address, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  output        io_id_interrupt_assert, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  input  [31:0] io_csr_bundle_mstatus, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  input  [31:0] io_csr_bundle_mepc, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  input  [31:0] io_csr_bundle_mcause, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  input  [31:0] io_csr_bundle_mtvec, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  output [31:0] io_csr_bundle_mstatus_write_data, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  output [31:0] io_csr_bundle_mepc_write_data, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  output [31:0] io_csr_bundle_mcause_write_data, // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
  output        io_csr_bundle_direct_write_enable // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]
);
  wire  interrupt_enable = io_csr_bundle_mstatus[3]; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 56:47]
  wire [31:0] instruction_address = io_jump_flag ? io_jump_address : io_instruction_address_if; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 57:32]
  wire [31:0] mstatus_disable_interrupt = {io_csr_bundle_mstatus[31:4],1'h0,io_csr_bundle_mstatus[2:0]}; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 62:76]
  wire [31:0] mstatus_recover_interrupt = {io_csr_bundle_mstatus[31:4],io_csr_bundle_mstatus[7],io_csr_bundle_mstatus[2:
    0]}; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 63:92]
  wire [3:0] _io_csr_bundle_mcause_write_data_T_1 = 32'h73 == io_instruction_id ? 4'hb : 4'ha; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [3:0] _io_csr_bundle_mcause_write_data_T_3 = 32'h100073 == io_instruction_id ? 4'h3 :
    _io_csr_bundle_mcause_write_data_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_csr_bundle_mcause_write_data_T_5 = io_interrupt_flag[0] ? 32'h80000007 : 32'h8000000b; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 82:43]
  wire  _T_5 = io_instruction_id == 32'h30200073; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 86:32]
  wire [31:0] _GEN_0 = io_instruction_id == 32'h30200073 ? mstatus_recover_interrupt : io_csr_bundle_mstatus; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 86:58 87:38 94:38]
  wire [31:0] _GEN_4 = io_instruction_id == 32'h30200073 ? io_csr_bundle_mepc : 32'h0; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 86:58 92:37 99:37]
  wire [31:0] _GEN_5 = io_interrupt_flag != 32'h0 & interrupt_enable ? mstatus_disable_interrupt : _GEN_0; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 79:78 80:38]
  wire [31:0] _GEN_6 = io_interrupt_flag != 32'h0 & interrupt_enable ? instruction_address : io_csr_bundle_mepc; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 79:78 81:35]
  wire [31:0] _GEN_7 = io_interrupt_flag != 32'h0 & interrupt_enable ? _io_csr_bundle_mcause_write_data_T_5 :
    io_csr_bundle_mcause; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 79:78 82:37]
  wire  _GEN_8 = io_interrupt_flag != 32'h0 & interrupt_enable | _T_5; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 79:78 83:39]
  wire [31:0] _GEN_9 = io_interrupt_flag != 32'h0 & interrupt_enable ? io_csr_bundle_mtvec : _GEN_4; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 79:78 85:37]
  assign io_id_interrupt_handler_address = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 ?
    io_csr_bundle_mtvec : _GEN_9; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 65:101 78:37]
  assign io_id_interrupt_assert = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 | _GEN_8; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 65:101 76:39]
  assign io_csr_bundle_mstatus_write_data = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 ?
    mstatus_disable_interrupt : _GEN_5; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 65:101 66:38]
  assign io_csr_bundle_mepc_write_data = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 ?
    instruction_address : _GEN_6; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 65:101 67:35]
  assign io_csr_bundle_mcause_write_data = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 ? {{28'd0},
    _io_csr_bundle_mcause_write_data_T_3} : _GEN_7; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 65:101 68:37]
  assign io_csr_bundle_direct_write_enable = io_instruction_id == 32'h73 | io_instruction_id == 32'h100073 | _GEN_8; // @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 65:101 76:39]
endmodule
module CSR(
  input         clock,
  input         reset,
  input  [11:0] io_reg_read_address_id, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  input         io_reg_write_enable_ex, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  input  [11:0] io_reg_write_address_ex, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  input  [31:0] io_reg_write_data_ex, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  output [31:0] io_id_reg_read_data, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  output [31:0] io_clint_access_bundle_mstatus, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  output [31:0] io_clint_access_bundle_mepc, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  output [31:0] io_clint_access_bundle_mcause, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  output [31:0] io_clint_access_bundle_mtvec, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  input  [31:0] io_clint_access_bundle_mstatus_write_data, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  input  [31:0] io_clint_access_bundle_mepc_write_data, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  input  [31:0] io_clint_access_bundle_mcause_write_data, // @[src/main/scala/riscv/core/CSR.scala 36:14]
  input         io_clint_access_bundle_direct_write_enable // @[src/main/scala/riscv/core/CSR.scala 36:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mstatus; // @[src/main/scala/riscv/core/CSR.scala 47:24]
  reg [31:0] mie; // @[src/main/scala/riscv/core/CSR.scala 48:20]
  reg [31:0] mtvec; // @[src/main/scala/riscv/core/CSR.scala 49:22]
  reg [31:0] mscratch; // @[src/main/scala/riscv/core/CSR.scala 50:25]
  reg [31:0] mepc; // @[src/main/scala/riscv/core/CSR.scala 51:21]
  reg [31:0] mcause; // @[src/main/scala/riscv/core/CSR.scala 52:23]
  reg [63:0] cycles; // @[src/main/scala/riscv/core/CSR.scala 53:23]
  wire [63:0] _cycles_T_1 = cycles + 64'h1; // @[src/main/scala/riscv/core/CSR.scala 65:20]
  wire [31:0] _io_id_reg_read_data_T_1 = 12'h300 == io_reg_read_address_id ? mstatus : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_read_data_T_3 = 12'h304 == io_reg_read_address_id ? mie : _io_id_reg_read_data_T_1; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_read_data_T_5 = 12'h305 == io_reg_read_address_id ? mtvec : _io_id_reg_read_data_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_read_data_T_7 = 12'h340 == io_reg_read_address_id ? mscratch : _io_id_reg_read_data_T_5; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_read_data_T_9 = 12'h341 == io_reg_read_address_id ? mepc : _io_id_reg_read_data_T_7; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_read_data_T_11 = 12'h342 == io_reg_read_address_id ? mcause : _io_id_reg_read_data_T_9; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _io_id_reg_read_data_T_13 = 12'hc00 == io_reg_read_address_id ? cycles[31:0] : _io_id_reg_read_data_T_11; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire  _io_clint_access_bundle_mstatus_T = io_reg_write_address_ex == 12'h300; // @[src/main/scala/riscv/core/CSR.scala 71:91]
  wire  _io_clint_access_bundle_mtvec_T = io_reg_write_address_ex == 12'h305; // @[src/main/scala/riscv/core/CSR.scala 72:89]
  wire  _io_clint_access_bundle_mcause_T = io_reg_write_address_ex == 12'h342; // @[src/main/scala/riscv/core/CSR.scala 73:90]
  wire  _io_clint_access_bundle_mepc_T = io_reg_write_address_ex == 12'h341; // @[src/main/scala/riscv/core/CSR.scala 74:88]
  wire [31:0] _GEN_0 = _io_clint_access_bundle_mcause_T ? io_reg_write_data_ex : mcause; // @[src/main/scala/riscv/core/CSR.scala 85:64 86:14 52:23]
  wire [31:0] _GEN_1 = _io_clint_access_bundle_mepc_T ? io_reg_write_data_ex : mepc; // @[src/main/scala/riscv/core/CSR.scala 83:62 84:12 51:21]
  wire [31:0] _GEN_2 = _io_clint_access_bundle_mepc_T ? mcause : _GEN_0; // @[src/main/scala/riscv/core/CSR.scala 52:23 83:62]
  wire [31:0] _GEN_12 = io_reg_write_address_ex == 12'h340 ? io_reg_write_data_ex : mscratch; // @[src/main/scala/riscv/core/CSR.scala 95:66 96:16 50:25]
  assign io_id_reg_read_data = 12'hc80 == io_reg_read_address_id ? cycles[63:32] : _io_id_reg_read_data_T_13; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  assign io_clint_access_bundle_mstatus = io_reg_write_enable_ex & io_reg_write_address_ex == 12'h300 ?
    io_reg_write_data_ex : mstatus; // @[src/main/scala/riscv/core/CSR.scala 71:40]
  assign io_clint_access_bundle_mepc = io_reg_write_enable_ex & io_reg_write_address_ex == 12'h341 ?
    io_reg_write_data_ex : mepc; // @[src/main/scala/riscv/core/CSR.scala 74:37]
  assign io_clint_access_bundle_mcause = io_reg_write_enable_ex & io_reg_write_address_ex == 12'h342 ?
    io_reg_write_data_ex : mcause; // @[src/main/scala/riscv/core/CSR.scala 73:39]
  assign io_clint_access_bundle_mtvec = io_reg_write_enable_ex & io_reg_write_address_ex == 12'h305 ?
    io_reg_write_data_ex : mtvec; // @[src/main/scala/riscv/core/CSR.scala 72:38]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 47:24]
      mstatus <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 47:24]
    end else if (io_clint_access_bundle_direct_write_enable) begin // @[src/main/scala/riscv/core/CSR.scala 76:52]
      mstatus <= io_clint_access_bundle_mstatus_write_data; // @[src/main/scala/riscv/core/CSR.scala 77:13]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 80:38]
      if (_io_clint_access_bundle_mstatus_T) begin // @[src/main/scala/riscv/core/CSR.scala 81:59]
        mstatus <= io_reg_write_data_ex; // @[src/main/scala/riscv/core/CSR.scala 82:15]
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 48:20]
      mie <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 48:20]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 90:32]
      if (io_reg_write_address_ex == 12'h304) begin // @[src/main/scala/riscv/core/CSR.scala 91:55]
        mie <= io_reg_write_data_ex; // @[src/main/scala/riscv/core/CSR.scala 92:11]
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 49:22]
      mtvec <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 49:22]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 90:32]
      if (!(io_reg_write_address_ex == 12'h304)) begin // @[src/main/scala/riscv/core/CSR.scala 91:55]
        if (_io_clint_access_bundle_mtvec_T) begin // @[src/main/scala/riscv/core/CSR.scala 93:63]
          mtvec <= io_reg_write_data_ex; // @[src/main/scala/riscv/core/CSR.scala 94:13]
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 50:25]
      mscratch <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 50:25]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 90:32]
      if (!(io_reg_write_address_ex == 12'h304)) begin // @[src/main/scala/riscv/core/CSR.scala 91:55]
        if (!(_io_clint_access_bundle_mtvec_T)) begin // @[src/main/scala/riscv/core/CSR.scala 93:63]
          mscratch <= _GEN_12;
        end
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 51:21]
      mepc <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 51:21]
    end else if (io_clint_access_bundle_direct_write_enable) begin // @[src/main/scala/riscv/core/CSR.scala 76:52]
      mepc <= io_clint_access_bundle_mepc_write_data; // @[src/main/scala/riscv/core/CSR.scala 78:10]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 80:38]
      if (!(_io_clint_access_bundle_mstatus_T)) begin // @[src/main/scala/riscv/core/CSR.scala 81:59]
        mepc <= _GEN_1;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 52:23]
      mcause <= 32'h0; // @[src/main/scala/riscv/core/CSR.scala 52:23]
    end else if (io_clint_access_bundle_direct_write_enable) begin // @[src/main/scala/riscv/core/CSR.scala 76:52]
      mcause <= io_clint_access_bundle_mcause_write_data; // @[src/main/scala/riscv/core/CSR.scala 79:12]
    end else if (io_reg_write_enable_ex) begin // @[src/main/scala/riscv/core/CSR.scala 80:38]
      if (!(_io_clint_access_bundle_mstatus_T)) begin // @[src/main/scala/riscv/core/CSR.scala 81:59]
        mcause <= _GEN_2;
      end
    end
    if (reset) begin // @[src/main/scala/riscv/core/CSR.scala 53:23]
      cycles <= 64'h0; // @[src/main/scala/riscv/core/CSR.scala 53:23]
    end else begin
      cycles <= _cycles_T_1; // @[src/main/scala/riscv/core/CSR.scala 65:10]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mstatus = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  mie = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  mtvec = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  mscratch = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  mepc = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  mcause = _RAND_5[31:0];
  _RAND_6 = {2{`RANDOM}};
  cycles = _RAND_6[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CPU(
  input         clock,
  input         reset,
  output [31:0] io_instruction_address, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  input         io_instruction_valid, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  output [31:0] io_memory_bundle_address, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  output [31:0] io_memory_bundle_write_data, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  output        io_memory_bundle_write_enable, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  output        io_memory_bundle_write_strobe_0, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  output        io_memory_bundle_write_strobe_1, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  output        io_memory_bundle_write_strobe_2, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  output        io_memory_bundle_write_strobe_3, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  input  [31:0] io_memory_bundle_read_data, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  output [2:0]  io_device_select, // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
  input  [31:0] io_interrupt_flag // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]
);
  wire  ctrl_io_jump_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire  ctrl_io_jump_instruction_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire [4:0] ctrl_io_rs1_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire [4:0] ctrl_io_rs2_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire  ctrl_io_memory_read_enable_ex; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire [4:0] ctrl_io_rd_ex; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire  ctrl_io_memory_read_enable_mem; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire [4:0] ctrl_io_rd_mem; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire  ctrl_io_if_flush; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire  ctrl_io_id_flush; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire  ctrl_io_pc_stall; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire  ctrl_io_if_stall; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
  wire  regs_clock; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 25:20]
  wire  regs_reset; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 25:20]
  wire  regs_io_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 25:20]
  wire [4:0] regs_io_write_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 25:20]
  wire [31:0] regs_io_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 25:20]
  wire [4:0] regs_io_read_address1; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 25:20]
  wire [4:0] regs_io_read_address2; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 25:20]
  wire [31:0] regs_io_read_data1; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 25:20]
  wire [31:0] regs_io_read_data2; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 25:20]
  wire  inst_fetch_clock; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 26:26]
  wire  inst_fetch_reset; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 26:26]
  wire  inst_fetch_io_stall_flag_ctrl; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 26:26]
  wire  inst_fetch_io_jump_flag_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 26:26]
  wire [31:0] inst_fetch_io_jump_address_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 26:26]
  wire [31:0] inst_fetch_io_rom_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 26:26]
  wire  inst_fetch_io_instruction_valid; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 26:26]
  wire [31:0] inst_fetch_io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 26:26]
  wire [31:0] inst_fetch_io_id_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 26:26]
  wire  if2id_clock; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
  wire  if2id_reset; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
  wire  if2id_io_stall; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
  wire  if2id_io_flush; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
  wire [31:0] if2id_io_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
  wire [31:0] if2id_io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
  wire [31:0] if2id_io_interrupt_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
  wire [31:0] if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
  wire [31:0] if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
  wire [31:0] if2id_io_output_interrupt_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
  wire [31:0] id_io_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [31:0] id_io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [31:0] id_io_reg1_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [31:0] id_io_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [31:0] id_io_forward_from_mem; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [31:0] id_io_forward_from_wb; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [1:0] id_io_reg1_forward; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [1:0] id_io_reg2_forward; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire  id_io_interrupt_assert; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [31:0] id_io_interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [4:0] id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [4:0] id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [31:0] id_io_ex_immediate; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire  id_io_ex_aluop1_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire  id_io_ex_aluop2_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire  id_io_ex_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire  id_io_ex_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [1:0] id_io_ex_reg_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire  id_io_ex_reg_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [4:0] id_io_ex_reg_write_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [11:0] id_io_ex_csr_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire  id_io_ex_csr_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire  id_io_ctrl_jump_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire  id_io_clint_jump_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [31:0] id_io_clint_jump_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire  id_io_if_jump_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire [31:0] id_io_if_jump_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
  wire  id2ex_clock; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_reset; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_flush; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [4:0] id2ex_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [4:0] id2ex_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [4:0] id2ex_io_regs_write_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [1:0] id2ex_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_reg1_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_immediate; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_aluop1_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_aluop2_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_csr_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [11:0] id2ex_io_csr_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_output_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [4:0] id2ex_io_output_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [4:0] id2ex_io_output_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [4:0] id2ex_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [1:0] id2ex_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_output_reg1_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_output_immediate; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_output_aluop1_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_output_aluop2_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_output_csr_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [11:0] id2ex_io_output_csr_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire  id2ex_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
  wire [31:0] ex_io_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [31:0] ex_io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [31:0] ex_io_reg1_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [31:0] ex_io_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [31:0] ex_io_immediate; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire  ex_io_aluop1_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire  ex_io_aluop2_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [31:0] ex_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [31:0] ex_io_forward_from_mem; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [31:0] ex_io_forward_from_wb; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [1:0] ex_io_reg1_forward; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [1:0] ex_io_reg2_forward; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [31:0] ex_io_mem_alu_result; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [31:0] ex_io_mem_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire [31:0] ex_io_csr_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
  wire  ex2mem_clock; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire  ex2mem_reset; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire  ex2mem_io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [1:0] ex2mem_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] ex2mem_io_regs_write_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] ex2mem_io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [2:0] ex2mem_io_funct3; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] ex2mem_io_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire  ex2mem_io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire  ex2mem_io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] ex2mem_io_alu_result; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] ex2mem_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire  ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [1:0] ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] ex2mem_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] ex2mem_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] ex2mem_io_output_funct3; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] ex2mem_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire  ex2mem_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire  ex2mem_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
  wire [31:0] mem_io_alu_result; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire [31:0] mem_io_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire  mem_io_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire  mem_io_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire [2:0] mem_io_funct3; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire [1:0] mem_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire [31:0] mem_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire [31:0] mem_io_wb_memory_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire [31:0] mem_io_forward_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire [31:0] mem_io_bundle_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire [31:0] mem_io_bundle_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire  mem_io_bundle_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire  mem_io_bundle_write_strobe_0; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire  mem_io_bundle_write_strobe_1; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire  mem_io_bundle_write_strobe_2; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire  mem_io_bundle_write_strobe_3; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire [31:0] mem_io_bundle_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
  wire  mem2wb_clock; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire  mem2wb_reset; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [31:0] mem2wb_io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [31:0] mem2wb_io_alu_result; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire  mem2wb_io_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [1:0] mem2wb_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [31:0] mem2wb_io_regs_write_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [31:0] mem2wb_io_memory_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [31:0] mem2wb_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [31:0] mem2wb_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [31:0] mem2wb_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire  mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [1:0] mem2wb_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [31:0] mem2wb_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [31:0] mem2wb_io_output_memory_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [31:0] mem2wb_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
  wire [31:0] wb_io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 34:18]
  wire [31:0] wb_io_alu_result; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 34:18]
  wire [31:0] wb_io_memory_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 34:18]
  wire [1:0] wb_io_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 34:18]
  wire [31:0] wb_io_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 34:18]
  wire [31:0] wb_io_regs_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 34:18]
  wire [4:0] forwarding_io_rs1_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire [4:0] forwarding_io_rs2_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire [4:0] forwarding_io_rs1_ex; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire [4:0] forwarding_io_rs2_ex; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire [4:0] forwarding_io_rd_mem; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire  forwarding_io_reg_write_enable_mem; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire [4:0] forwarding_io_rd_wb; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire  forwarding_io_reg_write_enable_wb; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire [1:0] forwarding_io_reg1_forward_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire [1:0] forwarding_io_reg2_forward_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire [1:0] forwarding_io_reg1_forward_ex; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire [1:0] forwarding_io_reg2_forward_ex; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
  wire [31:0] clint_io_interrupt_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire [31:0] clint_io_instruction_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire [31:0] clint_io_instruction_address_if; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire  clint_io_jump_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire [31:0] clint_io_jump_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire [31:0] clint_io_id_interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire  clint_io_id_interrupt_assert; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire [31:0] clint_io_csr_bundle_mstatus; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire [31:0] clint_io_csr_bundle_mepc; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire [31:0] clint_io_csr_bundle_mcause; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire [31:0] clint_io_csr_bundle_mtvec; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire [31:0] clint_io_csr_bundle_mstatus_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire [31:0] clint_io_csr_bundle_mepc_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire [31:0] clint_io_csr_bundle_mcause_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire  clint_io_csr_bundle_direct_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
  wire  csr_regs_clock; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire  csr_regs_reset; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire [11:0] csr_regs_io_reg_read_address_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire  csr_regs_io_reg_write_enable_ex; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire [11:0] csr_regs_io_reg_write_address_ex; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire [31:0] csr_regs_io_reg_write_data_ex; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire [31:0] csr_regs_io_id_reg_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire [31:0] csr_regs_io_clint_access_bundle_mstatus; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire [31:0] csr_regs_io_clint_access_bundle_mepc; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire [31:0] csr_regs_io_clint_access_bundle_mcause; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire [31:0] csr_regs_io_clint_access_bundle_mtvec; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire [31:0] csr_regs_io_clint_access_bundle_mstatus_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire [31:0] csr_regs_io_clint_access_bundle_mepc_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire [31:0] csr_regs_io_clint_access_bundle_mcause_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  wire  csr_regs_io_clint_access_bundle_direct_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
  Control ctrl ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
    .io_jump_flag(ctrl_io_jump_flag),
    .io_jump_instruction_id(ctrl_io_jump_instruction_id),
    .io_rs1_id(ctrl_io_rs1_id),
    .io_rs2_id(ctrl_io_rs2_id),
    .io_memory_read_enable_ex(ctrl_io_memory_read_enable_ex),
    .io_rd_ex(ctrl_io_rd_ex),
    .io_memory_read_enable_mem(ctrl_io_memory_read_enable_mem),
    .io_rd_mem(ctrl_io_rd_mem),
    .io_if_flush(ctrl_io_if_flush),
    .io_id_flush(ctrl_io_id_flush),
    .io_pc_stall(ctrl_io_pc_stall),
    .io_if_stall(ctrl_io_if_stall)
  );
  RegisterFile regs ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 25:20]
    .clock(regs_clock),
    .reset(regs_reset),
    .io_write_enable(regs_io_write_enable),
    .io_write_address(regs_io_write_address),
    .io_write_data(regs_io_write_data),
    .io_read_address1(regs_io_read_address1),
    .io_read_address2(regs_io_read_address2),
    .io_read_data1(regs_io_read_data1),
    .io_read_data2(regs_io_read_data2)
  );
  InstructionFetch inst_fetch ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 26:26]
    .clock(inst_fetch_clock),
    .reset(inst_fetch_reset),
    .io_stall_flag_ctrl(inst_fetch_io_stall_flag_ctrl),
    .io_jump_flag_id(inst_fetch_io_jump_flag_id),
    .io_jump_address_id(inst_fetch_io_jump_address_id),
    .io_rom_instruction(inst_fetch_io_rom_instruction),
    .io_instruction_valid(inst_fetch_io_instruction_valid),
    .io_instruction_address(inst_fetch_io_instruction_address),
    .io_id_instruction(inst_fetch_io_id_instruction)
  );
  IF2ID if2id ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
    .clock(if2id_clock),
    .reset(if2id_reset),
    .io_stall(if2id_io_stall),
    .io_flush(if2id_io_flush),
    .io_instruction(if2id_io_instruction),
    .io_instruction_address(if2id_io_instruction_address),
    .io_interrupt_flag(if2id_io_interrupt_flag),
    .io_output_instruction(if2id_io_output_instruction),
    .io_output_instruction_address(if2id_io_output_instruction_address),
    .io_output_interrupt_flag(if2id_io_output_interrupt_flag)
  );
  InstructionDecode id ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
    .io_instruction(id_io_instruction),
    .io_instruction_address(id_io_instruction_address),
    .io_reg1_data(id_io_reg1_data),
    .io_reg2_data(id_io_reg2_data),
    .io_forward_from_mem(id_io_forward_from_mem),
    .io_forward_from_wb(id_io_forward_from_wb),
    .io_reg1_forward(id_io_reg1_forward),
    .io_reg2_forward(id_io_reg2_forward),
    .io_interrupt_assert(id_io_interrupt_assert),
    .io_interrupt_handler_address(id_io_interrupt_handler_address),
    .io_regs_reg1_read_address(id_io_regs_reg1_read_address),
    .io_regs_reg2_read_address(id_io_regs_reg2_read_address),
    .io_ex_immediate(id_io_ex_immediate),
    .io_ex_aluop1_source(id_io_ex_aluop1_source),
    .io_ex_aluop2_source(id_io_ex_aluop2_source),
    .io_ex_memory_read_enable(id_io_ex_memory_read_enable),
    .io_ex_memory_write_enable(id_io_ex_memory_write_enable),
    .io_ex_reg_write_source(id_io_ex_reg_write_source),
    .io_ex_reg_write_enable(id_io_ex_reg_write_enable),
    .io_ex_reg_write_address(id_io_ex_reg_write_address),
    .io_ex_csr_address(id_io_ex_csr_address),
    .io_ex_csr_write_enable(id_io_ex_csr_write_enable),
    .io_ctrl_jump_instruction(id_io_ctrl_jump_instruction),
    .io_clint_jump_flag(id_io_clint_jump_flag),
    .io_clint_jump_address(id_io_clint_jump_address),
    .io_if_jump_flag(id_io_if_jump_flag),
    .io_if_jump_address(id_io_if_jump_address)
  );
  ID2EX id2ex ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
    .clock(id2ex_clock),
    .reset(id2ex_reset),
    .io_flush(id2ex_io_flush),
    .io_instruction(id2ex_io_instruction),
    .io_instruction_address(id2ex_io_instruction_address),
    .io_regs_reg1_read_address(id2ex_io_regs_reg1_read_address),
    .io_regs_reg2_read_address(id2ex_io_regs_reg2_read_address),
    .io_regs_write_enable(id2ex_io_regs_write_enable),
    .io_regs_write_address(id2ex_io_regs_write_address),
    .io_regs_write_source(id2ex_io_regs_write_source),
    .io_reg1_data(id2ex_io_reg1_data),
    .io_reg2_data(id2ex_io_reg2_data),
    .io_immediate(id2ex_io_immediate),
    .io_aluop1_source(id2ex_io_aluop1_source),
    .io_aluop2_source(id2ex_io_aluop2_source),
    .io_csr_write_enable(id2ex_io_csr_write_enable),
    .io_csr_address(id2ex_io_csr_address),
    .io_memory_read_enable(id2ex_io_memory_read_enable),
    .io_memory_write_enable(id2ex_io_memory_write_enable),
    .io_csr_read_data(id2ex_io_csr_read_data),
    .io_output_instruction(id2ex_io_output_instruction),
    .io_output_instruction_address(id2ex_io_output_instruction_address),
    .io_output_regs_reg1_read_address(id2ex_io_output_regs_reg1_read_address),
    .io_output_regs_reg2_read_address(id2ex_io_output_regs_reg2_read_address),
    .io_output_regs_write_enable(id2ex_io_output_regs_write_enable),
    .io_output_regs_write_address(id2ex_io_output_regs_write_address),
    .io_output_regs_write_source(id2ex_io_output_regs_write_source),
    .io_output_reg1_data(id2ex_io_output_reg1_data),
    .io_output_reg2_data(id2ex_io_output_reg2_data),
    .io_output_immediate(id2ex_io_output_immediate),
    .io_output_aluop1_source(id2ex_io_output_aluop1_source),
    .io_output_aluop2_source(id2ex_io_output_aluop2_source),
    .io_output_csr_write_enable(id2ex_io_output_csr_write_enable),
    .io_output_csr_address(id2ex_io_output_csr_address),
    .io_output_memory_read_enable(id2ex_io_output_memory_read_enable),
    .io_output_memory_write_enable(id2ex_io_output_memory_write_enable),
    .io_output_csr_read_data(id2ex_io_output_csr_read_data)
  );
  Execute ex ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
    .io_instruction(ex_io_instruction),
    .io_instruction_address(ex_io_instruction_address),
    .io_reg1_data(ex_io_reg1_data),
    .io_reg2_data(ex_io_reg2_data),
    .io_immediate(ex_io_immediate),
    .io_aluop1_source(ex_io_aluop1_source),
    .io_aluop2_source(ex_io_aluop2_source),
    .io_csr_read_data(ex_io_csr_read_data),
    .io_forward_from_mem(ex_io_forward_from_mem),
    .io_forward_from_wb(ex_io_forward_from_wb),
    .io_reg1_forward(ex_io_reg1_forward),
    .io_reg2_forward(ex_io_reg2_forward),
    .io_mem_alu_result(ex_io_mem_alu_result),
    .io_mem_reg2_data(ex_io_mem_reg2_data),
    .io_csr_write_data(ex_io_csr_write_data)
  );
  EX2MEM ex2mem ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
    .clock(ex2mem_clock),
    .reset(ex2mem_reset),
    .io_regs_write_enable(ex2mem_io_regs_write_enable),
    .io_regs_write_source(ex2mem_io_regs_write_source),
    .io_regs_write_address(ex2mem_io_regs_write_address),
    .io_instruction_address(ex2mem_io_instruction_address),
    .io_funct3(ex2mem_io_funct3),
    .io_reg2_data(ex2mem_io_reg2_data),
    .io_memory_read_enable(ex2mem_io_memory_read_enable),
    .io_memory_write_enable(ex2mem_io_memory_write_enable),
    .io_alu_result(ex2mem_io_alu_result),
    .io_csr_read_data(ex2mem_io_csr_read_data),
    .io_output_regs_write_enable(ex2mem_io_output_regs_write_enable),
    .io_output_regs_write_source(ex2mem_io_output_regs_write_source),
    .io_output_regs_write_address(ex2mem_io_output_regs_write_address),
    .io_output_instruction_address(ex2mem_io_output_instruction_address),
    .io_output_funct3(ex2mem_io_output_funct3),
    .io_output_reg2_data(ex2mem_io_output_reg2_data),
    .io_output_memory_read_enable(ex2mem_io_output_memory_read_enable),
    .io_output_memory_write_enable(ex2mem_io_output_memory_write_enable),
    .io_output_alu_result(ex2mem_io_output_alu_result),
    .io_output_csr_read_data(ex2mem_io_output_csr_read_data)
  );
  MemoryAccess mem ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
    .io_alu_result(mem_io_alu_result),
    .io_reg2_data(mem_io_reg2_data),
    .io_memory_read_enable(mem_io_memory_read_enable),
    .io_memory_write_enable(mem_io_memory_write_enable),
    .io_funct3(mem_io_funct3),
    .io_regs_write_source(mem_io_regs_write_source),
    .io_csr_read_data(mem_io_csr_read_data),
    .io_wb_memory_read_data(mem_io_wb_memory_read_data),
    .io_forward_data(mem_io_forward_data),
    .io_bundle_address(mem_io_bundle_address),
    .io_bundle_write_data(mem_io_bundle_write_data),
    .io_bundle_write_enable(mem_io_bundle_write_enable),
    .io_bundle_write_strobe_0(mem_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(mem_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(mem_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(mem_io_bundle_write_strobe_3),
    .io_bundle_read_data(mem_io_bundle_read_data)
  );
  MEM2WB mem2wb ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
    .clock(mem2wb_clock),
    .reset(mem2wb_reset),
    .io_instruction_address(mem2wb_io_instruction_address),
    .io_alu_result(mem2wb_io_alu_result),
    .io_regs_write_enable(mem2wb_io_regs_write_enable),
    .io_regs_write_source(mem2wb_io_regs_write_source),
    .io_regs_write_address(mem2wb_io_regs_write_address),
    .io_memory_read_data(mem2wb_io_memory_read_data),
    .io_csr_read_data(mem2wb_io_csr_read_data),
    .io_output_instruction_address(mem2wb_io_output_instruction_address),
    .io_output_alu_result(mem2wb_io_output_alu_result),
    .io_output_regs_write_enable(mem2wb_io_output_regs_write_enable),
    .io_output_regs_write_source(mem2wb_io_output_regs_write_source),
    .io_output_regs_write_address(mem2wb_io_output_regs_write_address),
    .io_output_memory_read_data(mem2wb_io_output_memory_read_data),
    .io_output_csr_read_data(mem2wb_io_output_csr_read_data)
  );
  WriteBack wb ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 34:18]
    .io_instruction_address(wb_io_instruction_address),
    .io_alu_result(wb_io_alu_result),
    .io_memory_read_data(wb_io_memory_read_data),
    .io_regs_write_source(wb_io_regs_write_source),
    .io_csr_read_data(wb_io_csr_read_data),
    .io_regs_write_data(wb_io_regs_write_data)
  );
  Forwarding forwarding ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
    .io_rs1_id(forwarding_io_rs1_id),
    .io_rs2_id(forwarding_io_rs2_id),
    .io_rs1_ex(forwarding_io_rs1_ex),
    .io_rs2_ex(forwarding_io_rs2_ex),
    .io_rd_mem(forwarding_io_rd_mem),
    .io_reg_write_enable_mem(forwarding_io_reg_write_enable_mem),
    .io_rd_wb(forwarding_io_rd_wb),
    .io_reg_write_enable_wb(forwarding_io_reg_write_enable_wb),
    .io_reg1_forward_id(forwarding_io_reg1_forward_id),
    .io_reg2_forward_id(forwarding_io_reg2_forward_id),
    .io_reg1_forward_ex(forwarding_io_reg1_forward_ex),
    .io_reg2_forward_ex(forwarding_io_reg2_forward_ex)
  );
  CLINT clint ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
    .io_interrupt_flag(clint_io_interrupt_flag),
    .io_instruction_id(clint_io_instruction_id),
    .io_instruction_address_if(clint_io_instruction_address_if),
    .io_jump_flag(clint_io_jump_flag),
    .io_jump_address(clint_io_jump_address),
    .io_id_interrupt_handler_address(clint_io_id_interrupt_handler_address),
    .io_id_interrupt_assert(clint_io_id_interrupt_assert),
    .io_csr_bundle_mstatus(clint_io_csr_bundle_mstatus),
    .io_csr_bundle_mepc(clint_io_csr_bundle_mepc),
    .io_csr_bundle_mcause(clint_io_csr_bundle_mcause),
    .io_csr_bundle_mtvec(clint_io_csr_bundle_mtvec),
    .io_csr_bundle_mstatus_write_data(clint_io_csr_bundle_mstatus_write_data),
    .io_csr_bundle_mepc_write_data(clint_io_csr_bundle_mepc_write_data),
    .io_csr_bundle_mcause_write_data(clint_io_csr_bundle_mcause_write_data),
    .io_csr_bundle_direct_write_enable(clint_io_csr_bundle_direct_write_enable)
  );
  CSR csr_regs ( // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
    .clock(csr_regs_clock),
    .reset(csr_regs_reset),
    .io_reg_read_address_id(csr_regs_io_reg_read_address_id),
    .io_reg_write_enable_ex(csr_regs_io_reg_write_enable_ex),
    .io_reg_write_address_ex(csr_regs_io_reg_write_address_ex),
    .io_reg_write_data_ex(csr_regs_io_reg_write_data_ex),
    .io_id_reg_read_data(csr_regs_io_id_reg_read_data),
    .io_clint_access_bundle_mstatus(csr_regs_io_clint_access_bundle_mstatus),
    .io_clint_access_bundle_mepc(csr_regs_io_clint_access_bundle_mepc),
    .io_clint_access_bundle_mcause(csr_regs_io_clint_access_bundle_mcause),
    .io_clint_access_bundle_mtvec(csr_regs_io_clint_access_bundle_mtvec),
    .io_clint_access_bundle_mstatus_write_data(csr_regs_io_clint_access_bundle_mstatus_write_data),
    .io_clint_access_bundle_mepc_write_data(csr_regs_io_clint_access_bundle_mepc_write_data),
    .io_clint_access_bundle_mcause_write_data(csr_regs_io_clint_access_bundle_mcause_write_data),
    .io_clint_access_bundle_direct_write_enable(csr_regs_io_clint_access_bundle_direct_write_enable)
  );
  assign io_instruction_address = inst_fetch_io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 57:26]
  assign io_memory_bundle_address = {3'h0,mem_io_bundle_address[28:0]}; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 133:70]
  assign io_memory_bundle_write_data = mem_io_bundle_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 132:20]
  assign io_memory_bundle_write_enable = mem_io_bundle_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 132:20]
  assign io_memory_bundle_write_strobe_0 = mem_io_bundle_write_strobe_0; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 132:20]
  assign io_memory_bundle_write_strobe_1 = mem_io_bundle_write_strobe_1; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 132:20]
  assign io_memory_bundle_write_strobe_2 = mem_io_bundle_write_strobe_2; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 132:20]
  assign io_memory_bundle_write_strobe_3 = mem_io_bundle_write_strobe_3; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 132:20]
  assign io_device_select = mem_io_bundle_address[31:29]; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 131:44]
  assign ctrl_io_jump_flag = id_io_if_jump_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 39:21]
  assign ctrl_io_jump_instruction_id = id_io_ctrl_jump_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 40:31]
  assign ctrl_io_rs1_id = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 41:18]
  assign ctrl_io_rs2_id = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 42:18]
  assign ctrl_io_memory_read_enable_ex = id2ex_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 43:33]
  assign ctrl_io_rd_ex = id2ex_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 44:17]
  assign ctrl_io_memory_read_enable_mem = ex2mem_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 45:34]
  assign ctrl_io_rd_mem = ex2mem_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 46:18]
  assign regs_clock = clock;
  assign regs_reset = reset;
  assign regs_io_write_enable = mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 48:24]
  assign regs_io_write_address = mem2wb_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 49:25]
  assign regs_io_write_data = wb_io_regs_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 50:22]
  assign regs_io_read_address1 = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 51:25]
  assign regs_io_read_address2 = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 52:25]
  assign inst_fetch_clock = clock;
  assign inst_fetch_reset = reset;
  assign inst_fetch_io_stall_flag_ctrl = ctrl_io_pc_stall; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 58:33]
  assign inst_fetch_io_jump_flag_id = id_io_if_jump_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 59:30]
  assign inst_fetch_io_jump_address_id = id_io_if_jump_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 60:33]
  assign inst_fetch_io_rom_instruction = io_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 61:33]
  assign inst_fetch_io_instruction_valid = io_instruction_valid; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 62:35]
  assign if2id_clock = clock;
  assign if2id_reset = reset;
  assign if2id_io_stall = ctrl_io_if_stall; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 64:18]
  assign if2id_io_flush = ctrl_io_if_flush; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 65:18]
  assign if2id_io_instruction = inst_fetch_io_id_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 66:24]
  assign if2id_io_instruction_address = inst_fetch_io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 67:32]
  assign if2id_io_interrupt_flag = io_interrupt_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 68:27]
  assign id_io_instruction = if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 70:21]
  assign id_io_instruction_address = if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 71:29]
  assign id_io_reg1_data = regs_io_read_data1; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 72:19]
  assign id_io_reg2_data = regs_io_read_data2; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 73:19]
  assign id_io_forward_from_mem = mem_io_forward_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 74:26]
  assign id_io_forward_from_wb = wb_io_regs_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 75:25]
  assign id_io_reg1_forward = forwarding_io_reg1_forward_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 76:22]
  assign id_io_reg2_forward = forwarding_io_reg2_forward_id; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 77:22]
  assign id_io_interrupt_assert = clint_io_id_interrupt_assert; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 78:26]
  assign id_io_interrupt_handler_address = clint_io_id_interrupt_handler_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 79:35]
  assign id2ex_clock = clock;
  assign id2ex_reset = reset;
  assign id2ex_io_flush = ctrl_io_id_flush; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 81:18]
  assign id2ex_io_instruction = if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 82:24]
  assign id2ex_io_instruction_address = if2id_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 83:32]
  assign id2ex_io_regs_reg1_read_address = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 86:35]
  assign id2ex_io_regs_reg2_read_address = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 87:35]
  assign id2ex_io_regs_write_enable = id_io_ex_reg_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 88:30]
  assign id2ex_io_regs_write_address = id_io_ex_reg_write_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 89:31]
  assign id2ex_io_regs_write_source = id_io_ex_reg_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 90:30]
  assign id2ex_io_reg1_data = regs_io_read_data1; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 84:22]
  assign id2ex_io_reg2_data = regs_io_read_data2; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 85:22]
  assign id2ex_io_immediate = id_io_ex_immediate; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 91:22]
  assign id2ex_io_aluop1_source = id_io_ex_aluop1_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 92:26]
  assign id2ex_io_aluop2_source = id_io_ex_aluop2_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 93:26]
  assign id2ex_io_csr_write_enable = id_io_ex_csr_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 94:29]
  assign id2ex_io_csr_address = id_io_ex_csr_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 95:24]
  assign id2ex_io_memory_read_enable = id_io_ex_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 96:31]
  assign id2ex_io_memory_write_enable = id_io_ex_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 97:32]
  assign id2ex_io_csr_read_data = csr_regs_io_id_reg_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 98:26]
  assign ex_io_instruction = id2ex_io_output_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 100:21]
  assign ex_io_instruction_address = id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 101:29]
  assign ex_io_reg1_data = id2ex_io_output_reg1_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 102:19]
  assign ex_io_reg2_data = id2ex_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 103:19]
  assign ex_io_immediate = id2ex_io_output_immediate; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 104:19]
  assign ex_io_aluop1_source = id2ex_io_output_aluop1_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 105:23]
  assign ex_io_aluop2_source = id2ex_io_output_aluop2_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 106:23]
  assign ex_io_csr_read_data = id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 107:23]
  assign ex_io_forward_from_mem = mem_io_forward_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 108:26]
  assign ex_io_forward_from_wb = wb_io_regs_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 109:25]
  assign ex_io_reg1_forward = forwarding_io_reg1_forward_ex; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 110:22]
  assign ex_io_reg2_forward = forwarding_io_reg2_forward_ex; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 111:22]
  assign ex2mem_clock = clock;
  assign ex2mem_reset = reset;
  assign ex2mem_io_regs_write_enable = id2ex_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 113:31]
  assign ex2mem_io_regs_write_source = id2ex_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 114:31]
  assign ex2mem_io_regs_write_address = {{27'd0}, id2ex_io_output_regs_write_address}; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 115:32]
  assign ex2mem_io_instruction_address = id2ex_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 116:33]
  assign ex2mem_io_funct3 = id2ex_io_output_instruction[14:12]; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 117:50]
  assign ex2mem_io_reg2_data = ex_io_mem_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 118:23]
  assign ex2mem_io_memory_read_enable = id2ex_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 119:32]
  assign ex2mem_io_memory_write_enable = id2ex_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 120:33]
  assign ex2mem_io_alu_result = ex_io_mem_alu_result; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 121:24]
  assign ex2mem_io_csr_read_data = id2ex_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 122:27]
  assign mem_io_alu_result = ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 124:21]
  assign mem_io_reg2_data = ex2mem_io_output_reg2_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 125:20]
  assign mem_io_memory_read_enable = ex2mem_io_output_memory_read_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 126:29]
  assign mem_io_memory_write_enable = ex2mem_io_output_memory_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 127:30]
  assign mem_io_funct3 = ex2mem_io_output_funct3[2:0]; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 128:17]
  assign mem_io_regs_write_source = ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 129:28]
  assign mem_io_csr_read_data = ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 130:24]
  assign mem_io_bundle_read_data = io_memory_bundle_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 132:20]
  assign mem2wb_clock = clock;
  assign mem2wb_reset = reset;
  assign mem2wb_io_instruction_address = ex2mem_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 135:33]
  assign mem2wb_io_alu_result = ex2mem_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 136:24]
  assign mem2wb_io_regs_write_enable = ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 137:31]
  assign mem2wb_io_regs_write_source = ex2mem_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 138:31]
  assign mem2wb_io_regs_write_address = ex2mem_io_output_regs_write_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 139:32]
  assign mem2wb_io_memory_read_data = mem_io_wb_memory_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 140:30]
  assign mem2wb_io_csr_read_data = ex2mem_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 141:27]
  assign wb_io_instruction_address = mem2wb_io_output_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 143:29]
  assign wb_io_alu_result = mem2wb_io_output_alu_result; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 144:20]
  assign wb_io_memory_read_data = mem2wb_io_output_memory_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 145:26]
  assign wb_io_regs_write_source = mem2wb_io_output_regs_write_source; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 146:27]
  assign wb_io_csr_read_data = mem2wb_io_output_csr_read_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 147:23]
  assign forwarding_io_rs1_id = id_io_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 149:24]
  assign forwarding_io_rs2_id = id_io_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 150:24]
  assign forwarding_io_rs1_ex = id2ex_io_output_regs_reg1_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 151:24]
  assign forwarding_io_rs2_ex = id2ex_io_output_regs_reg2_read_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 152:24]
  assign forwarding_io_rd_mem = ex2mem_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 153:24]
  assign forwarding_io_reg_write_enable_mem = ex2mem_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 154:38]
  assign forwarding_io_rd_wb = mem2wb_io_output_regs_write_address[4:0]; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 155:23]
  assign forwarding_io_reg_write_enable_wb = mem2wb_io_output_regs_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 156:37]
  assign clint_io_interrupt_flag = if2id_io_output_interrupt_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 162:27]
  assign clint_io_instruction_id = if2id_io_output_instruction; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 159:27]
  assign clint_io_instruction_address_if = inst_fetch_io_instruction_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 158:35]
  assign clint_io_jump_flag = id_io_clint_jump_flag; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 160:22]
  assign clint_io_jump_address = id_io_clint_jump_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 161:25]
  assign clint_io_csr_bundle_mstatus = csr_regs_io_clint_access_bundle_mstatus; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 163:23]
  assign clint_io_csr_bundle_mepc = csr_regs_io_clint_access_bundle_mepc; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 163:23]
  assign clint_io_csr_bundle_mcause = csr_regs_io_clint_access_bundle_mcause; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 163:23]
  assign clint_io_csr_bundle_mtvec = csr_regs_io_clint_access_bundle_mtvec; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 163:23]
  assign csr_regs_clock = clock;
  assign csr_regs_reset = reset;
  assign csr_regs_io_reg_read_address_id = id_io_ex_csr_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 165:35]
  assign csr_regs_io_reg_write_enable_ex = id2ex_io_output_csr_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 166:35]
  assign csr_regs_io_reg_write_address_ex = id2ex_io_output_csr_address; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 167:36]
  assign csr_regs_io_reg_write_data_ex = ex_io_csr_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 168:33]
  assign csr_regs_io_clint_access_bundle_mstatus_write_data = clint_io_csr_bundle_mstatus_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 163:23]
  assign csr_regs_io_clint_access_bundle_mepc_write_data = clint_io_csr_bundle_mepc_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 163:23]
  assign csr_regs_io_clint_access_bundle_mcause_write_data = clint_io_csr_bundle_mcause_write_data; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 163:23]
  assign csr_regs_io_clint_access_bundle_direct_write_enable = clint_io_csr_bundle_direct_write_enable; // @[src/main/scala/riscv/core/fivestage_final/CPU.scala 163:23]
endmodule
module CPU_1(
  input         clock,
  input         reset,
  output [31:0] io_instruction_address, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  input  [31:0] io_instruction, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  input         io_instruction_valid, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  output [31:0] io_memory_bundle_address, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  output [31:0] io_memory_bundle_write_data, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  output        io_memory_bundle_write_enable, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  output        io_memory_bundle_write_strobe_0, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  output        io_memory_bundle_write_strobe_1, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  output        io_memory_bundle_write_strobe_2, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  output        io_memory_bundle_write_strobe_3, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  input  [31:0] io_memory_bundle_read_data, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  output [2:0]  io_device_select, // @[src/main/scala/riscv/core/CPU.scala 25:14]
  input  [31:0] io_interrupt_flag // @[src/main/scala/riscv/core/CPU.scala 25:14]
);
  wire  cpu_clock; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire  cpu_reset; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire [31:0] cpu_io_instruction_address; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire [31:0] cpu_io_instruction; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire  cpu_io_instruction_valid; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire [31:0] cpu_io_memory_bundle_address; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire [31:0] cpu_io_memory_bundle_write_data; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire  cpu_io_memory_bundle_write_enable; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire  cpu_io_memory_bundle_write_strobe_0; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire  cpu_io_memory_bundle_write_strobe_1; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire  cpu_io_memory_bundle_write_strobe_2; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire  cpu_io_memory_bundle_write_strobe_3; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire [31:0] cpu_io_memory_bundle_read_data; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire [2:0] cpu_io_device_select; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  wire [31:0] cpu_io_interrupt_flag; // @[src/main/scala/riscv/core/CPU.scala 37:23]
  CPU cpu ( // @[src/main/scala/riscv/core/CPU.scala 37:23]
    .clock(cpu_clock),
    .reset(cpu_reset),
    .io_instruction_address(cpu_io_instruction_address),
    .io_instruction(cpu_io_instruction),
    .io_instruction_valid(cpu_io_instruction_valid),
    .io_memory_bundle_address(cpu_io_memory_bundle_address),
    .io_memory_bundle_write_data(cpu_io_memory_bundle_write_data),
    .io_memory_bundle_write_enable(cpu_io_memory_bundle_write_enable),
    .io_memory_bundle_write_strobe_0(cpu_io_memory_bundle_write_strobe_0),
    .io_memory_bundle_write_strobe_1(cpu_io_memory_bundle_write_strobe_1),
    .io_memory_bundle_write_strobe_2(cpu_io_memory_bundle_write_strobe_2),
    .io_memory_bundle_write_strobe_3(cpu_io_memory_bundle_write_strobe_3),
    .io_memory_bundle_read_data(cpu_io_memory_bundle_read_data),
    .io_device_select(cpu_io_device_select),
    .io_interrupt_flag(cpu_io_interrupt_flag)
  );
  assign io_instruction_address = cpu_io_instruction_address; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign io_memory_bundle_address = cpu_io_memory_bundle_address; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign io_memory_bundle_write_data = cpu_io_memory_bundle_write_data; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign io_memory_bundle_write_enable = cpu_io_memory_bundle_write_enable; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign io_memory_bundle_write_strobe_0 = cpu_io_memory_bundle_write_strobe_0; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign io_memory_bundle_write_strobe_1 = cpu_io_memory_bundle_write_strobe_1; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign io_memory_bundle_write_strobe_2 = cpu_io_memory_bundle_write_strobe_2; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign io_memory_bundle_write_strobe_3 = cpu_io_memory_bundle_write_strobe_3; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign io_device_select = cpu_io_device_select; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign cpu_clock = clock;
  assign cpu_reset = reset;
  assign cpu_io_instruction = io_instruction; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign cpu_io_instruction_valid = io_instruction_valid; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign cpu_io_memory_bundle_read_data = io_memory_bundle_read_data; // @[src/main/scala/riscv/core/CPU.scala 38:14]
  assign cpu_io_interrupt_flag = io_interrupt_flag; // @[src/main/scala/riscv/core/CPU.scala 38:14]
endmodule
module Top(
  input   clock,
  input   reset,
  output  io_tx, // @[src/main/scala/board/z710/Top.scala 25:14]
  input   io_rx, // @[src/main/scala/board/z710/Top.scala 25:14]
  output  io_led // @[src/main/scala/board/z710/Top.scala 25:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  mem_clock; // @[src/main/scala/board/z710/Top.scala 35:19]
  wire [31:0] mem_io_bundle_address; // @[src/main/scala/board/z710/Top.scala 35:19]
  wire [31:0] mem_io_bundle_write_data; // @[src/main/scala/board/z710/Top.scala 35:19]
  wire  mem_io_bundle_write_enable; // @[src/main/scala/board/z710/Top.scala 35:19]
  wire  mem_io_bundle_write_strobe_0; // @[src/main/scala/board/z710/Top.scala 35:19]
  wire  mem_io_bundle_write_strobe_1; // @[src/main/scala/board/z710/Top.scala 35:19]
  wire  mem_io_bundle_write_strobe_2; // @[src/main/scala/board/z710/Top.scala 35:19]
  wire  mem_io_bundle_write_strobe_3; // @[src/main/scala/board/z710/Top.scala 35:19]
  wire [31:0] mem_io_bundle_read_data; // @[src/main/scala/board/z710/Top.scala 35:19]
  wire [31:0] mem_io_instruction; // @[src/main/scala/board/z710/Top.scala 35:19]
  wire [31:0] mem_io_instruction_address; // @[src/main/scala/board/z710/Top.scala 35:19]
  wire  timer_clock; // @[src/main/scala/board/z710/Top.scala 38:21]
  wire  timer_reset; // @[src/main/scala/board/z710/Top.scala 38:21]
  wire [31:0] timer_io_bundle_address; // @[src/main/scala/board/z710/Top.scala 38:21]
  wire [31:0] timer_io_bundle_write_data; // @[src/main/scala/board/z710/Top.scala 38:21]
  wire  timer_io_bundle_write_enable; // @[src/main/scala/board/z710/Top.scala 38:21]
  wire [31:0] timer_io_bundle_read_data; // @[src/main/scala/board/z710/Top.scala 38:21]
  wire  timer_io_signal_interrupt; // @[src/main/scala/board/z710/Top.scala 38:21]
  wire  uart_clock; // @[src/main/scala/board/z710/Top.scala 39:20]
  wire  uart_reset; // @[src/main/scala/board/z710/Top.scala 39:20]
  wire [31:0] uart_io_bundle_address; // @[src/main/scala/board/z710/Top.scala 39:20]
  wire [31:0] uart_io_bundle_write_data; // @[src/main/scala/board/z710/Top.scala 39:20]
  wire  uart_io_bundle_write_enable; // @[src/main/scala/board/z710/Top.scala 39:20]
  wire [31:0] uart_io_bundle_read_data; // @[src/main/scala/board/z710/Top.scala 39:20]
  wire  uart_io_rxd; // @[src/main/scala/board/z710/Top.scala 39:20]
  wire  uart_io_txd; // @[src/main/scala/board/z710/Top.scala 39:20]
  wire  uart_io_signal_interrupt; // @[src/main/scala/board/z710/Top.scala 39:20]
  wire  instruction_rom_clock; // @[src/main/scala/board/z710/Top.scala 50:31]
  wire [31:0] instruction_rom_io_address; // @[src/main/scala/board/z710/Top.scala 50:31]
  wire [31:0] instruction_rom_io_data; // @[src/main/scala/board/z710/Top.scala 50:31]
  wire  rom_loader_clock; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire  rom_loader_reset; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire [31:0] rom_loader_io_bundle_address; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire [31:0] rom_loader_io_bundle_write_data; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire  rom_loader_io_bundle_write_enable; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire  rom_loader_io_bundle_write_strobe_0; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire  rom_loader_io_bundle_write_strobe_1; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire  rom_loader_io_bundle_write_strobe_2; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire  rom_loader_io_bundle_write_strobe_3; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire [31:0] rom_loader_io_rom_address; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire [31:0] rom_loader_io_rom_data; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire  rom_loader_io_load_finished; // @[src/main/scala/board/z710/Top.scala 51:26]
  wire  cpu_clock; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire  cpu_reset; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire [31:0] cpu_io_instruction_address; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire [31:0] cpu_io_instruction; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire  cpu_io_instruction_valid; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire [31:0] cpu_io_memory_bundle_address; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire [31:0] cpu_io_memory_bundle_write_data; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire  cpu_io_memory_bundle_write_enable; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire  cpu_io_memory_bundle_write_strobe_0; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire  cpu_io_memory_bundle_write_strobe_1; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire  cpu_io_memory_bundle_write_strobe_2; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire  cpu_io_memory_bundle_write_strobe_3; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire [31:0] cpu_io_memory_bundle_read_data; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire [2:0] cpu_io_device_select; // @[src/main/scala/board/z710/Top.scala 65:21]
  wire [31:0] cpu_io_interrupt_flag; // @[src/main/scala/board/z710/Top.scala 65:21]
  reg [1:0] CPU_clkdiv; // @[src/main/scala/board/z710/Top.scala 57:27]
  wire [1:0] _CPU_next_T_2 = CPU_clkdiv + 2'h1; // @[src/main/scala/board/z710/Top.scala 60:55]
  wire [1:0] _cpu_io_interrupt_flag_T = {uart_io_signal_interrupt,timer_io_signal_interrupt}; // @[src/main/scala/board/z710/Top.scala 66:33]
  wire [31:0] _GEN_0 = cpu_io_device_select == 3'h2 ? cpu_io_memory_bundle_address : 32'h0; // @[src/main/scala/board/z710/Top.scala 46:18 79:48 80:30]
  wire [31:0] _GEN_1 = cpu_io_device_select == 3'h2 ? cpu_io_memory_bundle_write_data : 32'h0; // @[src/main/scala/board/z710/Top.scala 46:18 79:48 80:30]
  wire  _GEN_2 = cpu_io_device_select == 3'h2 & cpu_io_memory_bundle_write_enable; // @[src/main/scala/board/z710/Top.scala 46:18 79:48 80:30]
  wire [31:0] _GEN_7 = cpu_io_device_select == 3'h2 ? uart_io_bundle_read_data : mem_io_bundle_read_data; // @[src/main/scala/board/z710/Top.scala 79:48 80:30 82:30]
  wire [31:0] _GEN_8 = cpu_io_device_select == 3'h2 ? 32'h0 : cpu_io_memory_bundle_address; // @[src/main/scala/board/z710/Top.scala 43:17 79:48 82:30]
  wire [31:0] _GEN_9 = cpu_io_device_select == 3'h2 ? 32'h0 : cpu_io_memory_bundle_write_data; // @[src/main/scala/board/z710/Top.scala 43:17 79:48 82:30]
  wire  _GEN_10 = cpu_io_device_select == 3'h2 ? 1'h0 : cpu_io_memory_bundle_write_enable; // @[src/main/scala/board/z710/Top.scala 43:17 79:48 82:30]
  wire  _GEN_11 = cpu_io_device_select == 3'h2 ? 1'h0 : cpu_io_memory_bundle_write_strobe_0; // @[src/main/scala/board/z710/Top.scala 43:17 79:48 82:30]
  wire  _GEN_12 = cpu_io_device_select == 3'h2 ? 1'h0 : cpu_io_memory_bundle_write_strobe_1; // @[src/main/scala/board/z710/Top.scala 43:17 79:48 82:30]
  wire  _GEN_13 = cpu_io_device_select == 3'h2 ? 1'h0 : cpu_io_memory_bundle_write_strobe_2; // @[src/main/scala/board/z710/Top.scala 43:17 79:48 82:30]
  wire  _GEN_14 = cpu_io_device_select == 3'h2 ? 1'h0 : cpu_io_memory_bundle_write_strobe_3; // @[src/main/scala/board/z710/Top.scala 43:17 79:48 82:30]
  wire [31:0] _GEN_15 = cpu_io_device_select == 3'h4 ? cpu_io_memory_bundle_address : 32'h0; // @[src/main/scala/board/z710/Top.scala 45:19 77:42 78:30]
  wire [31:0] _GEN_16 = cpu_io_device_select == 3'h4 ? cpu_io_memory_bundle_write_data : 32'h0; // @[src/main/scala/board/z710/Top.scala 45:19 77:42 78:30]
  wire  _GEN_17 = cpu_io_device_select == 3'h4 & cpu_io_memory_bundle_write_enable; // @[src/main/scala/board/z710/Top.scala 45:19 77:42 78:30]
  wire [31:0] _GEN_22 = cpu_io_device_select == 3'h4 ? timer_io_bundle_read_data : _GEN_7; // @[src/main/scala/board/z710/Top.scala 77:42 78:30]
  wire [31:0] _GEN_23 = cpu_io_device_select == 3'h4 ? 32'h0 : _GEN_0; // @[src/main/scala/board/z710/Top.scala 46:18 77:42]
  wire [31:0] _GEN_24 = cpu_io_device_select == 3'h4 ? 32'h0 : _GEN_1; // @[src/main/scala/board/z710/Top.scala 46:18 77:42]
  wire  _GEN_25 = cpu_io_device_select == 3'h4 ? 1'h0 : _GEN_2; // @[src/main/scala/board/z710/Top.scala 46:18 77:42]
  wire [31:0] _GEN_30 = cpu_io_device_select == 3'h4 ? 32'h0 : _GEN_8; // @[src/main/scala/board/z710/Top.scala 43:17 77:42]
  wire [31:0] _GEN_31 = cpu_io_device_select == 3'h4 ? 32'h0 : _GEN_9; // @[src/main/scala/board/z710/Top.scala 43:17 77:42]
  wire  _GEN_32 = cpu_io_device_select == 3'h4 ? 1'h0 : _GEN_10; // @[src/main/scala/board/z710/Top.scala 43:17 77:42]
  wire  _GEN_33 = cpu_io_device_select == 3'h4 ? 1'h0 : _GEN_11; // @[src/main/scala/board/z710/Top.scala 43:17 77:42]
  wire  _GEN_34 = cpu_io_device_select == 3'h4 ? 1'h0 : _GEN_12; // @[src/main/scala/board/z710/Top.scala 43:17 77:42]
  wire  _GEN_35 = cpu_io_device_select == 3'h4 ? 1'h0 : _GEN_13; // @[src/main/scala/board/z710/Top.scala 43:17 77:42]
  wire  _GEN_36 = cpu_io_device_select == 3'h4 ? 1'h0 : _GEN_14; // @[src/main/scala/board/z710/Top.scala 43:17 77:42]
  reg [31:0] led_count; // @[src/main/scala/board/z710/Top.scala 88:26]
  wire [31:0] _led_count_T_1 = led_count + 32'h1; // @[src/main/scala/board/z710/Top.scala 92:28]
  Memory mem ( // @[src/main/scala/board/z710/Top.scala 35:19]
    .clock(mem_clock),
    .io_bundle_address(mem_io_bundle_address),
    .io_bundle_write_data(mem_io_bundle_write_data),
    .io_bundle_write_enable(mem_io_bundle_write_enable),
    .io_bundle_write_strobe_0(mem_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(mem_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(mem_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(mem_io_bundle_write_strobe_3),
    .io_bundle_read_data(mem_io_bundle_read_data),
    .io_instruction(mem_io_instruction),
    .io_instruction_address(mem_io_instruction_address)
  );
  Timer timer ( // @[src/main/scala/board/z710/Top.scala 38:21]
    .clock(timer_clock),
    .reset(timer_reset),
    .io_bundle_address(timer_io_bundle_address),
    .io_bundle_write_data(timer_io_bundle_write_data),
    .io_bundle_write_enable(timer_io_bundle_write_enable),
    .io_bundle_read_data(timer_io_bundle_read_data),
    .io_signal_interrupt(timer_io_signal_interrupt)
  );
  Uart uart ( // @[src/main/scala/board/z710/Top.scala 39:20]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_bundle_address(uart_io_bundle_address),
    .io_bundle_write_data(uart_io_bundle_write_data),
    .io_bundle_write_enable(uart_io_bundle_write_enable),
    .io_bundle_read_data(uart_io_bundle_read_data),
    .io_rxd(uart_io_rxd),
    .io_txd(uart_io_txd),
    .io_signal_interrupt(uart_io_signal_interrupt)
  );
  InstructionROM instruction_rom ( // @[src/main/scala/board/z710/Top.scala 50:31]
    .clock(instruction_rom_clock),
    .io_address(instruction_rom_io_address),
    .io_data(instruction_rom_io_data)
  );
  ROMLoader rom_loader ( // @[src/main/scala/board/z710/Top.scala 51:26]
    .clock(rom_loader_clock),
    .reset(rom_loader_reset),
    .io_bundle_address(rom_loader_io_bundle_address),
    .io_bundle_write_data(rom_loader_io_bundle_write_data),
    .io_bundle_write_enable(rom_loader_io_bundle_write_enable),
    .io_bundle_write_strobe_0(rom_loader_io_bundle_write_strobe_0),
    .io_bundle_write_strobe_1(rom_loader_io_bundle_write_strobe_1),
    .io_bundle_write_strobe_2(rom_loader_io_bundle_write_strobe_2),
    .io_bundle_write_strobe_3(rom_loader_io_bundle_write_strobe_3),
    .io_rom_address(rom_loader_io_rom_address),
    .io_rom_data(rom_loader_io_rom_data),
    .io_load_finished(rom_loader_io_load_finished)
  );
  CPU_1 cpu ( // @[src/main/scala/board/z710/Top.scala 65:21]
    .clock(cpu_clock),
    .reset(cpu_reset),
    .io_instruction_address(cpu_io_instruction_address),
    .io_instruction(cpu_io_instruction),
    .io_instruction_valid(cpu_io_instruction_valid),
    .io_memory_bundle_address(cpu_io_memory_bundle_address),
    .io_memory_bundle_write_data(cpu_io_memory_bundle_write_data),
    .io_memory_bundle_write_enable(cpu_io_memory_bundle_write_enable),
    .io_memory_bundle_write_strobe_0(cpu_io_memory_bundle_write_strobe_0),
    .io_memory_bundle_write_strobe_1(cpu_io_memory_bundle_write_strobe_1),
    .io_memory_bundle_write_strobe_2(cpu_io_memory_bundle_write_strobe_2),
    .io_memory_bundle_write_strobe_3(cpu_io_memory_bundle_write_strobe_3),
    .io_memory_bundle_read_data(cpu_io_memory_bundle_read_data),
    .io_device_select(cpu_io_device_select),
    .io_interrupt_flag(cpu_io_interrupt_flag)
  );
  assign io_tx = uart_io_txd; // @[src/main/scala/board/z710/Top.scala 47:9]
  assign io_led = led_count >= 32'hbebc20; // @[src/main/scala/board/z710/Top.scala 94:24]
  assign mem_clock = clock;
  assign mem_io_bundle_address = ~rom_loader_io_load_finished ? rom_loader_io_bundle_address : _GEN_30; // @[src/main/scala/board/z710/Top.scala 72:40 73:28]
  assign mem_io_bundle_write_data = ~rom_loader_io_load_finished ? rom_loader_io_bundle_write_data : _GEN_31; // @[src/main/scala/board/z710/Top.scala 72:40 73:28]
  assign mem_io_bundle_write_enable = ~rom_loader_io_load_finished ? rom_loader_io_bundle_write_enable : _GEN_32; // @[src/main/scala/board/z710/Top.scala 72:40 73:28]
  assign mem_io_bundle_write_strobe_0 = ~rom_loader_io_load_finished ? rom_loader_io_bundle_write_strobe_0 : _GEN_33; // @[src/main/scala/board/z710/Top.scala 72:40 73:28]
  assign mem_io_bundle_write_strobe_1 = ~rom_loader_io_load_finished ? rom_loader_io_bundle_write_strobe_1 : _GEN_34; // @[src/main/scala/board/z710/Top.scala 72:40 73:28]
  assign mem_io_bundle_write_strobe_2 = ~rom_loader_io_load_finished ? rom_loader_io_bundle_write_strobe_2 : _GEN_35; // @[src/main/scala/board/z710/Top.scala 72:40 73:28]
  assign mem_io_bundle_write_strobe_3 = ~rom_loader_io_load_finished ? rom_loader_io_bundle_write_strobe_3 : _GEN_36; // @[src/main/scala/board/z710/Top.scala 72:40 73:28]
  assign mem_io_instruction_address = cpu_io_instruction_address; // @[src/main/scala/board/z710/Top.scala 68:32]
  assign timer_clock = clock;
  assign timer_reset = reset;
  assign timer_io_bundle_address = ~rom_loader_io_load_finished ? 32'h0 : _GEN_15; // @[src/main/scala/board/z710/Top.scala 45:19 72:40]
  assign timer_io_bundle_write_data = ~rom_loader_io_load_finished ? 32'h0 : _GEN_16; // @[src/main/scala/board/z710/Top.scala 45:19 72:40]
  assign timer_io_bundle_write_enable = ~rom_loader_io_load_finished ? 1'h0 : _GEN_17; // @[src/main/scala/board/z710/Top.scala 45:19 72:40]
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_bundle_address = ~rom_loader_io_load_finished ? 32'h0 : _GEN_23; // @[src/main/scala/board/z710/Top.scala 46:18 72:40]
  assign uart_io_bundle_write_data = ~rom_loader_io_load_finished ? 32'h0 : _GEN_24; // @[src/main/scala/board/z710/Top.scala 46:18 72:40]
  assign uart_io_bundle_write_enable = ~rom_loader_io_load_finished ? 1'h0 : _GEN_25; // @[src/main/scala/board/z710/Top.scala 46:18 72:40]
  assign uart_io_rxd = io_rx; // @[src/main/scala/board/z710/Top.scala 48:15]
  assign instruction_rom_clock = clock;
  assign instruction_rom_io_address = rom_loader_io_rom_address; // @[src/main/scala/board/z710/Top.scala 55:30]
  assign rom_loader_clock = clock;
  assign rom_loader_reset = reset;
  assign rom_loader_io_rom_data = instruction_rom_io_data; // @[src/main/scala/board/z710/Top.scala 53:26]
  assign cpu_clock = CPU_clkdiv == 2'h0; // @[src/main/scala/board/z710/Top.scala 64:22]
  assign cpu_reset = reset;
  assign cpu_io_instruction = mem_io_instruction; // @[src/main/scala/board/z710/Top.scala 69:24]
  assign cpu_io_instruction_valid = rom_loader_io_load_finished; // @[src/main/scala/board/z710/Top.scala 67:30]
  assign cpu_io_memory_bundle_read_data = ~rom_loader_io_load_finished ? 32'h0 : _GEN_22; // @[src/main/scala/board/z710/Top.scala 72:40 74:38]
  assign cpu_io_interrupt_flag = {{30'd0}, _cpu_io_interrupt_flag_T}; // @[src/main/scala/board/z710/Top.scala 66:27]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/board/z710/Top.scala 57:27]
      CPU_clkdiv <= 2'h0; // @[src/main/scala/board/z710/Top.scala 57:27]
    end else if (CPU_clkdiv == 2'h3) begin // @[src/main/scala/board/z710/Top.scala 60:18]
      CPU_clkdiv <= 2'h0;
    end else begin
      CPU_clkdiv <= _CPU_next_T_2;
    end
    if (reset) begin // @[src/main/scala/board/z710/Top.scala 88:26]
      led_count <= 32'h0; // @[src/main/scala/board/z710/Top.scala 88:26]
    end else if (led_count >= 32'h17d7840) begin // @[src/main/scala/board/z710/Top.scala 89:36]
      led_count <= 32'h0; // @[src/main/scala/board/z710/Top.scala 90:15]
    end else begin
      led_count <= _led_count_T_1; // @[src/main/scala/board/z710/Top.scala 92:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  CPU_clkdiv = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  led_count = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
