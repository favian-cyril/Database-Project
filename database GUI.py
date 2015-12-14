from tkinter import *

class GUI(object):
    def __init__(self):
        window = Tk()
        window.title("Gujek Database Application")
        window.configure(background="spring green")
        window.resizable(width=FALSE, height=FALSE)
        window.geometry("{}x{}".format(500, 400))
        
        gojek = PhotoImage(file="gojek.gif")
        self.photo = Label(window, image=gojek)
        self.photo.pack()

        self.label = Label(window, text="Select Operation:", width=15, height=2, bg="spring green", font="Helvetica 16")
        self.label.pack()

        self.frame = Frame(window, bg="spring green")
        self.frame.pack()

        bt1 = Button(self.frame, text="SHOW", command=self.show, fg="#a1dbcd", bg="#383a39", width=33, height=5)
        bt1.grid(row=0, column=0, padx=3, pady=3)

        bt2 = Button(self.frame, text="CREATE", command=self.create, fg="#a1dbcd", bg="#383a39", width=33, height=5)
        bt2.grid(row=0, column=1)

        bt3 = Button(self.frame, text="UPDATE", command=self.update, fg="#a1dbcd", bg="#383a39", width=33, height=5)
        bt3.grid(row=1, column=0)

        bt4 = Button(self.frame, text="DELETE", command=self.delete, fg="#a1dbcd", bg="#383a39", width=33, height=5)
        bt4.grid(row=1, column=1)

        self.home = Button(window, text="BACK", command=self.home, fg="#a1dbcd", bg="#383a39", width=15, height=3)

        self.frame2 = Frame(window)
        Menu = Menu(self.frame2)
        TableMenu = Menu(Menu, tearoff=0)
        Menu.add_cascade(Label="Select Table", menu=TableMenu)
        TableMenu.add_command

        menu.pack()
        
        window.mainloop()

    def show(self):
        self.photo.pack_forget()
        self.label.pack_forget()
        self.frame.pack_forget()
        self.frame2.pack()
        self.home.pack()

    def create(self):
        self.photo.pack_forget()
        self.label.pack_forget()
        self.frame.pack_forget()
        self.home.pack()

    def update(self):
        self.photo.pack_forget()
        self.label.pack_forget()
        self.frame.pack_forget()
        self.home.pack()

    def delete(self):
        self.photo.pack_forget()
        self.label.pack_forget()
        self.frame.pack_forget()
        self.home.pack()

    def home(self):
        self.frame2.pack()
        self.home.pack_forget()
        self.photo.pack()
        self.label.pack()
        self.frame.pack()
        
        

GUI()
