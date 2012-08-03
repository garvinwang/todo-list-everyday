package com.todolisteveryday;

/**
 * 
 * @author 518
 * 
 *         <g:select name="status" from="${TodoStatus?.values()}"
 *         optionValue="displayString"/> lable <td>
 *         ${enumTestInstance?.status?.displayString}</td>lable
 * 
 */
public enum TodoStatus {

	READY("准备"),FINISH("完成"), INTERRUPTED("暂停"), PROCESS("进行中"), DELAYED("延期"), CANCEL("取消");

	String displayString;

	TodoStatus(String lable) {
		this.displayString = lable;
	}
}
