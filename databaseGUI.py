from tkinter import *
import tkinter.ttk as ttk
import DataFunc

class GUI(object):
    def __init__(self):
        self.login = Tk()
        self.login.title("Login to Database")
        self.login.geometry("{}x{}".format(220, 100))
        frame = Frame(self.login)
        frame.pack()
        dbLabel = Label(frame, text="Database")
        dbLabel.grid(row=1, column=0, sticky=W)
        self.dbVar = StringVar()
        dbEntry = ttk.Entry(frame, textvariable=self.dbVar)
        dbEntry.grid(row=1, column=1, sticky=W)
        uLabel = Label(frame, text="Username")
        uLabel.grid(row=2, column=0, sticky=W)
        self.uVar = StringVar()
        uEntry = ttk.Entry(frame, textvariable=self.uVar)
        uEntry.grid(row=2, column=1, sticky=W)
        passLabel = Label(frame, text="Password")
        passLabel.grid(row=3, column=0, sticky=W)
        self.passVar = StringVar()
        passEntry = ttk.Entry(frame, textvariable=self.passVar, show='*')
        passEntry.grid(row=3, column=1, sticky=W)
        button = ttk.Button(frame, text='Connect', command=self.connect)
        button.grid(row=4,column=0,sticky=W)
    def connect(self):
        DataFunc.connect(self.dbVar.get(),self.uVar.get(),self.passVar.get())
        self.login.destroy()
        self.gui()
        
    def gui(self):
        window = Tk()
        window.title("Gujek Database Application")
        window.configure()
        window.resizable(width=FALSE, height=FALSE)
        window.geometry("{}x{}".format(1000, 400))

        
        
        gojek = PhotoImage(master=window,file="gojek.gif")
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
        self.button1 = ttk.Button(self.frame1, text='Insert', command=self.insertData)

        self.button2 = ttk.Button(self.frame1, text='Update', command=self.updateData)
        
        self.button3 = ttk.Button(self.frame1, text='Delete',command=self.deleteData)
        


        frame2 = Frame(window)
        frame2.grid(row=3)

        scrolly = Scrollbar(frame2, orient="vertical")
        scrolly.pack(side=RIGHT, fill=Y)
        scrollx = Scrollbar(frame2, orient="horizontal")
        scrollx.pack(fill=X)

        self.box = ttk.Treeview(frame2, columns=("col1", "col2", 'col3'), selectmode="extended", displaycolumns=None) # this is how you set columns
        self.box.pack(side=LEFT, fill=Y)
        self.box.column('#0', stretch=NO, minwidth=0, width=0)

        scrolly.config(command=self.box.yview)
        scrollx.config(command=self.box.xview)
        self.box.config(xscrollcommand=scrollx.set, yscrollcommand=scrolly.set)
        window.mainloop()
            
    def change(self, val):
        tableLbl = Label(self.frame1, text="    Table:")
        tableLbl.grid(row=1, column=2, sticky=W)
        self.button1.grid(row=1,column=4,sticky=W)
        self.button2.grid(row=1,column=5,sticky=W)
        self.button3.grid(row=1,column=6,sticky=W)
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
        self.box.delete(*self.box.get_children())
        self.opVar.set("Show")
        self.columns = []
        
        for table in self.schemaCurr:
            if self.tableVar.get() == table:
                for col in DataFunc.getMetaData(self.new[0],table):
                    self.columns.append(col[0])
        self.box['columns'] = tuple(self.columns)
        for i in self.columns:
            self.box.column(i, minwidth=0, stretch=False)
            self.box.heading(i, text=i)
        data = DataFunc.getData(self.schemaVar.get(),self.tableVar.get())
        n = 0
        for d in data:
            self.box.insert("", "end", n, text=n, values=d)
            n += 1

    def deleteData(self):
        item = self.box.selection()
        current = self.box.item(item, "values")[0]
        DataFunc.delete(self.schemaVar.get(),self.tableVar.get(),current)

    def insertData(self):
        self.query(self.columns, typequery='insert')

    def updateData(self):
        self.query(self.columns, typequery='update')

    def query(self, questions, typequery):
        self.query = Tk()
        self.query.title("Enter Values")
        self.query.geometry("{}x{}".format(300, len(questions)*20+30))
        frame = Frame(self.query)
        frame.pack()
        quesArr = []
        self.entryArr = []
        for q in range(len(questions)):
            quesArr.append(Label(frame, text="{}".format(questions[q])))
            quesArr[q].grid(row=q+1, column=0, sticky=W)
            self.entryArr.append(Entry(frame))
            item = self.box.selection()
            for i in  self.entryArr:
                self.entryArr[q].insert(END, self.box.item(item, 'values')[q])
            self.entryArr[q].grid(row=q+1, column=1, sticky=W)
        if typequery == 'insert':  
            button = ttk.Button(frame, text='Connect',command=self.dataInsert)
        elif typequery == 'update':
            button = ttk.Button(frame, text='Connect',command=self.dataUpdate)
        button.grid(row=len(questions)+1,column=1,sticky=W)
        
    def dataInsert(self):
        data = []
        for i in self.entryArr:
            data.append(i.get())
        DataFunc.insert(self.schemaVar.get(),self.tableVar.get(),*data)
        self.query.destroy()

    def dataUpdate(self):      
        item = self.box.selection()
        data = []
        for i in self.entryArr:
            data.append(i.get())
        DataFunc.update(self.schemaVar.get(),self.tableVar.get(),self.box.item(item,"values"),*data)
        self.query.destroy()
GUI()
