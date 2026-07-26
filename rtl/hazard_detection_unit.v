module hazard_detection_unit(

    input ID_EX_MemRead,
    input [4:0] ID_EX_rd,

    input [4:0] IF_ID_rs1,
    input [4:0] IF_ID_rs2,

    output reg PCWrite,
    output reg IF_ID_Write,
    output reg ControlMux

);

always @(*) begin

    if(ID_EX_MemRead &&
      ((ID_EX_rd == IF_ID_rs1) ||
       (ID_EX_rd == IF_ID_rs2)) &&
      (ID_EX_rd != 0))
    begin
        PCWrite     = 0;
        IF_ID_Write = 0;
        ControlMux  = 1;
    end
    else
    begin
        PCWrite     = 1;
        IF_ID_Write = 1;
        ControlMux  = 0;
    end

end

endmodule