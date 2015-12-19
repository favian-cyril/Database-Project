from tkinter import *
import tkinter.ttk as ttk
import DataFunc

class GUI(object):
    def __init__(self):
        window = Tk()
        window.title("Gujek Database Application")
        window.configure()
        window.resizable(width=FALSE, height=FALSE)
        window.geometry("{}x{}".format(900, 600))
        
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
        sch = []
        temp = DataFunc.getSchemas()
        for i in temp:
            sch.append(i[0])
        self.schemaVar.set(temp[0][0])
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

        self.box = ttk.Treeview(frame2, columns=("col1", "col2", 'col3'), selectmode="extended", displaycolumns=None) # this is how you set columns
        self.box.pack(side=LEFT, fill=Y)

        scrolly.config(command=self.box.yview)
        scrollx.config(command=self.box.xview)
        self.box.config(xscrollcommand=scrollx.set, yscrollcommand=scrolly.set)
        # this is how you change column name
        self.box.bind("<Double-1>", self.onClick)# test method untuk click event

        def inserttest():
            n = 0
            for i in range(20):
                self.box.insert("", "end", n, text=n, values=("test", "test again")) #this is how you add to table
                n += 1
    
        inserttest()

        window.mainloop()
            
    def change(self, val):
        tableLbl = Label(self.frame1, text="    Table:")
        tableLbl.grid(row=1, column=2, sticky=W)

        schema = DataFunc.getSchemas()
        self.new = []
        for s in schema:
            temp = (s[0],DataFunc.getTables(s[0]))
            self.new.append(temp)
        for s in self.new:
            if self.schemaVar.get() == s[0]:
                self.schemaCurr = s[1:]
                self.schemaCurr = self.schemaCurr[0]
        self.tableMenu = OptionMenu(self.frame1, self.tableVar,*self.schemaCurr, command=self.change2)
        self.tableMenu.grid(row=1, column=3, sticky=W)
    def change2(self, val):
        opLbl = Label(self.frame1, text="    Operation:")
        opLbl.grid(row=1, column=4, sticky=W)
        self.operation.grid(row=1, column=5, sticky=W)
        self.opVar.set("Show")
        temp = []
        for table in self.schemaCurr:
            if self.tableVar.get() == table:
                for col in DataFunc.getMetaData(self.new[0],table):
                    print(col)
                    temp.append(col[0])
        print(temp)
        self.box['columns'] = tuple(temp)
        for i in range(len(temp)):
            


    # method untuk click event
    def onClick(self, event):
        item = self.box.selection()
        print("You clicked on", self.box.item(item, "text"))

GUI()
