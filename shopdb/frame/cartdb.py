from shopdb.frame.db import Db
from shopdb.frame.error import ErrorCode
from shopdb.frame.sql import Sql
from shopdb.frame.value import Cust, Item, Cart


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
    def select(self,custid):
        all = [];
        conn = super().getConnection();
        cursor = conn.cursor();
        cursor.execute(Sql.cartlist % custid);
        result = cursor.fetchall();
        for c in result:
            cart = Cart(c[0],c[1],c[2],c[3],c[4],c[5],c[6]);
            all.append(cart);
        super().close(cursor,conn);
        return all;

if __name__ == '__main__':
   CartDB().insert('id10',1005,6);
