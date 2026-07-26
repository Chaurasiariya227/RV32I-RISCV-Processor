module pipeline_processor(

    input clk,
    input reset

);

//=========================
// IF Stage
//=========================

wire [31:0] pc;
wire [31:0] pc_next;
wire [31:0] instruction;

assign pc_next = pc + 4;

pc PC(
    .clk(clk),
    .reset(reset),
    .pc_next(pc_next),
    .pc(pc)
);

instruction_memory IM(
    .address(pc),
    .instruction(instruction)
);

//=========================
// IF/ID Register
//=========================

wire [31:0] ifid_pc;
wire [31:0] ifid_instruction;

if_id IF_ID(

    .clk(clk),
    .reset(reset),

    .pc_in(pc),
    .instruction_in(instruction),

    .pc_out(ifid_pc),
    .instruction_out(ifid_instruction)

);

//=========================
// Control Unit
//=========================

wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUSrc;
wire MemtoReg;
wire [1:0] ALUOp;

control_unit CU(

    .opcode(ifid_instruction[6:0]),

    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .MemtoReg(MemtoReg),
    .ALUOp(ALUOp)

);

//=========================
// Register File
//=========================

wire [31:0] read_data1;
wire [31:0] read_data2;

register_file RF(

    .clk(clk),
    .we(1'b0),

    .rs1(ifid_instruction[19:15]),
    .rs2(ifid_instruction[24:20]),
    .rd(5'd0),

    .write_data(32'd0),

    .read_data1(read_data1),
    .read_data2(read_data2)

);

endmodule