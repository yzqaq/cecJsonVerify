text1_path='text1'
text2_path='text2'
def  lineCompare():
    with open(text1_path) as file_1,open(text2_path) as file_2:
        text1=file_1.read()
        text2=file_2.read()
        set1=set(text1.split('\n'))

        set2=set(text1.split('\n'))
        print(set1)
        print(set2)
        print(set1-set2)
        print(set1-set2)
        print(set1 & set2)
        print(set1-(set1 & set2))
        print("************ text2-text1")
        print(set2-set1)
if __name__ == "__main__":  
    lineCompare()        

