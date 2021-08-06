from frame.db import Db
from frame.error import ErrorCode
from frame.sql import Sql
from frame.value import Cust, Item


class CartDB(Db):


    def insert(self,custid,itemid,num):
        try:
            conn = super().getConnection();
            cursor = conn.cursor();
            cursor.execute(Sql.cartinsert % (custid,itemid,num));
            conn.commit();
        except:
            conn.rollback();
            raise Exception;
        finally:
            super().close(cursor,conn);
    # def select(self):
    #     all = [];
    #     conn = super().getConnection();
    #     cursor = conn.cursor();
    #     cursor.execute(Sql.itemlist);
    #     result = cursor.fetchall();
    #     for c in result:
    #         item = Item(c[0],c[1],c[2],c[3],c[4]);
    #         all.append(item);
    #     super().close(cursor,conn);
    #     return all;



if __name__ == '__main__':
    CartDB().insert('id01',1001,5);
