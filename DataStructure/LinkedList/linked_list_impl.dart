import 'linked_list_itr.dart';
import 'linked_list_node.dart';

class LinkList {
  LinkListNode? head = null;
  LinkListNode? tail = null;
  isEmpty() => head == null;
  LinkList({head}) {
    if (head != null) {
      head = head;
      tail = head;
    }
  }

  LinkedListIterator begin() {
    return LinkedListIterator(head);
  }

  void insert({required int value}) {
    LinkListNode newNode = LinkListNode(value);
    if (isEmpty()) {
      this.head = newNode;
      this.tail = newNode;
    } else {
      this.tail?.next = newNode;
      this.tail = newNode;
    }
  }

  void printLin() {
    if (isEmpty()) {
      print('linkedList is Empty');
    } else {
      for (var itrr = this.begin(); itrr.current() != null; itrr.next()) {
        print(itrr.data());
      }
    }
  }

  LinkListNode? find(data) {
    if (isEmpty()) {
      print('linkedList is Empty');
    } else {
      for (var itrr = this.begin(); itrr.current() != null; itrr.next()) {
        if (data == itrr.data()) {
          return itrr.current();
        }
      }
    }
    return null;
  }

  void insertAfter({pointerData, data}) {
    LinkListNode newNode = LinkListNode(data);
    LinkListNode? node = find(pointerData);
    if (node != null) {
      if (node.next == null) {
        node.next = newNode;
        return;
      }
      newNode.next = node.next;
      node.next = newNode;
    } else {
      tail?.next = newNode;
    }
  }
  
}

void main(List<String> args) {
  LinkList newList = LinkList();
  newList.insert(value: 1);
  newList.insert(value: 2);
  newList.insert(value: 4);
  newList.insert(value: 6);
  newList.insert(value: 8);
  newList.insertAfter(pointerData: 10, data: 80, );
  newList.printLin();
}
