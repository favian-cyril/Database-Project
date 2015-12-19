from tkinter import *
import tkinter.ttk as ttk

class GUI(object):
    def __init__(self):
        window = Tk()
        window.title("Gujek Database Application")
        window.configure()
        window.resizable(width=FALSE, height=FALSE)
        window.geometry("{}x{}".format(700, 600))
        
        gojek = PhotoImage(file="gojek.gif")
        self.photo = Label(window, image=gojek)
        self.photo.grid(row=0, sticky=W)

        self.frame1 = Frame(window)
        self.frame1.grid(row=1, sticky=W)

        enter = Label(self.frame1, text=" ")
        enter.grid(row=0)

        schemaLbl = Label(self.frame1, text="Schema:")
        schemaLbl.grid(row=1, column=0, sticky=W)
        
        self.schemaVar = StringVar()
        sch = ["Schema 1", "Schema 2", "Schema 3"]
        self.schemaVar.set("Schema 1")
        schemaMenu = OptionMenu(self.frame1, self.schemaVar, *sch, command=self.change)
        schemaMenu.grid(row=1, column=1, sticky=W)

        enter2 = Label(window, text = " ")
        enter2.grid(row=2)

        self.tableVar = StringVar()

        self.opVar = StringVar()
        ops = ["Show", "Insert", "Update", "Delete"]
        self.operation = OptionMenu(self.frame1, self.opVar, *ops)

        frame2 = Frame(window)
        frame2.grid(row=3)

        scrolly = Scrollbar(frame2, orient="vertical")
        scrolly.pack(side=RIGHT, fill=Y)
        scrollx = Scrollbar(frame2, orient="horizontal")
        scrollx.pack(fill=X)

        self.box = ttk.Treeview(frame2, columns=("col1", "col2"), selectmode="extended", displaycolumns=None) # this is how you set columns
        self.box.pack(side=LEFT, fill=Y)

        scrolly.config(command=self.box.yview)
        scrollx.config(command=self.box.xview)
        self.box.config(xscrollcommand=scrollx.set, yscrollcommand=scrolly.set)
        
        self.box.heading("#0", text="col0") # this is how you change column name
        self.box.heading("col1", text="col1")
        self.box.heading("col2", text="col2")

        self.box.bind("<Double-1>", self.onClick)# test method untuk click event

        def inserttest():
            n = 0
            for i in range(20):
                self.box.insert("", "end", n, text=n, values=("test", "test again")) #this is how you add to table
                n += 1

        inserttest()

        window.mainloop()
            
    def change(self, val):
        T1flag = False
        T2flag = False
        T3flag = False

        tableLbl = Label(self.frame1, text="    Table:")
        tableLbl.grid(row=1, column=2, sticky=W)
    
        if self.schemaVar.get() == "Schema 1":   
            self.tableVar.set("S1 Table 1")
            self.tableS1Menu = OptionMenu(self.frame1, self.tableVar, "S1 Table 1", "S1 Table 2", "S1 Table 3", command=self.change2)
            if T2flag == True:
                self.tableS3Menu.grid_forget()
            if T3flag == True:
                self.tableS2Menu.grid_forget()
            self.tableS1Menu.grid(row=1, column=3, sticky=W)
            T1flag = True
        elif self.schemaVar.get() == "Schema 2":
            self.tableVar.set("S2 Table 1")
            self.tableS2Menu = OptionMenu(self.frame1, self.tableVar, "S2 Table 1", "S2 Table 2", "S2 Table 3", command=self.change2)
            if T1flag == True:
                self.tableS1Menu.grid_forget()
            if T3flag == True:
                self.tableS2Menu.grid_forget()
            self.tableS2Menu.grid(row=1, column=3, sticky=W)
            T2flag = True
        elif self.schemaVar.get() == "Schema 3":
            self.tableVar.set("S3 Table 1")
            self.tableS3Menu = OptionMenu(self.frame1, self.tableVar, "S3 Table 1", "S3 Table 2", "S3 Table 3", command=self.change2)
            if T2flag == True:
                self.tableS3Menu.grid_forget()
            if T1flag == True:
                self.tableS1Menu.grid_forget()
            self.tableS3Menu.grid(row=1, column=3, sticky=W)
            T3flag = True

    def change2(self, val):
        opLbl = Label(self.frame1, text="    Operation:")
        opLbl.grid(row=1, column=4, sticky=W)
        self.operation.grid(row=1, column=5, sticky=W)
        self.opVar.set("Show")


    # method untuk click event
    def onClick(self, event):
        item = self.box.selection()[0]
        print("You clicked on", self.box.item(item, "text"))

GUI()
