module processor(

    input clk,
    input reset

);

//--------------------
// Wires
//--------------------

wire [31:0] pc;
wire [31:0] pc_next;

wire [31:0] instruction;

wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUSrc;
wire MemtoReg;
wire [1:0] ALUOp;

wire [2:0] alu_control;

wire [31:0] read_data1;
wire [31:0] read_data2;

wire [31:0] immediate;

wire [31:0] alu_input2;
wire [31:0] alu_result;

wire [31:0] memory_data;
wire [31:0] write_back_data;

//--------------------
// Program Counter
//--------------------

assign pc_next = pc + 4;

pc PC(

    .clk(clk),
    .reset(reset),
    .pc_next(pc_next),
    .pc(pc)

);

//--------------------
// Instruction Memory
//--------------------

instruction_memory IM(

    .address(pc),
    .instruction(instruction)

);

//--------------------
// Control Unit
//--------------------

control_unit CU(

    .opcode(instruction[6:0]),

    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .MemtoReg(MemtoReg),
    .ALUOp(ALUOp)

);

//--------------------
// Register File
//--------------------

register_file RF(

    .clk(clk),
    .we(RegWrite),

    .rs1(instruction[19:15]),
    .rs2(instruction[24:20]),
    .rd(instruction[11:7]),

    .write_data(write_back_data),

    .read_data1(read_data1),
    .read_data2(read_data2)

);

//--------------------
// Immediate Generator
//--------------------

immediate_generator IG(

    .instruction(instruction),
    .immediate(immediate)

);

//--------------------
// ALU Control
//--------------------

alu_control AC(

    .ALUOp(ALUOp),
    .funct3(instruction[14:12]),
    .funct7(instruction[31:25]),

    .alu_control(alu_control)

);

//--------------------
// ALU
//--------------------

assign alu_input2 = (ALUSrc) ? immediate : read_data2;

alu ALU(

    .a(read_data1),
    .b(alu_input2),

    .alu_control(alu_control),

    .result(alu_result)

);

//--------------------
// Data Memory
//--------------------

data_memory DM(

    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),

    .address(alu_result),
    .write_data(read_data2),

    .read_data(memory_data)

);

//--------------------
// Write Back MUX
//--------------------

assign write_back_data =
        (MemtoReg) ? memory_data : alu_result;

endmodule