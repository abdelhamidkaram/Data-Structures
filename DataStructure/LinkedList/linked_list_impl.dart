class LinkListNode {
  int? data;
  LinkListNode? next;
  LinkListNode(this.data);
}

class LinkedListIterator {
  LinkListNode? _currentNode;
  LinkedListIterator(node) {
    this._currentNode = node;
  }

  data() {
    return this._currentNode!.data;
  }

  LinkedListIterator next() {
    this._currentNode = this._currentNode?.next;
    return this;
  }

  LinkListNode? current() {
    return this._currentNode;
  }
}

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
      for (var itrr = this.begin();  itrr.current()!= null; itrr.next()) {
        print(itrr.data());
      }
    }
  }
}

void main(List<String> args) {
  LinkList newList = LinkList();
  newList.insert(value: 1);
  newList.insert(value: 2);
  newList.insert(value: 3);
  newList.printLin();
}
