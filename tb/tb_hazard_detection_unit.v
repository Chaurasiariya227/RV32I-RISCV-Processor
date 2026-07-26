`timescale 1ns/1ps

module tb_hazard_detection_unit;

reg ID_EX_MemRead;
reg [4:0] ID_EX_rd;

reg [4:0] IF_ID_rs1;
reg [4:0] IF_ID_rs2;

wire PCWrite;
wire IF_ID_Write;
wire ControlMux;

hazard_detection_unit uut(

.ID_EX_MemRead(ID_EX_MemRead),
.ID_EX_rd(ID_EX_rd),

.IF_ID_rs1(IF_ID_rs1),
.IF_ID_rs2(IF_ID_rs2),

.PCWrite(PCWrite),
.IF_ID_Write(IF_ID_Write),
.ControlMux(ControlMux)

);

initial begin

// Hazard
ID_EX_MemRead = 1;
ID_EX_rd = 5;

IF_ID_rs1 = 5;
IF_ID_rs2 = 2;

#10;

$display("Hazard : PCWrite=%b IF_ID_Write=%b ControlMux=%b",
PCWrite, IF_ID_Write, ControlMux);

// No Hazard
ID_EX_MemRead = 0;

#10;

$display("No Hazard : PCWrite=%b IF_ID_Write=%b ControlMux=%b",
PCWrite, IF_ID_Write, ControlMux);

$finish;

end

endmodule