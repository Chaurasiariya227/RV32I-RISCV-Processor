`timescale 1ns/1ps

module tb_data_memory;

reg clk;
reg MemRead;
reg MemWrite;

reg [31:0] address;
reg [31:0] write_data;

wire [31:0] read_data;

data_memory uut(

    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .address(address),
    .write_data(write_data),
    .read_data(read_data)

);

always #5 clk = ~clk;

initial begin

    clk = 0;

    // Write 100 to address 0
    MemWrite = 1;
    MemRead = 0;
    address = 0;
    write_data = 100;

    #10;

    // Read address 0
    MemWrite = 0;
    MemRead = 1;

    #10;

    $display("Read Data = %d", read_data);

    // Write 250 to address 4
    MemWrite = 1;
    MemRead = 0;
    address = 4;
    write_data = 250;

    #10;

    // Read address 4
    MemWrite = 0;
    MemRead = 1;

    #10;

    $display("Read Data = %d", read_data);

    $finish;

end

endmodule