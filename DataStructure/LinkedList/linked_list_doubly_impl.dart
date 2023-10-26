import 'linked_list_itr.dart';
import 'linked_list_node.dart';

class LinkDoublyList {
  LinkListNode? head = null;
  LinkListNode? tail = null;
  isEmpty() => head == null;
  LinkDoublyList({head}) {
    if (head != null) {
      head = head;
      tail = head;
    }
  }

  LinkedListIterator begin() {
    return LinkedListIterator(head);
  }

  void insert({required int value}) {
    var newNode = LinkListNode(value);
    if (this.isEmpty()) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.back = tail;
      tail?.next = newNode;
      tail = newNode;
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

  void insertAfter({nodeData, newData}) {
    LinkListNode? node = find(nodeData);
    LinkListNode? newNode = LinkListNode(newData);
    if (tail == node) {
      insert(value: newData);
      return;
    }
    newNode.next = node?.next;
    newNode.back = node;
    node?.next = newNode;
  }

  void insertBefore({nodeData, newData}) {
    LinkListNode newNode = LinkListNode(newData);
    LinkListNode? node = find(nodeData);
    if (head == node) {
      newNode.next = head;
      head?.back = newNode;
      head = newNode;
    } else if (tail == node) {
      newNode.next = tail;
      tail?.back?.next = newNode;
      tail?.back = newNode;
    } else {
      newNode.next = node;
      newNode.back = node?.back;
      node?.back?.next = newNode;
    }
  }

  void delete({required data}) {
    LinkListNode? node = find(data);
    if (node != null) {
      if (node == head) {
         head = node.next;
         node.next?.back = null;
      } else if (tail == node) {
        tail?.back?.next = null;
        tail = tail?.back;
      } else {
        node.back?.next = node.next;
        node.next?.back = node.back;
      }
    }
  }
}

void main(List<String> args) {
  LinkDoublyList newList = LinkDoublyList();
  newList.insert(value: 1);
  newList.insert(value: 2);
  newList.insert(value: 3);
  newList.printLin();
  print('-------insert after  -------');
  newList.insertAfter(
    nodeData: 1,
    newData: 80,
  );
  newList.printLin();

  print('-------insert before  -------');
  newList.insertBefore(
    nodeData: 3,
    newData: 75,
  );
  newList.printLin();
  print('------- delete 80  -------');
  newList.delete(data: 80);
  newList.printLin();
}
